return {

  {
    'folke/ts-comments.nvim',
    event = 'VeryLazy',
    opts = {},
  },

  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = {},
    keys = {
      {
        '<leader>ss',
        function()
          require('persistence').load()
        end,
        desc = 'Restore Session',
      },
      {
        '<leader>sS',
        function()
          require('persistence').select()
        end,
        desc = 'Select Session',
      },
      {
        '<leader>sl',
        function()
          require('persistence').load({ last = true })
        end,
        desc = 'Restore Last Session',
      },
      {
        '<leader>sd',
        function()
          require('persistence').stop()
        end,
        desc = "Don't Save Current Session",
      },
    },
  },

  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    ---@class wk.Opts
    opts = {
      preset = 'helix',

      win = {
        padding = { 0, 1 },
        wo = {},
      },
    },

    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show({ global = false })
        end,
        desc = 'Buffer Keymaps (which-key)',
      },
      {
        '<c-w><space>',
        function()
          require('which-key').show({ keys = '<c-w>', loop = true })
        end,
        desc = 'Window Hydra Mode (which-key)',
      },
    },
  },
}
