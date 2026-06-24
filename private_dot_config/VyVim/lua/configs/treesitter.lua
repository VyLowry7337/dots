local options = {
  ensure_installed = {
    'bash',
    'html',
    'css',
    'jinja',
    'jinja_inline',
    'javascript',
    'fish',
    'lua',
    'luadoc',
    'markdown',
    'printf',
    'toml',
    'vim',
    'vimdoc',
    'yaml',
    'sql',
    'c',
    'typescript',
    'tsx',
    'python',
  },

  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
  },

  indent = { enable = true },

  rainbow = {
    enable = true,
    query = 'rainbow-parens',
  },
}

require('nvim-treesitter.config').setup(options)

vim.treesitter.language.register('tmux', 'tmux')
vim.treesitter.language.register('tmux', 'conf')
