-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jk", "<Esc>", { silent = true })

vim.keymap.set("i", "<C-f>", function()
  local filename = vim.fn.expand("%:t")
  local comment = vim.bo.commentstring:gsub("%%s", filename)
  vim.api.nvim_put({ comment }, "c", true, true)
end, { desc = "Insert filename as comment" })
