-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Leader key
vim.g.mapleader = " "

-- Keymaps
vim.keymap.set("n", "<leader>s", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>w", ":bdelete<CR>", { silent = true, desc = "Delete buffer" })
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true }) -- Remap <Tab> to go to the next buffer
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true }) -- Remap <S-Tab> to go to the previous buffer

-- In insert mode: Ctrl+Backspace deletes the previous word
vim.keymap.set("i", "<C-BS>", "<C-w>", { noremap = true })
vim.keymap.set("i", "<C-h>", "<C-w>", { noremap = true }) -- fallback
