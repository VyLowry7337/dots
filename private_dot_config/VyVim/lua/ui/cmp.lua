local colors = require('theme.palettes.' .. require('vyrc').theme.palette)

local bg0 = colors.code_block -- Surface0
local bg1 = colors.obsidian -- Surface1

-- Background Helper Fnc
local function hex_to_rgb(hex)
  return tonumber(hex:sub(2, 3), 16), tonumber(hex:sub(4, 5), 16), tonumber(hex:sub(6, 7), 16)
end

local function rgb_to_hex(r, g, b)
  return string.format('#%02x%02x%02x', r, g, b)
end

local function blend(fg, bg, alpha)
  local r1, g1, b1 = hex_to_rgb(fg)
  local r2, g2, b2 = hex_to_rgb(bg)

  local r = math.floor(r1 * alpha + r2 * (1 - alpha))
  local g = math.floor(g1 * alpha + g2 * (1 - alpha))
  local b = math.floor(b1 * alpha + b2 * (1 - alpha))

  return rgb_to_hex(r, g, b)
end

local style = 'atom_colored' -- default / atom_colored

local kind_links = {
  BlinkCmpKindFunction = { link = 'Function' },
  BlinkCmpKindMethod = { link = 'Function' },
  BlinkCmpKindConstructor = { link = '@constructor' },
  BlinkCmpKindVariable = { link = '@variable' },
  BlinkCmpKindField = { link = '@variable.member' },
  BlinkCmpKindProperty = { link = '@property' },
  BlinkCmpKindIdentifier = { link = 'Identifier' },
  BlinkCmpKindSnippet = { link = 'Special' },
  BlinkCmpKindText = { link = 'String' },
  BlinkCmpKindClass = { link = 'Type' },
  BlinkCmpKindInterface = { link = 'Type' },
  BlinkCmpKindModule = { link = '@module' },
  BlinkCmpKindKeyword = { link = 'Keyword' },
  BlinkCmpKindConstant = { link = 'Constant' },
  BlinkCmpKindEnum = { link = 'Type' },
  BlinkCmpKindEnumMember = { link = 'Constant' },
  BlinkCmpKindStruct = { link = 'Structure' },
  BlinkCmpKindUnit = { link = 'Number' },
  BlinkCmpKindValue = { link = 'Number' },
  BlinkCmpKindEvent = { link = 'Special' },
  BlinkCmpKindOperator = { link = 'Operator' },
  BlinkCmpKindTypeParameter = { link = 'Type' },
  BlinkCmpKindFile = { link = 'Directory' },
  BlinkCmpKindFolder = { link = 'Directory' },
  BlinkCmpKindReference = { link = 'Special' },
  BlinkCmpKindColor = { link = 'Special' },

  BlinkCmpKindTextFunction = { link = 'Function' },
  BlinkCmpKindTextMethod = { link = 'Function' },
  BlinkCmpKindTextConstructor = { link = '@constructor' },
  BlinkCmpKindTextVariable = { link = '@variable' },
  BlinkCmpKindTextField = { link = '@variable.member' },
  BlinkCmpKindTextProperty = { link = '@property' },
  BlinkCmpKindTextIdentifier = { link = 'Identifier' },
  BlinkCmpKindTextSnippet = { link = 'Special' },
  BlinkCmpKindTextText = { link = 'String' },
  BlinkCmpKindTextClass = { link = 'Type' },
  BlinkCmpKindTextInterface = { link = 'Type' },
  BlinkCmpKindTextModule = { link = '@module' },
  BlinkCmpKindTextKeyword = { link = 'Keyword' },
  BlinkCmpKindTextConstant = { link = 'Constant' },
  BlinkCmpKindTextEnum = { link = 'Type' },
  BlinkCmpKindTextEnumMember = { link = 'Constant' },
  BlinkCmpKindTextStruct = { link = 'Structure' },
  BlinkCmpKindTextUnit = { link = 'Number' },
  BlinkCmpKindTextValue = { link = 'Number' },
  BlinkCmpKindTextEvent = { link = 'Special' },
  BlinkCmpKindTextOperator = { link = 'Operator' },
  BlinkCmpKindTextTypeParameter = { link = 'Type' },
  BlinkCmpKindTextFile = { link = 'Directory' },
  BlinkCmpKindTextFolder = { link = 'Directory' },
  BlinkCmpKindTextReference = { link = 'Special' },
  BlinkCmpKindTextColor = { link = 'Special' },
}

local kind_bg = {
  blue = blend(colors.navy, colors.bg, 0.25),
  mauve = blend(colors.mauve, colors.bg, 0.25),
  red = blend(colors.red, colors.bg, 0.25),
  green = blend(colors.green, colors.bg, 0.25),
  yellow = blend(colors.yellow, colors.bg, 0.25),
  peach = blend(colors.peach, colors.bg, 0.25),
  sapphire = blend(colors.sapphire, colors.bg, 0.25),
  lavender = blend(colors.lavender, colors.bg, 0.25),
  neutral = blend(colors.white, colors.bg, 0.25),
}

local atom_colored_kinds = {
  -- Functions / methods → blue
  BlinkCmpKindFunction = { fg = colors.navy, bg = kind_bg.blue },
  BlinkCmpKindMethod = { fg = colors.navy, bg = kind_bg.blue },
  BlinkCmpKindConstructor = { fg = colors.navy, bg = kind_bg.blue },

  -- Variables / structs → mauve
  BlinkCmpKindVariable = { fg = colors.yellow, bg = kind_bg.yellow },
  BlinkCmpKindStruct = { fg = colors.yellow, bg = kind_bg.yellow },
  BlinkCmpKindUnit = { fg = colors.yellow, bg = kind_bg.yellow },

  -- Fields / properties → red
  BlinkCmpKindField = { fg = colors.red, bg = kind_bg.red },
  BlinkCmpKindProperty = { fg = colors.red, bg = kind_bg.red },
  BlinkCmpKindIdentifier = { fg = colors.red, bg = kind_bg.red },
  BlinkCmpKindSnippet = { fg = colors.red, bg = kind_bg.red },

  -- Text / interface → green
  BlinkCmpKindText = { fg = colors.green, bg = kind_bg.green },
  BlinkCmpKindInterface = { fg = colors.green, bg = kind_bg.green },

  -- Classes → sapphire
  BlinkCmpKindClass = { fg = colors.sapphire, bg = kind_bg.sapphire },

  -- Modules / constants
  BlinkCmpKindModule = { fg = colors.yellow, bg = kind_bg.yellow },
  BlinkCmpKindConstant = { fg = colors.peach, bg = kind_bg.peach },

  -- Keywords (more neutral)
  BlinkCmpKindKeyword = { fg = colors.white, bg = kind_bg.neutral },

  -- Enums
  BlinkCmpKindEnum = { fg = colors.navy, bg = kind_bg.blue },
  BlinkCmpKindEnumMember = { fg = colors.lavender, bg = kind_bg.lavender },

  -- Values / events
  BlinkCmpKindValue = { fg = colors.lavender, bg = kind_bg.lavender },
  BlinkCmpKindEvent = { fg = colors.yellow, bg = kind_bg.yellow },

  -- Subtle / neutral kinds
  BlinkCmpKindOperator = { fg = colors.pearl, bg = kind_bg.neutral },
  BlinkCmpKindReference = { fg = colors.pearl, bg = kind_bg.neutral },
  BlinkCmpKindColor = { fg = colors.pearl, bg = kind_bg.neutral },

  BlinkCmpKindTypeParameter = { fg = colors.red, bg = kind_bg.red },

  BlinkCmpKindFile = { fg = colors.white, bg = kind_bg.neutral },
  BlinkCmpKindFolder = { fg = colors.white, bg = kind_bg.neutral },
}

local kind_text_hl = {
  BlinkCmpKindTextFunction = { fg = colors.navy, italic = true },
  BlinkCmpKindTextMethod = { fg = colors.navy, italic = true },
  BlinkCmpKindTextConstructor = { fg = colors.navy, italic = true },

  BlinkCmpKindTextVariable = { fg = colors.yellow, italic = true },
  BlinkCmpKindTextStruct = { fg = colors.yellow, italic = true },
  BlinkCmpKindTextUnit = { fg = colors.yellow, italic = true },

  BlinkCmpKindTextField = { fg = colors.red, italic = true },
  BlinkCmpKindTextProperty = { fg = colors.red, italic = true },
  BlinkCmpKindTextIdentifier = { fg = colors.red, italic = true },
  BlinkCmpKindTextSnippet = { fg = colors.red, italic = true },

  BlinkCmpKindTextText = { fg = colors.green, italic = true },
  BlinkCmpKindTextInterface = { fg = colors.green, italic = true },

  BlinkCmpKindTextClass = { fg = colors.sapphire, italic = true },

  BlinkCmpKindTextModule = { fg = colors.yellow, italic = true },
  BlinkCmpKindTextConstant = { fg = colors.peach, italic = true },

  BlinkCmpKindTextKeyword = { fg = colors.mauve, italic = true },

  BlinkCmpKindTextEnum = { fg = colors.navy, italic = true },
  BlinkCmpKindTextEnumMember = { fg = colors.lavender, italic = true },

  BlinkCmpKindTextValue = { fg = colors.lavender, italic = true },
  BlinkCmpKindTextEvent = { fg = colors.yellow, italic = true },

  BlinkCmpKindTextOperator = { fg = colors.pearl, italic = true },
  BlinkCmpKindTextReference = { fg = colors.pearl, italic = true },
  BlinkCmpKindTextColor = { fg = colors.pearl, italic = true },

  BlinkCmpKindTextTypeParameter = { fg = colors.red, italic = true },

  BlinkCmpKindTextFile = { fg = colors.white, italic = true },
  BlinkCmpKindTextFolder = { fg = colors.white, italic = true },
}

local is_atom = style == 'atom_colored'

local M = {}

M.override = {
  BlinkCmpLabel = { fg = colors.white },
  BlinkCmpLabelMatch = { fg = colors.blue, bold = true },
  BlinkCmpMenuSelection = { link = 'PmenuSel', bold = true },
  BlinkCmpMenuBorder = { fg = colors.float_border },
  BlinkCmpKind = { fg = colors.comment },
  BlinkCmpMenu = { bg = colors.bg2 },
  BlinkCmpDoc = is_atom and { bg = colors.bg } or { bg = colors.none },
  BlinkCmpDocBorder = is_atom and { fg = colors.bg, bg = colors.bg } or { fg = colors.float_border, bg = colors.none },
}

M.add = is_atom and vim.tbl_deep_extend('force', atom_colored_kinds, kind_text_hl) or kind_links

M.draw = {
  padding = 0,
  gap = 1,
  columns = {
    { 'kind_icon' },
    { 'label', 'label_description', gap = 1 },
  },
  components = {
    kind_icon = {
      text = function(ctx)
        return ' ' .. ctx.kind_icon .. ' '
      end,
      highlight = function(ctx)
        return 'BlinkCmpKind' .. ctx.kind
      end,
    },
    kind = {
      text = function(ctx)
        return ctx.kind .. ' '
      end,
      highlight = function(ctx)
        return 'BlinkCmpKindText' .. ctx.kind
      end,
    },
  },
}

M.menu = {
  scrollbar = false,
  border = 'none',
}

M.documentation = {
  window = { border = 'single' },
  draw = function(opts)
    if opts.item and opts.item.documentation and opts.item.documentation.value then
      local out = require('pretty_hover.parser').parse(opts.item.documentation.value)
      opts.item.documentation.value = out:string()
    end

    opts.default_implementation(opts)
  end,
}

return M
