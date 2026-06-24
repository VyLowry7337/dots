return {

  {
    'xzbdmw/colorful-menu.nvim',
    event = 'LspAttach',
    opts = {},
  },

  {
    'OXY2DEV/helpview.nvim',
    ft = 'help',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {},
  },

  {
    'nvim-zh/colorful-winsep.nvim',
    event = { 'WinLeave' },
    config = function()
      require('colorful-winsep').setup({
        border = 'rounded',
        indicator_for_2wins = {
          position = false,
          symbols = {
            start_left = '󱞫 ',
            end_left = '󱞩 ',
            start_down = '󱞽 ',
            end_down = '󱞿 ',
            start_up = '󱞡 ',
            end_up = '󱞣 ',
            start_right = '󱞧 ',
            end_right = '󱞥 ',
          },
        },
      })
    end,
  },

  {
    'zerochae/dbab.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'tpope/vim-dadbod',
    },
    config = function()
      require('dbab').setup({
        connections = {
          { name = 'local', url = 'sqlite:///Users/dom/Workspace/Projects/CS50/PSets/Finance(Wk9)/finance.db' },
        },

        executor = 'dadbod',
        layout = 'classic',
        sidebar = {
          width = 0.3,
          use_brand_icon = true,
          use_brand_color = true,
          show_brand_name = false,
          show_system_schemas = true,
        },
        editor = {
          show_tabbar = true,
        },
      })
    end,
  },
}
