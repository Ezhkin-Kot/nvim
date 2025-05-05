require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

local servers = {
  "html",
  "cssls",
  "tinymist",
  "clangd",
  "omnisharp",
}

vim.lsp.enable(servers)

lspconfig.omnisharp.setup({
  cmd = { "omnisharp" },
  filetypes = { "cs", "vb" },
  root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"),
})
