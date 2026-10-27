 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#000000',
    base01 = '#131414',
    base02 = '#1e1e1f',
    base03 = '#8e9195',
    base04 = '#c4c6cb',
    base05 = '#e4e2e2',
    base06 = '#e4e2e2',
    base07 = '#e4e2e2',
    base08 = '#ffb4ab',
    base09 = '#f9e6fa',
    base0A = '#c3c7cd',
    base0B = '#e1edfc',
    base0C = '#d3c1d4',
    base0D = '#bcc8d6',
    base0E = '#c3c7cd',
    base0F = '#dfe3e9',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#e4e2e2',          bg = '#000000' })
  hi('TelescopeBorder',         { fg = '#8e9195',             bg = '#000000' })
  hi('TelescopePromptNormal',   { fg = '#e4e2e2',          bg = '#000000' })
  hi('TelescopePromptBorder',   { fg = '#8e9195',             bg = '#000000' })
  hi('TelescopePromptPrefix',   { fg = '#e1edfc',             bg = '#000000' })
  hi('TelescopePromptCounter',  { fg = '#c4c6cb',  bg = '#000000' })
  hi('TelescopePromptTitle',    { fg = '#000000',             bg = '#e1edfc' })
  hi('TelescopePreviewTitle',   { fg = '#000000',             bg = '#c3c7cd' })
  hi('TelescopeResultsTitle',   { fg = '#000000',             bg = '#f9e6fa' })
  hi('TelescopeSelection',      { fg = '#e4e2e2',          bg = '#1e1e1f' })
  hi('TelescopeSelectionCaret', { fg = '#e1edfc',             bg = '#1e1e1f' })
  hi('TelescopeMatching',       { fg = '#e1edfc',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#e4e2e2',          bg = '#000000' })
  hi('MiniPickBorder',         { fg = '#8e9195',             bg = '#000000' })
  hi('MiniPickPrompt',   { fg = '#e4e2e2',          bg = '#000000' })
  hi('MiniPickPromptPrefix',   { fg = '#e1edfc',             bg = '#000000' })
  hi('MiniPickBorderText',    { fg = '#000000',             bg = '#e1edfc' })
  hi('MiniPickMatchCurrent',      { fg = '#e4e2e2',          bg = '#1e1e1f' })
  hi('MiniPickPromptCaret', { fg = '#e1edfc',             bg = '#1e1e1f' })
  hi('MiniPickMatchRanges',       { fg = '#e1edfc',             bold = true })
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
