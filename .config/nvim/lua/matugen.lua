 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#000000',
    base01 = '#0f1417',
    base02 = '#191f21',
    base03 = '#879399',
    base04 = '#bcc8cf',
    base05 = '#dee3e7',
    base06 = '#dee3e7',
    base07 = '#dee3e7',
    base08 = '#ffb4ab',
    base09 = '#e7b4ff',
    base0A = '#a2cde0',
    base0B = '#5ad4ff',
    base0C = '#e7b4ff',
    base0D = '#5ad4ff',
    base0E = '#a2cde0',
    base0F = '#bee9fd',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#dee3e7',          bg = '#000000' })
  hi('TelescopeBorder',         { fg = '#879399',             bg = '#000000' })
  hi('TelescopePromptNormal',   { fg = '#dee3e7',          bg = '#000000' })
  hi('TelescopePromptBorder',   { fg = '#879399',             bg = '#000000' })
  hi('TelescopePromptPrefix',   { fg = '#5ad4ff',             bg = '#000000' })
  hi('TelescopePromptCounter',  { fg = '#bcc8cf',  bg = '#000000' })
  hi('TelescopePromptTitle',    { fg = '#000000',             bg = '#5ad4ff' })
  hi('TelescopePreviewTitle',   { fg = '#000000',             bg = '#a2cde0' })
  hi('TelescopeResultsTitle',   { fg = '#000000',             bg = '#e7b4ff' })
  hi('TelescopeSelection',      { fg = '#dee3e7',          bg = '#191f21' })
  hi('TelescopeSelectionCaret', { fg = '#5ad4ff',             bg = '#191f21' })
  hi('TelescopeMatching',       { fg = '#5ad4ff',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#dee3e7',          bg = '#000000' })
  hi('MiniPickBorder',         { fg = '#879399',             bg = '#000000' })
  hi('MiniPickPrompt',   { fg = '#dee3e7',          bg = '#000000' })
  hi('MiniPickPromptPrefix',   { fg = '#5ad4ff',             bg = '#000000' })
  hi('MiniPickBorderText',    { fg = '#000000',             bg = '#5ad4ff' })
  hi('MiniPickMatchCurrent',      { fg = '#dee3e7',          bg = '#191f21' })
  hi('MiniPickPromptCaret', { fg = '#5ad4ff',             bg = '#191f21' })
  hi('MiniPickMatchRanges',       { fg = '#5ad4ff',             bold = true })
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
