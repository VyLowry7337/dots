return {

  {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
    dependencies = { 'junegunn/fzf.vim', lazy = true },
    opts = {
      preview = {
        show_title = true,
        winblend = 0,
      },
    },
  },

  {
    'danymat/neogen',
    opts = {},
  },

  -- NvChad Plugins
  {
    'nvzone/minty',
    dependencies = { 'nvzone/volt' },
    cmd = { 'Shades', 'Huefy' },
  },

  {
    'nvzone/typr',
    dependencies = 'nvzone/volt',
    opts = {},
    cmd = { 'Typr', 'TyprStats' },
  },

  {
    'mikavilpas/yazi.nvim',
    version = '*',
    event = 'VeryLazy',
    dependencies = {
      { 'nvim-lua/plenary.nvim', lazy = true },
    },
    opts = {
      change_neovim_cwd_on_close = true,
      floating_window_scaling_factor = 0.75,
      yazi_floating_window_border = 'single',
    },
  },

  {
    'andymass/vim-matchup',
    lazy = false,
    opts = {},
  },

  {
    'MagicDuck/grug-far.nvim',
    opts = {},
  },

  {
    'gbprod/cutlass.nvim',
    opts = { exclude = { 'ns', 'nS' } },
  },

  {
    'gbprod/yanky.nvim',
    opts = {},
  },

  {
    'brianhuster/live-preview.nvim',
    lazy = true,
    enabled = true,
    ft = { 'markdown', 'html' },
    cmd = { 'LivePreview' },
    config = function()
      require('configs.livepreview')
    end,
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('configs.rendermd')
    end,
  },

  {
    'windwp/nvim-ts-autotag',
    event = 'BufReadPre',
    config = function()
      require('nvim-ts-autotag').setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
      })
    end,
  },

  {
    'folke/ts-comments.nvim',
    event = 'VeryLazy',
    opts = {},
  },

  {
    'Fildo7525/pretty_hover',
    event = 'LspAttach',
    opts = {
      border = 'single',
      wrap = true,
    },
  },

  {
    'tpope/vim-sleuth',
  },

  {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    cmd = 'ConformInfo',
    opts = require('configs.conform'),
  },

  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile', 'InsertLeave' },
    config = function()
      require('configs.linter')
    end,
  },

  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('configs.lspconfig')
    end,
  },

  {
    'mason-org/mason.nvim',
    cmd = { 'Mason', 'MasonInstall', 'MasonUpdate' },
    dependencies = { 'b0o/schemastore.nvim' },
    opts = {
      PATH = 'skip',

      ui = {
        icons = {
          package_pending = ' ',
          package_installed = ' ',
          package_uninstalled = ' ',
        },
      },

      max_concurrent_installers = 10,
    },
  },

  {
    'mason-org/mason-lspconfig.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-lspconfig' },
    config = function()
      require('configs.mason-lspconfig')
    end,
  },

  {
    'whoissethdaniel/mason-tool-installer.nvim',
  },

  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPre' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      branch = 'main',
    },
    config = function()
      require('configs.treesitter')
    end,
  },

  {
    'zerochae/lemon.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'LspAttach',
    opts = {
      scope = {
        biscuit = { enabled = true, visible_mode = 'hover' },
      },

      inlay_hint = { enabled = false },

      signature_help = { auto = false },
      hover = {},
      diagnostic = {
        footer = {
          enabled = true,
          show_desc = false,
        },
      },
      code_action = {
        footer = {
          enabled = true,
          show_desc = false,
        },
      },
    },
  },
}
