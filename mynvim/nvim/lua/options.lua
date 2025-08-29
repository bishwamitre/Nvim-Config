-- Basic Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.shortmess:append("I") -- Hide the intro message
vim.opt.winbar = ' '  -- single space line between bufferline and code
-- Example: FiraCode Nerd Font, size 18
vim.opt.guifont = "IBM Plex Mono"
-- Remove padding in Neovide
vim.g.neovide_padding_top = 2
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_left = 2
