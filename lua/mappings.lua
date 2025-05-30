require "nvchad.mappings"

local map = vim.keymap.set

-- DAP
map("n", "<leader>du", function()
  require("dapui").open()
end, { desc = "DAP UI Toggle" })
map("n", "<F5>", function()
  require("dap").continue()
end, { desc = "DAP: Continue" })
map("n", "<F10>", function()
  require("dap").step_over()
end, { desc = "DAP: Step Over" })
map("n", "<F11>", function()
  require("dap").step_into()
end, { desc = "DAP: Step Into" })
map("n", "<S-F11>", function()
  require("dap").step_out()
end, { desc = "DAP: Step Out" })
map("n", "<S-F5>", function()
  require("dap").terminate()
end, { desc = "DAP: Terminate" })
map("n", "<F9>", function()
  require("dap").toggle_breakpoint()
end, { desc = "DAP: Toggle Breakpoint" })
map("n", "<leader>dr", function()
  require("dap").restart()
end, { desc = "DAP: Restart" })

-- Windsurf
vim.g.codeium_disable_bindings = 1
vim.g.codeium_no_map_tab = 1

-- Delete codeium default tab mapping
map("i", "<Tab>", function()
  return "\t"
end, { expr = true, noremap = true })

map("i", "<C-a>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })
map("i", "<C-;>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true, silent = true })
map("i", "<C-,>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, silent = true })
map("i", "<c-x>", function()
  return vim.fn["codeium#Clear"]()
end, { expr = true, silent = true })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
