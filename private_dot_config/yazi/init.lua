-- Git Symbols
th.git = th.git or {}
th.git.unknown_sign = " "
th.git.modified_sign = " "
th.git.deleted_sign = " "
th.git.clean_sign = " "

require("starship"):setup({})

require("easyjump"):setup({
	icon_fg = "#9494e1",
	first_key_fg = "#da6282",
})

require("git"):setup({
	order = 1500,
})

require("no-status"):setup()
