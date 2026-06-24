return {
  'Mirsmog/real-icons.nvim',
  build = ':RealIconsInstallPack material',
  config = function()
    require('real-icons').setup({
      pack = 'flow',
      packs = {
        flow = {
          type = 'vscode',
          path = vim.fn.expand('~/.config/BACKUPS/VSCode/27_05_26/extensions/thang-nm.flow-icons-2.0.3/'),
          theme = 'flow-dim',
          license = 'personal',
        },
      },
      integrations = {
        snacks_picker = true,
      },
    })
  end,
}
