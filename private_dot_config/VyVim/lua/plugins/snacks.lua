local pad = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' }

local main_layout = {
  preset = function()
    return vim.o.columns >= 120 and 'telescope' or 'vertical'
  end,
}

local layouts = {
  telescope = {
    reverse = false,
    layout = {
      box = 'horizontal',
      backdrop = false,
      height = 0.9,
      border = pad,
      {
        box = 'vertical',
        {
          win = 'input',
          height = 1,
          border = pad,
          title = '{title} {live} {flags}',
          title_pos = 'center',
        },
        { win = 'list', title = ' Results ', title_pos = 'center', border = pad },
      },
      {
        win = 'preview',
        title = '{preview:Preview}',
        width = 0.51,
        border = pad,
        title_pos = 'center',
      },
    },
  },
}

local exclude_patterns = {
  'node_modules',
  '.git',
  '.DS_Store',
  '*.png',
  '*.svg',
  '*.mp4',
  '*.jpg',
  '*.jpeg',
  '*.bundle.js',
  '*.mjs',
  '*.cjs',
}

local sources = {
  files = {
    title = ' Files',
    hidden = false,
    ignored = false,
    exclude = exclude_patterns,
  },
  grep = {
    title = ' Grep',
    hidden = false,
    ignored = false,
    regex = false,
    exclude = exclude_patterns,
  },
  recent = { title = '󰋚 Recent' },
  buffers = { title = '󰈚 Buffers' },
  help = { title = '󰛵 Help' },
  lines = { title = '󰗈 Lines' },
  git_status = { title = ' Git Status' },
  git_branches = { title = ' Branches' },
  git_log = { title = ' Git Log' },
  qflist = { title = ' Quickfix' },
  projects = { title = ' Projects' },
  commands = { title = ' Commands' },
  keymaps = { title = '󰌌 Keymaps' },
  diagnostics = { title = ' Diagnostics' },
  lsp_references = { title = ' References' },
  lsp_definitions = { title = ' Definitions' },
  lsp_implementations = { title = ' Implementations' },
  lsp_type_definitions = { title = '󰊄 Type Definitions' },
  lsp_symbols = { title = ' Symbols' },
  lsp_workspace_symbols = { title = ' Workspace Symbols' },
  marks = { title = '󰃀 Marks' },
  registers = { title = ' Registers' },
  colorschemes = { title = ' Colorschemes' },
  highlights = { title = '󰸱 Highlights' },
  git_diff = { title = ' Git Diff' },
  git_stash = { title = '󰏗 Git Stash' },
  resume = { title = '󰁯 Resume' },
  undo = { title = '󰕌 Undo' },
  notifications = { title = '󰂚 Notifications' },
  pickers = { title = ' Pickers' },
  smart = { title = 'Smart Files' },
  lazy = { title = 'Plugin Specs' },
}

for _, source in pairs(sources) do
  source.layout = main_layout
end

sources.explorer = {
  prompt = ' ',
  -- prompt = "  ",
  hidden = true,
  ignored = true,
  filter = {
    filter = function(item, filter)
      if item.ignored and not filter:is_empty() then
        return false
      end
      return true
    end,
  },
  format = function(item, picker)
    local ret = Snacks.picker.format.file(item, picker)
    if not item.parent and item.dir then
      for i, entry in ipairs(ret) do
        if entry.virtual then
          ret[i][1] = Snacks.picker.util.align(' ', picker.opts.formatters.file.icon_width or 2)
          ret[i][2] = 'SnacksPickerRoot'
          break
        end
      end
    end
    return ret
  end,
  layout = {
    preview = 'main',
    layout = {
      backdrop = false,
      width = 25,
      min_width = 25,
      height = 0,
      position = 'right',
      border = 'none',
      box = 'vertical',
      { win = 'input', height = 1, border = 'none' },
      { win = 'list', border = 'none' },
    },
  },
  diagnostics = false,
  git_status = false,
  git_untracked = false,
  icons = {
    files = {
      enabled = true,
      dir = '󰉋 ',
      dir_open = '󰝰 ',
      file = '󰈔 ',
    },
    git = {
      enabled = true,
      staged = ' ',
      added = '󰍌 ',
      deleted = '󰚃 ',
      ignored = '󰮔 ',
      modified = '󰣕 ',
      renamed = '󰛿 ',
      unmerged = ' ',
      untracked = ' ',
      commit = '󰜘 ',
    },
    tree = {
      vertical = ' ', -- vertical = "│ ",
      middle = ' ', -- middle = "├╴",
      last = ' ', -- last = "└╴",
    },
  },
  win = {
    input = {
      wo = { winbar = '' },
      keys = {
        ['<Esc>'] = { 'focus_list', mode = { 'n', 'i' } },
      },
    },
    list = {
      wo = { number = false, relativenumber = false, winbar = '' },
      keys = {
        ['<C-n>'] = 'close',
        ['<c-t>'] = false,
      },
    },
  },
}

local config = {
  image = { enabled = false },
  dim = { enabled = true },
  scope = {
    enabled = true,
    treesitter = {
      enabled = true,
      blocks = {
        enabled = true,
      },
    },
  },
  indent = {
    enabled = true,
    indent = {
      -- hl = {
      --   'IndentBlanklineIndent1',
      --   'IndentBlanklineIndent2',
      --   'IndentBlanklineIndent3',
      --   'IndentBlanklineIndent4',
      --   'IndentBlanklineIndent5',
      --   'IndentBlanklineIndent6',
      -- },
    },

    animate = {
      enabled = not vim.g.neovide,
      style = 'up_down',
      duration = {
        step = 50,
        total = 1000,
      },
    },

    scope = {
      enabled = true,
      underline = false,
    },

    chunk = {
      enabled = true,
    },
  },
  input = {
    enabled = true,
    win = {
      keys = {
        i_esc = { '<esc>', { 'cmp_close', 'cancel' }, mode = 'i', expr = true },
      },
    },
  },
  notifier = {
    enabled = true,
    style = 'fancy',
    icons = {
      error = ' ',
      warn = ' ',
      info = ' ',
      debug = ' ',
      trace = ' ',
    },
  },
  quickfile = { enabled = true },
  statuscolumn = { enabled = false },
  terminal = {
    enabled = true,
    win = {
      wo = { style = 'terminal', number = false, relativenumber = false },
    },
  },
  explorer = {
    replace_netrw = true,
  },
  picker = {
    enabled = true,
    previewers = {
      diff = {
        style = 'terminal',
      },
    },
    win = {
      preview = {
        wo = { fillchars = 'eob: ', wrap = false, winbar = ' ' },
      },
      input = {
        keys = {
          ['<Esc>'] = { 'close', mode = { 'n', 'i' } },
        },
      },
    },
    sources = sources,
  },

  lazygit = {
    enabled = true,
    configure = true,
  },
  toggle = { enabled = true },
  terminal = {
    enabled = true,
    win = { style = 'terminal' },
  },
  zen = { enabled = true },
  styles = {
    notification = {
      wo = { wrap = true },
    },
  },
}

return {
  'folke/snacks.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('snacks').setup(config)
    local original_icon = Snacks.util.icon
    Snacks.util.icon = function(name, cat, icon_opts)
      if cat == 'file' and name then
        name = vim.fs.basename(name)
      end
      return original_icon(name, cat, icon_opts)
    end
  end,
}
