-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- UI
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "nvim-lualine/lualine.nvim", config = true },

    {
      "navarasu/onedark.nvim",
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
        require('onedark').setup {
          style = 'darker'
        }
        -- Enable theme
        require('onedark').load()
      end
    },


    -- bufferline   
      {
        'akinsho/bufferline.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
          require('bufferline').setup {
            options = {
              -- numbers = "buffer_id",
              diagnostics = "nvim_lsp",
              separator_style = "arrow",               
              show_buffer_close_icons = true,
              show_close_icon = false,
              always_show_bufferline = true,
              offsets = {
                {
                filetype = "NvimTree",
                text = function()
                  local api = require("nvim-tree.api")
                  local root = api.tree.get_nodes().absolute_path
                  -- only folder name
                  return vim.fn.fnamemodify(root, ":t")
                  -- if you prefer full path, just return root
                end,
                text_align = "center",
                -- padding = 1,  -- adds space on the left/right
                }
              }
            }
          }
        end
      },




    -- File explorer
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup({

                view = {
                    side = "right", -- Move tree to right side
                    adaptive_size = true,
                },    
                renderer = {
                        root_folder_label = false
                    },
                sync_root_with_cwd = true,       -- keep root synced with Neovim’s cwd
                respect_buf_cwd = true,          -- respect buffer cwd
                update_focused_file = {
                    enable = true,
                    update_root = true,            -- root changes to file’s directory
                },
                
            })
        end
    },

    -- Telescope
    {
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },


    -- LSP
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "mfussenegger/nvim-jdtls" }, -- Java specific helper
    {
        "mason-org/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
    },
    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },
})


