 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#000000',
    base01 = '#1b110b',
    base02 = '#261c14',
    base03 = '#a58c7c',
    base04 = '#ddc1b0',
    base05 = '#f3dfd3',
    base06 = '#f3dfd3',
    base07 = '#f3dfd3',
    base08 = '#ffb4ab',
    base09 = '#c5cf42',
    base0A = '#fcb888',
    base0B = '#ffb784',
    base0C = '#c5cf42',
    base0D = '#ffb784',
    base0E = '#fcb888',
    base0F = '#ffdcc6',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#f3dfd3',          bg = '#000000' })
  hi('TelescopeBorder',         { fg = '#a58c7c',             bg = '#000000' })
  hi('TelescopePromptNormal',   { fg = '#f3dfd3',          bg = '#000000' })
  hi('TelescopePromptBorder',   { fg = '#a58c7c',             bg = '#000000' })
  hi('TelescopePromptPrefix',   { fg = '#ffb784',             bg = '#000000' })
  hi('TelescopePromptCounter',  { fg = '#ddc1b0',  bg = '#000000' })
  hi('TelescopePromptTitle',    { fg = '#000000',             bg = '#ffb784' })
  hi('TelescopePreviewTitle',   { fg = '#000000',             bg = '#fcb888' })
  hi('TelescopeResultsTitle',   { fg = '#000000',             bg = '#c5cf42' })
  hi('TelescopeSelection',      { fg = '#f3dfd3',          bg = '#261c14' })
  hi('TelescopeSelectionCaret', { fg = '#ffb784',             bg = '#261c14' })
  hi('TelescopeMatching',       { fg = '#ffb784',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#f3dfd3',          bg = '#000000' })
  hi('MiniPickBorder',         { fg = '#a58c7c',             bg = '#000000' })
  hi('MiniPickPrompt',   { fg = '#f3dfd3',          bg = '#000000' })
  hi('MiniPickPromptPrefix',   { fg = '#ffb784',             bg = '#000000' })
  hi('MiniPickBorderText',    { fg = '#000000',             bg = '#ffb784' })
  hi('MiniPickMatchCurrent',      { fg = '#f3dfd3',          bg = '#261c14' })
  hi('MiniPickPromptCaret', { fg = '#ffb784',             bg = '#261c14' })
  hi('MiniPickMatchRanges',       { fg = '#ffb784',             bold = true })
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
