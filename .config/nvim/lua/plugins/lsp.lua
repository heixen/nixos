return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            vim.lsp.config("lua_ls", {
                cmd = { "lua-language-server" },
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })

            vim.lsp.config("clangd", {
                capabilities = capabilities,
                cmd = { "clangd" },
            })

            vim.lsp.config("pyright", {
                capabilities = capabilities,
                cmd = {
                    "pyright-langserver",
                    "--stdio",
                },
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            diagnosticMode = "workspace",
                            typeCheckingMode = "basic",
                        },
                    },
                },
            })

            vim.lsp.enable({
                "lua_ls",
                "clangd",
                "pyright",
            })
        end,
    },
}
