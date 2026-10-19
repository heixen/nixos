-- lua/plugins/rose-pine.lua
return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
    variant = "auto", -- auto, main, moon, or dawn
    dark_variant = "moon", -- main, moon, or dawn
    dim_inactive_windows = true,
    extend_background_behind_borders = true,
      styles = {
        transparency = true,
        italic = false,
      },
    })

    -- vim.cmd.colorscheme("rose-pine")
    -- vim.cmd.colorscheme("rose-pine-main")
    vim.cmd.colorscheme("rose-pine-moon")
    -- vim.cmd.colorscheme("rose-pine-dawn")

    local groups = {
      "Normal",
      "NormalNC",
      "NormalFloat",
      "SignColumn",
      "EndOfBuffer",
    }

    for _, group in ipairs(groups) do
      vim.api.nvim_set_hl(0, group, { bg = "none" })
    end
  end,
}
