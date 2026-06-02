local map = vim.keymap.set
local del = vim.keymap.del
local opts = { noremap = true, silent = true }

-- Better Up/Down
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
map({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
map({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })

-- Change '^' & '0'
map('n', '0', '^', { noremap = true })
map('n', '^', '0', { noremap = true })

-- Better Identing </>
map('v', '<', '<gv', { desc = 'Indent left' })
map('v', '>', '>gv', { desc = 'Indent right' })

-- Yazi
map('n', '<leader><space>', '<cmd>Yazi<CR>', { desc = 'Yazi' })

-- General Helpers
map('n', '<leader>fn', '<cmd>enew<CR>', { desc = 'New File' })
map('n', ';', ':', { desc = 'CMD enter command mode' }) -- ';' for cmdline
map('n', '<C-q>', '<cmd>wqall<CR>', { desc = 'Save All & Exit' }) -- Save all and Exit
map('n', '<C-C>', 'ciw') -- Change Inner Word Shortcut
map({ 'n' }, '<C-s>', '<cmd> w <cr>') -- Quicksave

-- Noice
map('n', '<leader>na', function()
  require('noice').cmd('history')
end, { desc = 'Noice All' })
map('n', '<leader>nd', function()
  require('noice').cmd('dismiss')
end, { desc = 'Noice Dismiss' })
map('n', '<leader>nt', function()
  require('noice').cmd('telescope')
end, { desc = 'Noice TS' })
map('n', '<leader>ne', function()
  require('noice').cmd('errors')
end, { desc = 'Noice Errors' })
map('n', '<leader>nl', function()
  require('noice').cmd('last')
end, { desc = 'Noice Last' })

-- Neogen

-- Telescope (When not using Snacks)
-- map("n", "<leader>ft", "<cmd>Telescope<CR>", { desc = "TS Pickers" })
-- map("n", "<leader>fj", "<cmd>Telescope jumplist<CR>", { desc = "TS Jumplist" })
-- map("n", "<leader>fc", "<cmd>Telescope colorscheme<CR>", { desc = "TS Colorschemes" })
-- map("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "TS Keymaps" })
-- map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "TS Find Buffers" })
-- map("n", "<leader>fh", "<cmd>Telescope highlights<CR>", { desc = "TS Highlights" })
-- map("n", "<leader>fH", "<cmd>Telescope help_tags<CR>", { desc = "TS Help Page" })
-- map("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "TS Marks" })
-- map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "TS Recents" })
-- map("n", "<leader>fw", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "TS Search Buffer" })
-- map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "TS Git Commits" })
-- map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "TS Git Status" })
-- map("n", "<leader>fT", "<cmd>Telescope terms<CR>", { desc = "TS Terminals" })
-- map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "TS Find Files" })
-- map(
--     "n",
--     "<leader>fa",
--     "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
--     { desc = "TS Find All Files" }
-- )

-- Snacks Pickers (When not using Telescope)
map({ 'n', 'v' }, '<C-n>', function()
  Snacks.explorer()
end, { desc = 'Snacks Explorer' })
map('n', '<leader>lc', function()
  Snacks.picker.lsp_config()
end, { desc = 'LSP Configurations' })
map('n', '<leader>ff', function()
  Snacks.picker.smart()
end, { desc = 'Find Files' })
map('n', '<leader>fr', function()
  Snacks.picker.recent()
end, { desc = 'Find Recent' })
map('n', '<leader>fg', function()
  Snacks.picker.grep()
end, { desc = 'Grep' })
map('n', '<leader>fq', function()
  Snacks.picker.qflist()
end, { desc = 'Quickfix List' })
map('n', '<leader>ft', function()
  Snacks.picker.todo_comments()
end, { desc = 'Todo Comments' })
map('n', '<leader>fb', function()
  Snacks.picker.buffers()
end, { desc = 'Find Buffers' })
map('n', '<leader>fH', function()
  Snacks.picker.help()
end, { desc = 'Help Pages' })
map('n', '<leader>fm', function()
  Snacks.picker.marks()
end, { desc = 'Find Marks' })
map('n', '<leader>fi', function()
  Snacks.picker.icons()
end, { desc = 'Icon Search' })
map('n', '<leader>gl', function()
  Snacks.lazygit()
end, { desc = 'Lazygit' })
map('n', '<leader>fh', function()
  Snacks.picker.highlights()
end, { desc = 'Highlight Search' })
map('n', '<leader>gl', function()
  Snacks.picker.git_log()
end, { desc = 'Git Log' })
map('n', '<leader>gs', function()
  Snacks.picker.git_status()
end, { desc = 'Git Status' })
map('n', '<leader>fk', function()
  Snacks.picker.keymaps()
end, { desc = 'Keymap Search' })
map('n', '<leader>fp', function()
  Snacks.picker.lazy()
end, { desc = 'Plugin Specs Search' })

-- Snacks Toggles
Snacks.toggle.option('wrap', { name = 'Wrap' }):map('<leader>ow')
Snacks.toggle.diagnostics():map('<leader>od')
Snacks.toggle.dim():map('<leader>oD')
Snacks.toggle.indent():map('<leader>oi')
Snacks.toggle.zoom():map('<leader>oZ')
Snacks.toggle.zen():map('<leader>oz')

-- Yanky
map({ 'n', 'x' }, 'y', '<Plug>(YankyYank)')
map({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)')
map({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)')
map({ 'n', 'x' }, 'gp', '<Plug>(YankyGPutAfter)')
map({ 'n', 'x' }, 'gP', '<Plug>(YankyGPutBefore)')
-- map("n", "<c-=>", "<Plug>(YankyPreviousEntry)")
-- map("n", "<c-->", "<Plug>(YankyNextEntry)")
map('n', ']p', '<Plug>(YankyPutIndentAfterLinewise)')
map('n', '[p', '<Plug>(YankyPutIndentBeforeLinewise)')
map('n', ']P', '<Plug>(YankyPutIndentAfterLinewise)')
map('n', '[P', '<Plug>(YankyPutIndentBeforeLinewise)')
map('n', '>p', '<Plug>(YankyPutIndentAfterShiftRight)')
map('n', '<p', '<Plug>(YankyPutIndentAfterShiftLeft)')
map('n', '>P', '<Plug>(YankyPutIndentBeforeShiftRight)')
map('n', '<P', '<Plug>(YankyPutIndentBeforeShiftLeft)')
map('n', '=p', '<Plug>(YankyPutAfterFilter)')
map('n', '=P', '<Plug>(YankyPutBeforeFilter)')

-- Conform (Formatter)
map('n', '<leader>cf', function()
  require('conform').format({ async = true })
end, { desc = 'Format File' })

-- Buffers
map('n', '<S-l>', function()
  require('ui.bufline').next()
end, { desc = 'Buffer Next' })
map('n', '<S-h>', function()
  require('ui.bufline').prev()
end, { desc = 'Buffer Prev' })
map('n', '<leader>X', function()
  require('ui.bufline').close_buffer()
end, { desc = 'Buffer Close' })

-- Comment lines
map('n', '<leader>/', '<cmd>normal gcc<cr>', { desc = 'Comment' })
map('v', '<leader>/', '<cmd>normal gcc<cr>', { desc = 'Comment' })

-- Move Line Up and Down
-- map("v", "J", ":m '>+1<CR>gv==kgvo<esc>=kgvo", { desc = "move highlighted text down" })
-- map("v", "K", ":m '<-2<CR>gv==jgvo<esc>=jgvo", { desc = "move highlighted text up" })

-- Insert Mode Navigation
map('i', '<C-b>', '<ESC>^i', { desc = 'move beginning of line' })
map('i', '<C-e>', '<End>', { desc = 'move end of line' })
map('i', '<C-h>', '<Left>', { desc = 'move left' })
map('i', '<C-l>', '<Right>', { desc = 'move right' })
map('i', '<C-j>', '<Down>', { desc = 'move down' })
map('i', '<C-k>', '<Up>', { desc = 'move up' })

-- Window Navigation (Ctrl + H,J,K,L)
map('n', '<C-h>', '<C-w>h', { desc = 'switch window left' })
map('n', '<C-l>', '<C-w>l', { desc = 'switch window right' })
map('n', '<C-j>', '<C-w>j', { desc = 'switch window down' })
map('n', '<C-k>', '<C-w>k', { desc = 'switch window up' })

-- Clear Search Highlights
map('n', '<Esc>', '<cmd>noh<CR>', { desc = 'general clear highlights' })

map('n', '<leader>H', '<cmd>GnDashboard<CR>', { desc = 'Dashboard' })

-- Terminal
map('n', '<C-\\', function()
  require('snacks').terminal()
end, { desc = 'Terminal' })
map('t', '<C-x>', '<C-\\><C-N>', { desc = 'Escape Terminal Mode' })

-- Tiny Inline Diagnostics Toggles
map('n', '<leader>de', '<cmd>TinyInlineDiag enable<cr>', { desc = 'Enable diagnostics' })
map('n', '<leader>dd', '<cmd>TinyInlineDiag disable<cr>', { desc = 'Disable diagnostics' })
map('n', '<leader>dt', '<cmd>TinyInlineDiag toggle<cr>', { desc = 'Toggle diagnostics' })
map('n', '<leader>dc', '<cmd>TinyInlineDiag toggle_cursor_only<cr>', { desc = 'Toggle cursor-only diagnostics' })
map('n', '<leader>dr', '<cmd>TinyInlineDiag reset<cr>', { desc = 'Reset diagnostic options' })

-- Pretty Hover
-- map('n', 'K', function()
--   require('pretty_hover').hover()
-- end, { silent = true })

del('n', '[d')
del('n', ']d')

map('n', '[d', function()
  require('lemon').diagnostic_next()
end, { desc = 'LSP diagnostic next', nowait = true })
map('n', ']d', function()
  require('lemon').diagnostic_prev()
end, { desc = 'LSP diagnostic prev', nowait = true })
map('n', '<leader>ca', function()
  require('lemon').code_action()
end, { desc = 'LSP code action', nowait = true })
map('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'LSP rename', nowait = true })
-- map('n', 'F', function()
--   Snacks.picker.lsp_references()
-- end, { desc = 'LSP references', nowait = true })
map('n', 'K', function()
  require('lemon').hover()
end, { desc = 'hover doc', nowait = true })
-- map('n', '<leader>lo', function()
--   Snacks.picker.lsp_symbols()
-- end, { desc = 'LSP symbols', nowait = true })
map('n', '<leader>gd', function()
  require('lemon').definition()
end, { desc = 'LSP goto definition', nowait = true, noremap = true })
map('n', '<leader>oh', function()
  require('lemon').inlay_hint.toggle()
end, { desc = 'Toggle inlay hints', noremap = true })

-- Tiny Code Action
-- map({ 'n', 'x' }, '<leader>ca', function()
--   require('tiny-code-action').code_action()
-- end, { desc = 'Code Action', noremap = true, silent = true })
