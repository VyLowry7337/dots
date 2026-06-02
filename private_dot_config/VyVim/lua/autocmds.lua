local cmd = vim.api.nvim_command
local aucmd = vim.api.nvim_create_autocmd

-- Navic LSP Attach
aucmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.documentSymbolProvider then
      require('nvim-navic').attach(client, args.buf)
    end
  end,
})

-- Resize splits if window resized
aucmd({ 'VimResized' }, {
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd('tabdo wincmd =')
    vim.cmd('tabnext' .. current_tab)
  end,
})

-- Disable Ruff's Hover
aucmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end
    if client.name == 'ruff' then
      client.server_capabilities.hoverProvider = false
    end
  end,
  desc = 'LSP: Disable hover capability from Ruff',
})

-- Open Dash if no buffers open
aucmd('BufDelete', {
  callback = function()
    local bufs = vim.t.bufs
    if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == '' then
      vim.cmd('GnDashboard')
    end
  end,
})

-- Disable auto-commenting on newlines for all file types
aucmd('FileType', {
  pattern = '*',
  desc = 'Prevent comment continuation',
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { 'c', 'r', 'o' }
  end,
})

-- Yank Highlight
aucmd('TextYankPost', {
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
})

-- Relative Numbers in [Normal]
aucmd({ 'InsertEnter' }, {
  callback = function()
    local fname = vim.fn.bufname()
    if fname == 'copilot-chat' or vim.bo.buftype == 'nofile' then
      return
    end
    vim.opt_local.relativenumber = false
    vim.opt_local.number = true
  end,
})

-- Absolute Numbers in [Insert]
aucmd({ 'InsertLeave' }, {
  callback = function()
    local fname = vim.fn.bufname()
    if fname == 'copilot-chat' or vim.bo.buftype == 'nofile' then
      return
    end
    vim.opt_local.relativenumber = true
  end,
})

-- Close floats/specific windows with 'q'
aucmd('FileType', {
  desc = "Define windows to close with 'q'",
  pattern = {
    'gitcommit',
    'gitrebase',
    'dap-float',
    'gitconfig',
    'help',
    'startuptime',
    'qf',
    'lspinfo',
    'man',
    'checkhealth',
    'tsplayground',
    'dap-float',
    'empty',
    'noice',
    'neotest-output',
    'neotest-summary',
    'neotest-output-panel',
    'nvcheatsheet',
    'grug-far',
    'grug-far-history',
    'grug-far-help',
  },
  command = [[
            nnoremap <buffer><silent> q :close<CR>
            set nobuflisted
        ]],
})

-- Autosave after leaving insert mode in HTML docs
vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = '*.html',
  callback = function()
    -- Only run if the buffer's filetype is html
    if vim.bo.filetype == 'html' then
      vim.cmd('silent! write')
    end
  end,
  desc = 'Auto-save HTML on leaving insert mode for live preview',
})

-- JSON Comment Diagnostic Bypass
-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(args)
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--
--     if client == nil then
--       return
--     end
--
--     -- Ignore trailing commas in jsonc
--     if client.name == 'json' and client:supports_method('textDocument/publishDiagnostics') then
--       local orig_handler = vim.lsp.handlers['textDocument/publishDiagnostics']
--
--       vim.lsp.handlers['textDocument/publishDiagnostics'] = function(err, result, ctx, config)
--         if result and result.uri:match('%.jsonc$') and result.diagnostics then
--           -- Iterate backward so table.remove is safe
--           for i = #result.diagnostics, 1, -1 do
--             if result.diagnostics[i].code == 519 then
--               table.remove(result.diagnostics, i)
--             end
--           end
--         end
--         -- Pass the filtered diagnostics back to Neovim
--         orig_handler(err, result, ctx, config)
--       end
--     end
--   end,
-- })

-- Snacks Notifier LSP Progress
local progress = vim.defaulttable()
vim.api.nvim_create_autocmd('LspProgress', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local value = ev.data.params.value
    if not client or type(value) ~= 'table' then
      return
    end
    local p = progress[client.id]

    for i = 1, #p + 1 do
      if i == #p + 1 or p[i].token == ev.data.params.token then
        p[i] = {
          token = ev.data.params.token,
          msg = ('[%3d%%] %s%s'):format(
            value.kind == 'end' and 100 or value.percentage or 100,
            value.title or '',
            value.message and (' **%s**'):format(value.message) or ''
          ),
          done = value.kind == 'end',
        }
        break
      end
    end

    local msg = {}
    progress[client.id] = vim.tbl_filter(function(v)
      return table.insert(msg, v.msg) or not v.done
    end, p)

    local spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }
    vim.notify(table.concat(msg, '\n'), 'info', {
      id = 'lsp_progress',
      title = client.name,
      opts = function(notif)
        notif.icon = #progress[client.id] == 0 and ' '
          or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})

aucmd('FileType', {
  pattern = '*',
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

local create_cmd = vim.api.nvim_create_user_command

create_cmd('TSInstallAll', function()
  local spec = require('lazy.core.config').plugins['nvim-treesitter']
  local opts = type(spec.opts) == 'table' and spec.opts or {}
  require('nvim-treesitter').install(opts.ensure_installed)
end, {})
