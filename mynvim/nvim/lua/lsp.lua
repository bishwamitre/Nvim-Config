local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_registry = require("mason-registry")

mason.setup()

mason_lspconfig.setup({
    ensure_installed = {
        "clangd",
        "jdtls",
    },
})

-- Setup general LSP servers
local servers = {
    clangd = {},
}

for server, config in pairs(servers) do
    lspconfig[server].setup(config)
end

-- Java (jdtls) setup
vim.api.nvim_create_autocmd("FileType", {
    pattern = "java",
    callback = function()
        local jdtls = require("jdtls")
        local jdtls_setup = require("jdtls.setup")

        -- Detect OS
        local is_windows = vim.loop.os_uname().sysname == "Windows_NT"

        -- Path helper (works cross-platform)
        local join_path = function(...)
            local sep = is_windows and "\\" or "/"
            return table.concat({ ... }, sep)
        end

        -- Get jdtls path from Mason
        local jdtls_path = mason_registry.get_package("jdtls"):get_install_path()
        local jdtls_bin = is_windows and join_path(jdtls_path, "bin", "jdtls.bat")
                                or join_path(jdtls_path, "bin", "jdtls")

        -- Detect project root
        local root_dir = jdtls_setup.find_root({ ".git", "pom.xml", "build.gradle" })
        if not root_dir then return end

        -- Workspace per project
        local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
        local workspace_dir = join_path(vim.fn.stdpath("data"), "jdtls-workspaces", project_name)

        local config = {
            cmd = { jdtls_bin, "-data", workspace_dir },
            root_dir = root_dir,
        }

        jdtls.start_or_attach(config)
    end,
})
