-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- In insert mode: Ctrl+Backspace deletes the previous word
vim.keymap.set("i", "<C-BS>", "<C-w>", { noremap = true })
vim.keymap.set("i", "<C-h>", "<C-w>", { noremap = true }) -- fallback

-- In insert mode: Ctrl+Backspace deletes the previous word
vim.keymap.set("i", "<C-BS>", "<C-w>", { noremap = true })
vim.keymap.set("i", "<C-h>", "<C-w>", { noremap = true }) -- fallback

-- map(mode, shortcut, command, options)
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })
-- Exit Visual Mode with jk
vim.keymap.set("v", "jk", "<Esc>", { desc = "Exit visual mode" })
