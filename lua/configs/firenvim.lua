return function()
  vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = "practicum.yandex.ru_*.txt",
    command = "set filetype=python",
  })
  vim.g.firenvim_config = {
    globalSettings = { alt = "all" },
    localSettings = {
      [".*"] = {
        cmdline = "neovim",
        content = "text",
        priority = 0,
        selector = "textarea",
        takeover = "never",
      },
    },
  }
  if vim.g.started_by_firenvim then
    vim.o.guifont = "JetBrainsMono Nerd Font:h18"
  end
end
