require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "tinymist",
  "clangd",
  "omnisharp",
}

vim.lsp.enable(servers)

local base = require "nvchad.configs.lspconfig"
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")

lspconfig.omnisharp.setup({
  cmd = { "omnisharp" },
  filetypes = { "cs", "vb" },
  root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"),
})

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}
