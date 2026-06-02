local mason = require('mason-lspconfig').setup({
  automatic_enable = {
    'vtsls',
    'lua_ls',
    'ty',
    'ruff',
    'bashls',
    'cssls',
    'fish_lsp',
    'html',
    'jsonls',
    'tombi',
    -- 'yamlls', -- Some gitlab.duo problem
  },

  ensure_installed = {
    'vtsls',
    'lua_ls',
    'ty',
    'ruff',
    'bashls',
    'cssls',
    'fish_lsp',
    'html',
    'jinja_lsp',
    'jsonls',
    'tombi',
    'yamlls',
    'stylua',
  },
})
