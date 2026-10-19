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

            -- TypeScript / JavaScript / Next.js
            vim.lsp.config("ts_ls", {
                capabilities = capabilities,
                cmd = {
                    "typescript-language-server",
                    "--stdio",
                },
            })

            -- Tailwind CSS
            vim.lsp.config("tailwindcss", {
                capabilities = capabilities,
                cmd = {
                    "tailwindcss-language-server",
                    "--stdio",
                },
            })

            -- ESLint
            vim.lsp.config("eslint", {
                capabilities = capabilities,
                cmd = {
                    "vscode-eslint-language-server",
                    "--stdio",
                },
            })



            vim.lsp.enable({
                "lua_ls",
                "clangd",
                "pyright",

                -- Next.js
                "ts_ls",
                "tailwindcss",
                "eslint",
            })
        end,
    },
}
