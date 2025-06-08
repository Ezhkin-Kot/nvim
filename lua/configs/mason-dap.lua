require("mason-nvim-dap").setup {
  ensure_installed = { "netcoredbg", "codelldb", "delve" },
  automatic_installation = { exclude = {} },
}
