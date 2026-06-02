local M = {}

local mode = require "ui.mode"

M.get_special_mode = mode.get_special
M.get_mode = mode.get

M.set_mode_info = function(mode, hl, icon)
   local hl_prefix = "%#"
   local hl_suffix = "#"
   local icon_part = icon and (icon .. " ") or ""
   local current_mode = hl_prefix .. hl .. hl_suffix .. " " .. icon_part .. mode .. " "

   return current_mode .. "%*"
end

M.is_activewin = function()
   return vim.api.nvim_get_current_win() == vim.g.statusline_winid
end

M.stbufnr = function()
   return vim.api.nvim_win_get_buf(vim.g.statusline_winid)
end

M.remove_callback_string = function(input)
   return input:gsub("%(%) callback%%[*]%%#NavicSeparator# >", "%%#NavicSeparator# >"):gsub("%(%) callback%%[*]", "")
end

M.remove_quoted_strings = function(input)
   if input:find "vue" then
      return input:gsub('"', ""):gsub(".vue", "")
   end

   return input:gsub("%b()", "")
end

M.reduce_by_window_width = function(input)
   local colmns = vim.o.columns
   local depth_limit_indicator = "%#NavicDepthLimitIndicator#.."
   local depth_limit = 3
   local input_length = #input
   
   -- More conservative thresholds to preserve navic hierarchy
   if colmns > 100 then
      return input
   end
   
   if colmns < 80 or input_length > 300 then
      depth_limit = 2
   end
   
   if colmns < 50 or input_length > 500 then
      depth_limit = 1
   end
   
   local parts = {}
   
   local input_parts = vim.fn.split(input, ">")
   for i = 0, #input_parts do
      table.insert(parts, input_parts[i])
   end
   
   if #parts <= depth_limit then
      return input
   end
   
   -- Instead of just taking the last parts, preserve the first part (root) and last parts
   -- This maintains better context: [first] .. [indicator] .. [last parts]
   if depth_limit >= 2 and #parts > 2 then
      -- Keep first part, add indicator, then keep last (depth_limit-1) parts
      local first_part = parts[1]
      local last_parts = vim.list_slice(parts, #parts - (depth_limit - 1) + 1, #parts)
      parts = {first_part}
      table.insert(parts, "%#NavicSeparator#" .. depth_limit_indicator .. " %*")  -- Placeholder, will be replaced
      for _, part in ipairs(last_parts) do
         table.insert(parts, part)
      end
   elseif #parts > depth_limit then
      -- Fallback to original behavior for edge cases
      parts = vim.list_slice(parts, #parts - depth_limit + 1, #parts)
   end
   
   local separator = "%#NavicSeparator#" .. depth_limit_indicator .. " %*"
   if not parts[1] == separator then
      -- Find where to insert the separator (after first part if we restructured)
      local insert_pos = 2
      if #parts >= 2 and not parts[2]:find("%#NavicSeparator#") then
         insert_pos = 2
      else
         insert_pos = 1
      end
      table.insert(parts, insert_pos, separator)
   end
   
   local result = table.concat(parts, ">")
   return (separator .. "%#NavicSeparator#" .. ">" .. "%* " .. result) or input
end

M.remove_module_segment_in_vue = function(input)
   if not input:find ".vue" then
      return input
   end

   local parts = {}

   local input_parts = vim.fn.split(input, ">")
   for i = 0, #input_parts do
      table.insert(parts, input_parts[i])
   end

   table.remove(parts, 1)

   return table.concat(parts, ">"):sub(2)
end

M.remove_class_name = function(input)
   -- Process the string while preserving navic highlight groups (%#...#)
   -- Split by highlight groups, process only the content parts
   local parts = {}
   local current = ""
   local in_highlight = false
   
   for i = 1, #input do
      local char = input:sub(i, i)
      if char == '%' and i < #input and input:sub(i+1, i+1) == '#' then
         -- Start of highlight group
         if not in_highlight and current ~= "" then
            table.insert(parts, {type = "content", text = current})
            current = ""
         end
         in_highlight = true
         current = current .. char
      elseif char == '#' and in_highlight then
         -- End of highlight group
         current = current .. char
         if i < #input and input:sub(i+1, i+1) == '%' then
            -- This is likely the end of a highlight group (%#...#%)
            table.insert(parts, {type = "highlight", text = current})
            current = ""
            in_highlight = false
            -- Skip the next % as we'll catch it in the next iteration
         end
      else
         current = current .. char
      end
   end
   
   if current ~= "" then
      if in_highlight then
         table.insert(parts, {type = "highlight", text = current})
      else
         table.insert(parts, {type = "content", text = current})
      end
   end
   
   -- Process only content parts
   for i, part in ipairs(parts) do
      if part.type == "content" then
         part.text = part.text:gsub("(%w+)%.[%w%-%.]+", "%1")
      end
   end
   
   -- Reassemble
   local result = ""
   for _, part in ipairs(parts) do
      result = result .. part.text
   end
   
   return result
end

return M