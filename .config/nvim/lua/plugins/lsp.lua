return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ts_ls = {},
      tailwindcss = {},
      eslint = {},

      nixd = {
        settings = {
          nixd = {
            formatting = {
              command = nil,
            },
          },
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "hl" },
            },
          },
        },
      },
      clangd = {
        cmd = {
          "clangd",
        },
      },
      pyright = {
        cmd = { "pyright-langserver", "--stdio" },
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      },
    },
  },
}
