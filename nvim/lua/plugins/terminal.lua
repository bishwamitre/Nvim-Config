return {
  "akinsho/toggleterm.nvim",
  version = "*", -- Pin to latest stable
  keys = {
    { "<A-t>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
    { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Horizontal Terminal" },
  },
  opts = {
    open_mapping = [[<A-t>]],
    start_in_insert = true,
    direction = "float",
    size = 20,
    float_opts = { border = "curved" }, -- options: single, double, shadow, curved
    dir = "git-dir", -- Better: use git root if available
    autochdir = true,
    shade_filetypes = {}, -- Optional: dim non-terminal buffers
    hide_numbers = true, -- Clean look, common in LazyVim setups
    close_on_exit = true, -- Auto-close on process exit
  },
}
