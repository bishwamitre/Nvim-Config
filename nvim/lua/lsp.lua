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

