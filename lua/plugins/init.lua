return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.treesitter"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lspconfig" },
    config = function()
      require "configs.mason-lspconfig"
    end,
  },

  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.lint"
    end,
  },

  {
    "rshkarin/mason-nvim-lint",
    event = "VeryLazy",
    dependencies = { "nvim-lint" },
    config = function()
      require "configs.mason-lint"
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    event = "VeryLazy",
    version = "1.*",
    opts = {
      dependencies_bin = { ["tinymist"] = "tinymist" },
    }, -- lazy.nvim will implicitly calls `setup {}`
  },

  {
    "zapling/mason-conform.nvim",
    event = "VeryLazy",
    dependencies = { "conform.nvim" },
    config = function()
      require "configs.mason-conform"
    end,
  },

  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {},
  },

  { import = "configs.nvim-cmp" },

  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
    ft = { "rust" },
  },

  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = require "configs.crates",
  },

  {
    "glacambre/firenvim",
    build = ":call firenvim#install(0)",
    lazy = false,
    config = require "configs.firenvim",
  },

  {
    "akinsho/git-conflict.nvim",
    version = "*",
    event = "VeryLazy",
    opts = require "configs.git-conflict",
  },

  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = require "configs.diffview",
  },

  { "nvim-lua/plenary.nvim", lazy = true },

  {
    "drop-stones/im-switch.nvim",
    event = "VeryLazy",
    opts = require "configs.im-switch",
  },

  { import = "configs.snacks" },

  -- {
  --   "nvim-mini/mini.animate",
  --   version = false,
  --   config = function()
  --     require("mini.animate").setup(),
  --   end,
  -- },

  -- Code completion
  {
    "Exafunction/windsurf.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = require "configs.windsurf",
    event = "BufEnter",
  },

  -- DAP
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.nvim-dap"
    end,
    lazy = true,
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    config = function()
      require "configs.mason-dap"
    end,
    {
      "rcarriga/nvim-dap-ui",
      event = "VeryLazy",
      config = function()
        require "configs.nvim-dap-ui"
      end,
    },
    {
      "nvim-neotest/nvim-nio",
    },
  },

  {
    "leoluz/nvim-dap-go",
    requires = { "mfussenegger/nvim-dap" },
    ft = "go",
    config = function()
      require "configs.nvim-dap-go"
    end,
    event = "VeryLazy",
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },
  --
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
