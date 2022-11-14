local opt = vim.opt;
local g = vim.g;

-- line numbers
opt.relativenumber = true
opt.number = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.signcolumn = "yes"
opt.colorcolumn = "80"
opt.background = "dark"
opt.cursorline = true

-- spell check
opt.spell = true

-- clipboard
opt.clipboard:append("unnamedplus")

opt.iskeyword:append("-")

-- Netrw
vim.cmd [[
  let g:netrw_banner    = 0
  let g:netrw_liststyle = 3
  let g:netrw_winsize   = 50
  let g:netrw_preview   = 1
  let g:netrw_altv      = 1
]]
