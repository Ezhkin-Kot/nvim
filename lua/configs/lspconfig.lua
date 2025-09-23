local base = require "nvchad.configs.lspconfig"
local on_attach = base.on_attach
local on_init = base.on_init
local capabilities = base.capabilities

local base = require "nvchad.configs.lspconfig"
local on_attach = base.on_attach
local on_init = base.on_init
local capabilities = base.capabilities

-- vim.lsp.config("omnisharp", {
--   cmd = { "omnisharp" },
--   filetypes = { "cs", "vb" },
--   root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"),
-- })
-- vim.lsp.enable("omnisharp")

-- list of servers configured with default config.
local servers = require "configs.lsp-servers"

-- lsps with default config
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })
  vim.lsp.enable(lsp)
end

vim.lsp.config("clangd", {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)
  end,
  on_init = on_init,
  capabilities = capabilities,
})
vim.lsp.enable "clangd"

vim.lsp.config("gopls", {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)
  end,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gotmpl", "gowork" },
  root_dir = vim.fs.root(0, { "go.work", "go.mod", ".git" }),
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      completeUnimported = true,
      usePlaceholders = true,
      staticcheck = true,
    },
  },
})
vim.lsp.enable "gopls"

vim.lsp.config("tinymist", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    formatterMode = "typstyle",
    exportPdf = "onType",
    semanticTokens = "disable",
  },
})
vim.lsp.enable "tinymist"

vim.lsp.config("lua_ls", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,

  settings = {
    Lua = {
      diagnostics = {
        enable = false, -- Disable all diagnostics from lua_ls
        -- globals = { "vim" },
      },
      workspace = {
        library = {
          vim.fn.expand "$VIMRUNTIME/lua",
          vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
          vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
          vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
          "${3rd}/love2d/library",
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
})
vim.lsp.enable "lua_ls"
