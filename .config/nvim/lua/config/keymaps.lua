vim.g.mapleader = " "

-- Insert mode
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- LSP navigation
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "<leader>q", "<cmd>bd<CR>", { desc = "Close buffer" })

-- LSP actions
vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover({
        focusable = true,
        border = "rounded",
    })
end, { desc = "Hover documentation" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

-- Diagnostics
vim.keymap.set("n", "[d", function()
    vim.diagnostic.jump({
        count = -1,
        on_jump = function()
            vim.diagnostic.open_float()
        end,
    })
end, { desc = "Previous diagnostic" })

vim.keymap.set("n", "]d", function()
    vim.diagnostic.jump({
        count = 1,
        on_jump = function()
            vim.diagnostic.open_float()
        end,
    })
end, { desc = "Next diagnostic" })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- Show all diagnostics
vim.keymap.set("n", "<leader>xx", function()
    vim.diagnostic.setqflist()
    vim.cmd("copen")
end, { desc = "Open diagnostics list" })
