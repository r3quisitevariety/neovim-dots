 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#11131c',
    base01 = '#1d1f29',
    base02 = '#282933',
    base03 = '#8d90a2',
    base04 = '#c3c5d9',
    base05 = '#e1e1ef',
    base06 = '#e1e1ef',
    base07 = '#e1e1ef',
    base08 = '#ffb4ab',
    base09 = '#f2afff',
    base0A = '#b7c4ff',
    base0B = '#b7c4ff',
    base0C = '#f2afff',
    base0D = '#b7c4ff',
    base0E = '#b7c4ff',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e1e1ef',          bg = '#11131c' })
  hi('TelescopeBorder',         { fg = '#8d90a2',             bg = '#11131c' })
  hi('TelescopePromptNormal',   { fg = '#e1e1ef',          bg = '#11131c' })
  hi('TelescopePromptBorder',   { fg = '#8d90a2',             bg = '#11131c' })
  hi('TelescopePromptPrefix',   { fg = '#b7c4ff',             bg = '#11131c' })
  hi('TelescopePromptCounter',  { fg = '#c3c5d9',  bg = '#11131c' })
  hi('TelescopePromptTitle',    { fg = '#11131c',             bg = '#b7c4ff' })
  hi('TelescopePreviewTitle',   { fg = '#11131c',             bg = '#b7c4ff' })
  hi('TelescopeResultsTitle',   { fg = '#11131c',             bg = '#f2afff' })
  hi('TelescopeSelection',      { fg = '#e1e1ef',          bg = '#282933' })
  hi('TelescopeSelectionCaret', { fg = '#b7c4ff',             bg = '#282933' })
  hi('TelescopeMatching',       { fg = '#b7c4ff',             bold = true })
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
