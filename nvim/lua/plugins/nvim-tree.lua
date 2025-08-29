return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        renderer = {
          group_empty = true,
          root_folder_label = false,
          indent_markers = {
            enable = true,
          },
        },
        filters = { dotfiles = false },
        view = {
          width = 30,
          side = "right", -- Move tree to right side
          adaptive_size = true,
        },
        sync_root_with_cwd = true, -- keep root synced with Neovim’s cwd
        respect_buf_cwd = true, -- respect buffer cwd
        update_focused_file = {
          enable = true,
          update_root = true, -- root changes to file’s directory
        },
      })

      -- Replace Snacks Explorer keymaps
      vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Explorer (NvimTree)" })
      vim.keymap.set("n", "<leader>o", "<cmd>NvimTreeFocus<CR>", { desc = "Focus Explorer (NvimTree)" })
    end,
  },
}
