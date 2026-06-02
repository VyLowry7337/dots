local cmp_ui = require('ui.cmp')

return {
  {
    {
      'saghen/blink.cmp',
      enabled = function()
        return not vim.tbl_contains({ 'typr' })
      end,
      version = '1.*',
      event = { 'InsertEnter', 'CmdLineEnter' },
      dependencies = {
        'rafamadriz/friendly-snippets',
        {
          'L3MON4D3/LuaSnip',
          dependencies = 'rafamadriz/friendly-snippets',
          opts = { history = true, updateevents = 'TextChanged,TextChangedI' },
          config = function(_, opts)
            require('luasnip').config.set_config(opts)
            require('configs.luasnip')
          end,
        },
      },
      ---@module 'blink.cmp'
      opts = {
        keymap = {
          preset = 'super-tab',
          ['<Tab>'] = {
            function(cmp)
              if cmp.snippet_active() then
                return cmp.accept()
              else
                return cmp.select_and_accept()
              end
            end,
            'snippet_forward',
            'fallback',
          },
          ['<S-TAB'] = { 'snippet_backward', 'fallback' },
          ['`'] = { 'show', 'show_documentation', 'hide_documentation' },
          ['<C-e>'] = { 'hide', 'fallback' },
          ['<C-n>'] = { 'select_next', 'fallback' },
          ['<C-p>'] = { 'select_prev', 'fallback' },
          ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
          ['<C-f>'] = { 'scroll_documentation_up', 'fallback' },
          ['<CR>'] = false,
          ['<C-k>'] = false,
        },
        snippets = { preset = 'luasnip' },
        sources = {
          default = { 'lazydev', 'snippets', 'lsp', 'buffer', 'path' },
          providers = {
            lazydev = {
              name = 'LazyDev',
              module = 'lazydev.integrations.blink',
              score_offset = 100,
            },
          },
        },
        signature = {
          enabled = false,
          window = { show_documentation = true, treesitter_highlighting = true, border = 'single' },
          trigger = { enabled = false },
        },
        completion = {
          ghost_text = { enabled = false },
          documentation = vim.tbl_deep_extend('force', {
            auto_show = true,
            auto_show_delay_ms = 200,
          }, cmp_ui.documentation),
          menu = vim.tbl_deep_extend('force', {
            winhighlight = 'Normal:BlinkCmpMenu,CursorLine:BlinkCmpMenuSelection,Search:None,FloatBorder:BlinkCmpMenuBorder',
            draw = vim.tbl_deep_extend('force', {
              treesitter = { 'lsp' },
            }, cmp_ui.draw),
          }, cmp_ui.menu),
        },
      },
      fuzzy = { implementation = 'prefer_rust' },
      cmdline = { enabled = true },
      appearance = {
        nerd_font_variant = 'mono',
        kind_icons = {
          Namespace = '󰌗',
          Text = '󰉿',
          Method = '󰆧',
          Function = '󰆧',
          Constructor = '',
          Field = '󰜢',
          Variable = '󰀫',
          Class = '󰠱',
          Interface = '',
          Module = '',
          Property = '󰜢',
          Unit = '󰑭',
          Value = '󰎠',
          Enum = '',
          Keyword = '󰌋',
          Snippet = '',
          Color = '󱓻',
          File = '󰈚',
          Reference = '󰈇',
          Folder = '󰉋',
          EnumMember = '',
          Constant = '󰏿',
          Struct = '󰙅',
          Event = '',
          Operator = '󰆕',
          TypeParameter = '󰊄',
          Table = '',
          Object = '󰅩',
          Tag = '',
          Array = '[]',
          Boolean = '',
          Number = '',
          Null = '󰟢',
          String = '󰉿',
          Calendar = '',
          Watch = '󰥔',
          Package = '',
        },
      },
    },
  },
  {
    'saghen/blink.pairs',
    version = '*',
    dependencies = 'saghen/blink.download',
    --- @module 'blink.pairs'
    opts = {
      highlights = {
        enabled = true,
        groups = {
          'BlinkPairsRed',
          'BlinkPairsOrange',
          'BlinkPairsYellow',
          'BlinkPairsGreen',
          'BlinkPairsCyan',
          'BlinkPairsBlue',
          'BlinkPairsViolet',
        },
        matchparen = {
          enabled = false,
          cmdline = false,
        },
      },

      mappings = {
        enabled = true,
        cmdline = true,
        pairs = {},
      },
    },
  },
}
