return {
    {
        "nvim-mini/mini.animate",
        cond = not vim.g.neovide,
        event = "VeryLazy",
        opts = {},
    },

    {
        "nvim-mini/mini.ai",
        version = "*",
        opts = {},
    },

    {
        "nvim-mini/mini.splitjoin",
        version = "*",
        event = "BufEnter",
        config = true,
    },

    {
        "nvim-mini/mini.move",
        version = "*",
        opts = {
            mappings = {
                -- Move visual selection in Visual mode.
                left = "<S-h>",
                right = "<S-l>",
                down = "<S-j>",
                up = "<S-k>",

                -- Move current line in Normal mode
                line_left = "",
                line_right = "",
                line_down = "",
                line_up = "",
            },

            -- Options which control moving behavior
            options = {
                -- Automatically reindent selection during linewise vertical move
                reindent_linewise = true,
            },
        },
    },

    {
        "nvim-mini/mini.surround",
        version = "*",
        opts = {
            mappings = {
                add = ";;",
                delete = ";d",
                replace = ";r",
            },
        },
    },
}
