require('configs.lsp').defaults()

local sev = vim.diagnostic.severity
local signs = {
  Error = ' ',
  Warn = ' ',
  Hint = ' ',
  Info = ' ',
}

vim.diagnostic.config({
  virtual_text = false,
  update_in_insert = false,
  severity_sort = true,
  underline = false,
  signs = {
    severity = { min = vim.diagnostic.severity.ERROR },
    text = {
      [sev.ERROR] = signs.Error,
      [sev.WARN] = signs.Warn,
      [sev.HINT] = signs.Hint,
      [sev.INFO] = signs.Info,
    },
  },
})

local active_servers = {
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
  'yamlls',
}

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
      },
      runtime = { version = 'LuaJIT' },
      workspace = {
        library = {
          vim.fn.expand('$VIMRUNTIME/lua'),
          vim.fn.expand('$VIMRUNTIME/lua/vim/lsp'),
          vim.fn.stdpath('data') .. '/lazy/lazy.nvim/lua/lazy',
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
})

vim.lsp.config('vtsls', {
  filetypes = { 'typescript', 'javascript' },
  settings = {
    vtsls = {
      diagnostics = {
        enable = true,
      },
    },
  },
})

vim.lsp.config('ty', {
  settings = {
    ty = {
      configurationFile = '/Users/dom/.config/lsp/ty/ty.toml',
      showSyntaxErrors = false,
      inlayHints = {
        variableTypes = false,
        callArgumentNames = false,
      },
      completions = {
        autoImport = false,
      },
    },
  },
})

vim.lsp.config('jsonls', {
  settings = {
    schemas = require('schemastore').json.schemas(),
    validate = { enable = true },
  },
})

vim.lsp.config('yamlls', {
  settings = {
    yaml = {
      schemaStore = {
        enable = false,
        url = '',
      },
      schemas = require('schemastore').yaml.schemas(),
    },
  },
})

vim.lsp.config('html', {
  filetypes = {
    'html',
    'htmldjango',
    'templ',
  },

  init_options = {
    provideFormatter = true,
  },

  settings = {
    html = {
      format = {
        wrapLineLength = 120,
        unformatted = 'code,pre,em,strong,span',
      },

      hover = {
        documentation = true,
        references = true,
      },
    },
  },
})

for _, server in ipairs(active_servers) do
  vim.lsp.enable(server)
end
