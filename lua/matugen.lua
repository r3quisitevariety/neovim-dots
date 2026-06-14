 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#1a1112',
    base01 = '#271d1e',
    base02 = '#312828',
    base03 = '#9f8c8d',
    base04 = '#d7c1c2',
    base05 = '#f0dedf',
    base06 = '#f0dedf',
    base07 = '#f0dedf',
    base08 = '#ffb4ab',
    base09 = '#e8c08e',
    base0A = '#e5bdbf',
    base0B = '#ffb2b9',
    base0C = '#e8c08e',
    base0D = '#ffb2b9',
    base0E = '#e5bdbf',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#f0dedf',          bg = '#1a1112' })
  hi('TelescopeBorder',         { fg = '#9f8c8d',             bg = '#1a1112' })
  hi('TelescopePromptNormal',   { fg = '#f0dedf',          bg = '#1a1112' })
  hi('TelescopePromptBorder',   { fg = '#9f8c8d',             bg = '#1a1112' })
  hi('TelescopePromptPrefix',   { fg = '#ffb2b9',             bg = '#1a1112' })
  hi('TelescopePromptCounter',  { fg = '#d7c1c2',  bg = '#1a1112' })
  hi('TelescopePromptTitle',    { fg = '#1a1112',             bg = '#ffb2b9' })
  hi('TelescopePreviewTitle',   { fg = '#1a1112',             bg = '#e5bdbf' })
  hi('TelescopeResultsTitle',   { fg = '#1a1112',             bg = '#e8c08e' })
  hi('TelescopeSelection',      { fg = '#f0dedf',          bg = '#312828' })
  hi('TelescopeSelectionCaret', { fg = '#ffb2b9',             bg = '#312828' })
  hi('TelescopeMatching',       { fg = '#ffb2b9',             bold = true })
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
