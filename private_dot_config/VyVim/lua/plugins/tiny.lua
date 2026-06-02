return {
  {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'LspAttach', -- Or `LspAttach`
    priority = 1000,
    config = function()
      require('tiny-inline-diagnostic').setup({
        signs = {
          -- left = "",
          -- right = "",
          diag = ' ',
          arrow = '',
          up_arrow = '',
          vertical = ' ',
          vertical_end = ' ',
        },
        transparent_bg = true,
        transparent_cursorline = false,
        options = {
          use_icons_from_diagnostic = false,
          show_source = {
            enabled = true,
          },
          virt_texts = {
            priority = 5000,
          },
          override_open_float = true,
          add_messages = {
            messages = false,
            display_count = true,
            use_max_severity = true,
            show_multiple_glyphs = true,
          },
          multilines = {
            enabled = true,
            always_show = true,
          },

          show_diags_only_under_cursor = true,
          show_all_diags_on_cursorline = true,

          severity = {
            vim.diagnostic.severity.ERROR,
            vim.diagnostic.severity.WARN,
          },
        },
      })
    end,
  },

  {
    'rachartier/tiny-code-action.nvim',
    event = 'LspAttach',
    opts = {
      backend = 'delta',
      picker = 'buffer',
    },
  },
}
