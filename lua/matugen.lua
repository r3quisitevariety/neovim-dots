 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#131318',
    base01 = '#1f1f25',
    base02 = '#2a292f',
    base03 = '#918f9a',
    base04 = '#c7c5d0',
    base05 = '#e4e1e9',
    base06 = '#e4e1e9',
    base07 = '#e4e1e9',
    base08 = '#ffb4ab',
    base09 = '#e8b9d4',
    base0A = '#c5c4dd',
    base0B = '#c0c1ff',
    base0C = '#e8b9d4',
    base0D = '#c0c1ff',
    base0E = '#c5c4dd',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e4e1e9',          bg = '#131318' })
  hi('TelescopeBorder',         { fg = '#918f9a',             bg = '#131318' })
  hi('TelescopePromptNormal',   { fg = '#e4e1e9',          bg = '#131318' })
  hi('TelescopePromptBorder',   { fg = '#918f9a',             bg = '#131318' })
  hi('TelescopePromptPrefix',   { fg = '#c0c1ff',             bg = '#131318' })
  hi('TelescopePromptCounter',  { fg = '#c7c5d0',  bg = '#131318' })
  hi('TelescopePromptTitle',    { fg = '#131318',             bg = '#c0c1ff' })
  hi('TelescopePreviewTitle',   { fg = '#131318',             bg = '#c5c4dd' })
  hi('TelescopeResultsTitle',   { fg = '#131318',             bg = '#e8b9d4' })
  hi('TelescopeSelection',      { fg = '#e4e1e9',          bg = '#2a292f' })
  hi('TelescopeSelectionCaret', { fg = '#c0c1ff',             bg = '#2a292f' })
  hi('TelescopeMatching',       { fg = '#c0c1ff',             bold = true })
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
