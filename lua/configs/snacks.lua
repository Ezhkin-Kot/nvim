return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dim = { enabled = true },
    gh = { enabled = true },
    indent = {
      enabled = true,
      char = "│",
      scope = {
        enabled = true,
        char = "│",
        underline = false,
      },
      chunk = {
        enabled = true,
        char = {
          corner_top = "╭",
          corner_bottom = "╰",
          arrow = "►",
        },
      },
    },
    notifier = { enabled = true },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    words = { enabled = true },
    zen = { enabled = true },
  },
  keys = {
    -- gh
    {
      "<leader>gi",
      function()
        require("snacks").picker.gh_issue()
      end,
      desc = "GitHub Issues (open)",
    },
    {
      "<leader>gI",
      function()
        require("snacks").picker.gh_issue { state = "all" }
      end,
      desc = "GitHub Issues (all)",
    },
    {
      "<leader>gp",
      function()
        require("snacks").picker.gh_pr()
      end,
      desc = "GitHub Pull Requests (open)",
    },
    {
      "<leader>gP",
      function()
        require("snacks").picker.gh_pr { state = "all" }
      end,
      desc = "GitHub Pull Requests (all)",
    },
    -- Search
    {
      "<leader>sd",
      function()
        require("snacks").picker.diagnostics()
      end,
      desc = "Diagnostics",
    },
    {
      "<leader>sh",
      function()
        require("snacks").picker.help()
      end,
      desc = "Help Pages",
    },
    {
      "<leader>si",
      function()
        require("snacks").picker.icons()
      end,
      desc = "Icons",
    },
    {
      "<leader>sk",
      function()
        require("snacks").picker.keymaps()
      end,
      desc = "Keymaps",
    },
    {
      "<leader>sm",
      function()
        require("snacks").picker.marks()
      end,
      desc = "Marks",
    },
    -- Other
    {
      "<leader>z",
      function()
        require("snacks").zen()
      end,
      desc = "Toggle Zen Mode",
    },
    {
      "<leader>ln",
      function()
        require("snacks").picker.notifications()
      end,
      desc = "Notification History",
    },
  },
}

