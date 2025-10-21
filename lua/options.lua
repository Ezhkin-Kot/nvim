require "nvchad.options"

-- add yours here!

local o = vim.o

o.relativenumber = true

o.cursorlineopt = "both" -- to enable cursorline!
o.tabstop = 2
o.expandtab = true
o.smartindent = true
o.shiftwidth = 2

-- tab settings for C/C++/C#
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "cs" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "GitConflictDetected",
  callback = function()
    vim.schedule(function()
      local ok, diffview = pcall(require, "diffview")
      if ok then
        vim.cmd "DiffviewOpen"
      end
    end)
  end,
})
