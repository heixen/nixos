return {
    "saghen/blink.cmp",
    tag = "v1.6.0",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
        keymap = {
            ["<CR>"] = { "accept", "fallback" },
            ["<Tab>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
        },
        appearance = {
            nerd_font_variant = "mono",
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
    },
}
