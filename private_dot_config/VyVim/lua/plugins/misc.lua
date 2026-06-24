return {
  {
    'urtzienriquez/learnlua.nvim',
    cmd = 'Learn',
  },

  ---@module 'leetcode'
  {
    'kawre/leetcode.nvim',
    cmd = 'Leet',
    build = ':TSUpdate html',
    dependencies = {
      'folke/snacks.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
    },
    opts = {
      arg = 'leetcode',
      lang = 'python3',
      plugins = { non_standalone = true },
      logging = false,
      picker = { provider = 'snacks-picker' },
      image_support = true,
    },
  },
}
