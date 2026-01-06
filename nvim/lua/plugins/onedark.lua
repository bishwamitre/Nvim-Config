return {
  {
    "navarasu/onedark.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- load before all the other start plugins
    config = function()
      -- Setup the theme
      require("onedark").setup({
        -- Main style: 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
        style = "dark",

        -- Enable transparent background
        transparent = true,
        diagnostics = {
          undercurl = true,
          background = false, -- ensures diagnostic backgrounds are transparent
        },
        -- Toggle theme style (dark/light) with this keybind
        -- This allows you to switch between OneDark and OneLight easily
        toggle_style_key = "<leader>uo",

        -- Optional: specific overrides if transparency isn't applying everywhere
        highlights = {
          -- specific highlight groups can be overridden here if needed
        },
      })

      -- Load the colorscheme
      require("onedark").load()
    end,
  },
}
