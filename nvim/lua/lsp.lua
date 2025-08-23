-- Set up Mason
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "pyright", "clangd" }, -- you can add more
    automatic_installation = true,
})

-- Set up LSP servers
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Python (Pyright)
lspconfig.pyright.setup({
    capabilities = capabilities,
})

-- C++ (Clangd)
lspconfig.clangd.setup({
    capabilities = capabilities,
})

-- Diagnostics look
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
})
