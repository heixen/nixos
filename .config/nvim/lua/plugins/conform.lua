return {
  "stevearc/conform.nvim",
  opts = {
    -- format_on_save = true, -- optional, formats automatically on save
    formatters_by_ft = {
      nix = { "nixfmt" },
      lua = { "stylua" },
      sh = { "shfmt" },
      go = { "gofumpt" },
      python = { "black" },
      json = { "prettier" },
      jsonc = { "prettier" },

      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },

      css = { "prettier" },
      html = { "prettier" },
      markdown = { "prettier" },
    },
    formatters = {
      nixfmt = {
        command = "/run/current-system/sw/bin/nixfmt",
        args = { "-" }, -- read from stdin
        stdin = true,
      },
      prettier = {
        command = "prettier",
        args = { "--stdin-filepath", "$FILENAME" },
        stdin = true,
      },
    },
  },
}
