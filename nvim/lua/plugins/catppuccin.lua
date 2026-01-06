return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = true, -- Enable transparency
      -- integrations = {
      --   treesitter = true,
      --   native_lsp = true,
      --   telescope = true,
      --   which_key = true,
      --   mini = true,
      --   cmp = true,
      -- },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "catppuccin" },
  },
}
