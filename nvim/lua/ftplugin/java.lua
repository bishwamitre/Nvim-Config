local jdtls = require("jdtls")

-- Find project root
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)

if root_dir == nil then
  return
end

-- Workspace folder (needed by jdtls)
local home = os.getenv("HOME")
local workspace_dir = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local config = {
  cmd = { "jdtls", "-data", workspace_dir },
  root_dir = root_dir,
  settings = {
    java = {},
  },
  init_options = {
    bundles = {},
  },
}

-- Make sure this only runs for Java files
if vim.bo.filetype == "java" then
  jdtls.start_or_attach(config)
end

-- Java-specific keymaps
vim.keymap.set("n", "<leader>oi", jdtls.organize_imports, { buffer = true })
vim.keymap.set("n", "<leader>ev", jdtls.extract_variable, { buffer = true })
vim.keymap.set("n", "<leader>em", jdtls.extract_method, { buffer = true })
