require "nvchad.mappings"

local map = vim.keymap.set

-- DAP
map("n", "<leader>du", function()
  require("dapui").open()
end, { desc = "DAP UI Open" })
map("n", "<leader>dc", function()
  require("dapui").close()
end, { desc = "DAP UI Close" })
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

-- typst-preview
map("n", "<leader>tp", function()
  vim.cmd("TypstPreview")
end, { desc = "Typst Preview Open" })
map("n", "<leader>tc", function()
  vim.cmd("TypstPreviewStop")
end, { desc = "Typst Preview Close" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("v", "<Tab>", ">gv")
map("v", "<S-Tab>", "<gv")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
