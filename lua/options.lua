require "nvchad.options"

-- add yours here!

local o = vim.o

o.relativenumber = true

o.cursorlineopt = "both" -- to enable cursorline!
o.tabstop = 2
o.expandtab = true
o.smartindent = true
o.shiftwidth = 2

-- tab settings for C/C++
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})
