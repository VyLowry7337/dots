local M = {}

M.theme = {
  palette = 'catppuccinMocha',
  transparent = false,
}

M.style = 'compact'

M.statusline = {
  enabled = true,
  order = {
    'mode',
    'filetype',
    'git_branch',
    'git_diff',
    '%=',
    'lsp_progress',
    'navic',
    '%=',
    'diagnostics',
    'lsp',
    'cwd',
    'cursor',
  },
}

M.bufline = {
  enabled = true,
  align = 'center',
}

M.dashboard = {
  grid = {
    { 'header', 'header', 'header' },
    { 'find', 'recent', 'new' },
    { 'lastSession', 'sessionSelect', 'config' },
    { 'lazy', 'quit', 'mason' },
    { 'footer', 'footer', 'footer' },
  },

  separator = ' ',

  components = {
    header = {
      type = 'ascii',
      content = require('ui.assets.ascii.vyvim').bloody,
      hl = 'GnDashAscii',
    },
    find = {
      type = 'action',
      icon = ' ',
      label = 'Find File',
      key = 'ff',
      desc = 'Search files',
      group = 'project',
      action = 'lua Snacks.picker.files()',
    },
    recent = {
      type = 'action',
      icon = ' ',
      label = 'Recent',
      key = 'fr',
      desc = 'Recent files',
      group = 'history',
      action = 'lua Snacks.picker.recent()',
    },
    grep = {
      type = 'action',
      icon = '󰈭 ',
      label = 'Grep',
      key = 'fw',
      desc = 'Search text',
      group = 'project',
      action = 'lua Snacks.picker.grep()',
    },
    marks = {
      type = 'action',
      icon = ' ',
      label = 'Bookmarks',
      key = 'fm',
      desc = 'Saved marks',
      group = 'history',
      action = 'lua Snacks.picker.marks()',
    },
    new = {
      type = 'action',
      icon = ' ',
      label = 'New File',
      key = 'fn',
      desc = 'Empty buffer',
      group = 'project',
      action = 'enew | startinsert',
    },
    config = {
      type = 'action',
      icon = ' ',
      label = 'Config',
      key = 'c',
      desc = 'Neovim config',
      group = 'tools',
      action = "lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })",
    },
    mason = {
      type = 'action',
      icon = ' ',
      label = 'Mason',
      key = 'm',
      desc = 'LSP manager',
      group = 'tools',
      action = 'Mason',
    },
    quit = {
      type = 'action',
      icon = ' ',
      label = 'Quit',
      key = 'q',
      desc = 'Exit neovim',
      group = 'system',
      action = 'qa',
    },
    lazy = {
      type = 'action',
      icon = '󰒲 ',
      label = 'Lazy',
      key = 'pm',
      desc = 'Plugin manager',
      group = 'tools',
      action = 'Lazy',
    },
    git = {
      type = 'action',
      icon = ' ',
      label = 'Git Status',
      key = 'gs',
      desc = 'Changed files',
      group = 'git',
      action = 'lua Snacks.picker.git_status()',
    },
    keys = {
      type = 'action',
      icon = ' ',
      label = 'Keymaps',
      key = 'fk',
      desc = 'Key bindings',
      group = 'tools',
      action = 'lua Snacks.picker.keymaps()',
    },
    health = {
      type = 'action',
      icon = ' ',
      label = 'Health',
      key = 'ch',
      desc = 'Check health',
      group = 'tools',
      action = 'checkhealth',
    },
    sessionSelect = {
      type = 'action',
      icon = ' ',
      label = 'Sessions',
      key = 'ss',
      desc = 'Session select',
      group = 'history',
      action = "lua require('persistence').select()",
    },
    lastSession = {
      type = 'action',
      icon = '󱈅 ',
      label = 'Resume Session',
      key = 'sr',
      desc = 'Resume last session',
      group = 'project',
      action = "lua require('persistence').load()",
    },
    footer = {
      type = 'text',
      hl = 'GnDashFooter',
      content = function()
        local stats = require('lazy').stats()
        return string.format('󱌥 %d/%d plugins in %dms', stats.loaded, stats.count, math.floor(stats.startuptime))
      end,
    },
  },
}

return M
