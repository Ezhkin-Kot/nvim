return {
  use_icons = true,
  enhanced_diff_hl = true,
  view = {
    merge_tool = {
      layout = "diff3_mixed",
      disable_diagnostics = true,
    },
  },
  keymaps = {
    view = {
      ["<leader>df"] = "<cmd>DiffviewOpen<CR>",
      ["<leader>q"] = "<cmd>DiffviewClose<CR>",
    },
  },
}
