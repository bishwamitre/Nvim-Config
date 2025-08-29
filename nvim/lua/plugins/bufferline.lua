return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        -- numbers = "ordinal", -- show buffer numbers
        -- -- separator_style = "slant", -- "slant" | "thick" | "thin"
        -- diagnostics = "nvim_lsp", -- show LSP diagnostics in buffer tabs
        -- show_buffer_close_icons = true,
        -- show_close_icon = false,
        -- always_show_bufferline = true,
        always_show_bufferline = false, -- <--- important
        offsets = {
          {
            filetype = "NvimTree",
            text = "📂 Explorer",
            text_align = "center",
          },
        },
      },
    },
  },
}
