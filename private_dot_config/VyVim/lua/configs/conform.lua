---@module "conform"
---@type conform.setupOpts
local options = {
    formatters_by_ft = {
        markdown = { "rumdl" },
        bash = { 'beautysh' },
        zsh = { "shfmt" },
        json = { "jq" },
        lua = { "stylua" },
        css = { "prettier" },
        -- html = { "prettier" },
        yaml = { "yamlfmt" },
        toml = { "tombi" },
        python = {
            "ruff_fix",
            "ruff_format",
            "ruff_organize_imports",
        },
        javascript = { "prettier" },
    },

    default_format_opts = {
        lsp_format = "fallback",
    },

    format_on_save = {
        timeout_ms = 1500,
    },

    formatters = {
        prettier = {
            prepend_args = { "--bracket-same-line", "true" },
        },
    },
}

return options
