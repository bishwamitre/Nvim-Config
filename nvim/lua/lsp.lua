-- Set up Mason
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "pyright", "clangd", "jdtls" }, -- you can add more
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

-- Java (jdtls)
lspconfig.jdtls.setup({
    capabilities = capabilities,
    -- You may need to add more configuration here, e.g., for JDK path or project-specific settings.
    -- For example:
    -- cmd = {
    --     'java',
    --     '-Declipse.jdt.ls.debug.port=5007',
    --     '-Declipse.jdt.ls.debug=true',
    --     '-jar',
    --     vim.fn.stdpath('data') .. '/mason/packages/jdtls/language-server/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_*.jar',
    --     '-configuration',
    --     vim.fn.stdpath('data') .. '/mason/packages/jdtls/language-server/org.eclipse.jdt.ls.product/target/repository/config_linux',
    --     '-data',
    --     vim.fn.stdpath('data') .. '/lsp_servers/jdtls/workspace'
    -- },
    -- root_dir = lspconfig.util.root_pattern('pom.xml', '.git', 'gradle.build')
})

-- Diagnostics look
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
})
