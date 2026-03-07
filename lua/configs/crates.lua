return function()
  require("crates").setup {
    lsp = {
      enabled = true,
      actions = true,
      completion = true,
      hover = true,
    },
    completion = {
      crates = {
        enabled = true,
      },
    },
  }
  require("cmp").setup.buffer {
    sources = { { name = "crates" } },
  }
end
