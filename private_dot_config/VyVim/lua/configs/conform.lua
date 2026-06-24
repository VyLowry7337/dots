---@module "conform"
---@type conform.setupOpts
local options = {
  formatters_by_ft = {
    markdown = { 'mdslw' },
    bash = { 'beautysh' },
    zsh = { 'shfmt' },
    json = { 'jq' },
    lua = { 'stylua' },
    css = { 'prettierd' },
    html = { 'prettierd' },
    htmldjango = { 'prettierd' },
    jinja = { 'prettierd' },
    jinja2 = { 'prettierd' },
    yaml = { 'prettierd' },
    toml = { 'tombi' },
    python = {
      'ruff_fix',
      'ruff_format',
      'ruff_organize_imports',
    },
    javascript = { 'prettierd' },
    sql = { 'sleek' },
  },

  default_format_opts = {
    lsp_format = 'fallback',
  },

  format_on_save = {
    timeout_ms = 5000,
  },

  formatters = {
    mdslw = { prepend_args = { '--stdin-filepath', '$FILENAME' } },
    prettierd = {
      condition = function(self, ctx)
        local jinja_fts = { htmldjango = true, jinja = true, jinja2 = true }
        if jinja_fts[vim.bo[ctx.buf].filetype] then
          return true
        end
        return true
      end,
    },
  },
}

return options
