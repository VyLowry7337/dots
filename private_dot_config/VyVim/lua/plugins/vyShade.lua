return {
  'VyLowry7337/VyShade.nvim',
  event = 'VeryLazy',
  opts = {
    mode = 'virtual',
    virt_text = '󱓻 ',
    highlight = { hex = true, lspvars = true },
  },
  config = function(_, opts)
    require('VyShade').setup(opts)
  end,
}
