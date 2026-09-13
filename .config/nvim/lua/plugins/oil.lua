return {
    "stevearc/oil.nvim",
    dependencies = {
        { "nvim-mini/mini.icons", opts = {} },
    },
    config = function()
        require("oil").setup({
            default_file_explorer = true,

            view_options = {
                show_hidden = true,
            },

            float = {
                padding = 3,
                max_width = 100,
                max_height = 30,
            },
        })

        vim.keymap.set("n", "-", "<CMD>Oil<CR>", {
            desc = "Open parent directory",
        })
    end,
}
