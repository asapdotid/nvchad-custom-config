local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- if you just want default config for the servers then put them in a table
local servers = {
  "ansiblels",
  "cssls",
  "tsserver",
  "clangd",
  "bashls",
  "cmake",
  "dockerls",
  "jsonls",
  "html",
  "lua_ls",
  "luau_lsp",
  "tsserver",
  "clangd",
  "rust_analyzer",
  "gopls",
  "pyright",
  "yamlls",
  "clojure_lsp",
  "terraformls",
  "vimls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

--
-- lspconfig.pyright.setup { blabla}
