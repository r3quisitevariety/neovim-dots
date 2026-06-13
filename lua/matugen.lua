 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#19120c',
    base01 = '#261e18',
    base02 = '#302822',
    base03 = '#9d8e81',
    base04 = '#d5c3b5',
    base05 = '#efe0d5',
    base06 = '#efe0d5',
    base07 = '#efe0d5',
    base08 = '#ffb4ab',
    base09 = '#c0cc9a',
    base0A = '#e1c1a4',
    base0B = '#fdb975',
    base0C = '#c0cc9a',
    base0D = '#fdb975',
    base0E = '#e1c1a4',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#efe0d5',          bg = '#19120c' })
  hi('TelescopeBorder',         { fg = '#9d8e81',             bg = '#19120c' })
  hi('TelescopePromptNormal',   { fg = '#efe0d5',          bg = '#19120c' })
  hi('TelescopePromptBorder',   { fg = '#9d8e81',             bg = '#19120c' })
  hi('TelescopePromptPrefix',   { fg = '#fdb975',             bg = '#19120c' })
  hi('TelescopePromptCounter',  { fg = '#d5c3b5',  bg = '#19120c' })
  hi('TelescopePromptTitle',    { fg = '#19120c',             bg = '#fdb975' })
  hi('TelescopePreviewTitle',   { fg = '#19120c',             bg = '#e1c1a4' })
  hi('TelescopeResultsTitle',   { fg = '#19120c',             bg = '#c0cc9a' })
  hi('TelescopeSelection',      { fg = '#efe0d5',          bg = '#302822' })
  hi('TelescopeSelectionCaret', { fg = '#fdb975',             bg = '#302822' })
  hi('TelescopeMatching',       { fg = '#fdb975',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
