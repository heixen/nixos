 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#000000',
    base01 = '#121416',
    base02 = '#1d1e21',
    base03 = '#8e9099',
    base04 = '#c4c6cf',
    base05 = '#e3e2e6',
    base06 = '#e3e2e6',
    base07 = '#e3e2e6',
    base08 = '#ffb4ab',
    base09 = '#e7b7e6',
    base0A = '#bec7db',
    base0B = '#aec7f6',
    base0C = '#e7b7e6',
    base0D = '#aec7f6',
    base0E = '#bec7db',
    base0F = '#dae3f8',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#e3e2e6',          bg = '#000000' })
  hi('TelescopeBorder',         { fg = '#8e9099',             bg = '#000000' })
  hi('TelescopePromptNormal',   { fg = '#e3e2e6',          bg = '#000000' })
  hi('TelescopePromptBorder',   { fg = '#8e9099',             bg = '#000000' })
  hi('TelescopePromptPrefix',   { fg = '#aec7f6',             bg = '#000000' })
  hi('TelescopePromptCounter',  { fg = '#c4c6cf',  bg = '#000000' })
  hi('TelescopePromptTitle',    { fg = '#000000',             bg = '#aec7f6' })
  hi('TelescopePreviewTitle',   { fg = '#000000',             bg = '#bec7db' })
  hi('TelescopeResultsTitle',   { fg = '#000000',             bg = '#e7b7e6' })
  hi('TelescopeSelection',      { fg = '#e3e2e6',          bg = '#1d1e21' })
  hi('TelescopeSelectionCaret', { fg = '#aec7f6',             bg = '#1d1e21' })
  hi('TelescopeMatching',       { fg = '#aec7f6',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#e3e2e6',          bg = '#000000' })
  hi('MiniPickBorder',         { fg = '#8e9099',             bg = '#000000' })
  hi('MiniPickPrompt',   { fg = '#e3e2e6',          bg = '#000000' })
  hi('MiniPickPromptPrefix',   { fg = '#aec7f6',             bg = '#000000' })
  hi('MiniPickBorderText',    { fg = '#000000',             bg = '#aec7f6' })
  hi('MiniPickMatchCurrent',      { fg = '#e3e2e6',          bg = '#1d1e21' })
  hi('MiniPickPromptCaret', { fg = '#aec7f6',             bg = '#1d1e21' })
  hi('MiniPickMatchRanges',       { fg = '#aec7f6',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
