require("render-markdown").setup({

    completions = { blink = { enabled = true } },
    heading = {
        render_modes = true,
        icons = { "󰬺  ", "󰬻  ", "󰬼  ", "󰬽  ", "󰬾  ", "󰬿  " },
        position = "inline",
        backgrounds = {},
    },
    checkbox = {
        unchecked = { icon = "󰄱 " },
        checked = { icon = "󰄵 " },
        custom = { todo = { rendered = " " } },
    },
    quote = { repeat_linebreak = true },
    pipe_table = {
        preset = "round",
        alignment_indicator = "",
    },
    link = {
        wiki = { icon = "󰇈 " },
        custom = {
            python = { pattern = "%.py$", icon = "󰌠 " },
            markdown = { pattern = "%.md$", icon = "󰍔 " },
        },
    },
    sign = { enabled = false },
    latex = { enabled = false },

    code = {
        sign = false,
        border = "thin",
        position = "right",
        width = "block",
        above = "▁",
        below = "▔",
        language_left = "█",
        language_right = "█",
        language_border = "▁",
        left_pad = 1,
        right_pad = 1,
    },
})
