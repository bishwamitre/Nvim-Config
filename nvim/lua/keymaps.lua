-- Leader key
vim.g.mapleader = " "

-- Keymaps
vim.keymap.set("n", "<leader>s", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true }) -- Remap <Tab> to go to the next buffer
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true }) -- Remap <S-Tab> to go to the previous buffer

-- Toggle NvimTree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Focus NvimTree (switch to it if open)
vim.keymap.set("n", "<leader>o", ":NvimTreeFocus<CR>", { noremap = true, silent = true })

-- Telescope (install 'nvim-telescope/telescope.nvim')
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { silent = true })   -- next buffer
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { silent = true }) -- previous buffer
vim.keymap.set('n', '<leader>bl', ':buffers<CR>', { silent = true })      -- list buffers
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { silent = true })           -- close buffer
vim.keymap.set('t', '<leader><Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })

-- Custom Keymaps
vim.keymap.set('n', '<leader>t', function()
  vim.cmd('lcd ' .. vim.fn.expand('%:p:h'))
  vim.cmd('terminal')
  vim.cmd('startinsert')                     -- enter insert mode
end, { silent = true })


vim.keymap.set('n', '<Esc>', function()
  -- clear hlsearch
  vim.cmd('nohlsearch')
  -- send Esc normally so you can still exit other modes
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', false)
end, { silent = true })


vim.keymap.set("n", "<leader>w", ":bdelete<CR>", { silent = true, desc = "Delete buffer" })

