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
    config = function()
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
    end,
  },

  {
    "glacambre/firenvim",
    build = ":call firenvim#install(0)",
    lazy = false,
    config = function()
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
    end,
  },

  {
    "akinsho/git-conflict.nvim",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("git-conflict").setup {
        default_mappings = true,
        disable_diagnostics = false,
        highlights = {
          incoming = "DiffText",
          current = "DiffAdd",
        },
      }
    end,
  },

  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("diffview").setup {
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
    end,
  },

  { "nvim-lua/plenary.nvim", lazy = true },

  {
    "drop-stones/im-switch.nvim",
    event = "VeryLazy",
    opts = {
      macos = {
        enabled = true, -- Set to true if you are on macOS
        default_im = "com.apple.keylayout.ABC", -- or your preferred input method
      },
      linux = {
        enabled = false, -- Set to true if you are on Linux
        default_im = "keyboard-us", -- or your preferred input method
        get_im_command = { "fcitx5-remote", "-n" }, -- { "ibus", "engine" }
        set_im_command = { "fcitx5-remote", "-s" }, -- { "ibus", "engine" }
      },
    },
  },

  -- Code completion
  {
    "Exafunction/windsurf.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup {
        -- Optionally disable cmp source if using virtual text only
        enable_cmp_source = false,
        virtual_text = {
          enabled = true,

          -- These are the defaults

          -- Set to true if you never want completions to be shown automatically.
          manual = false,
          -- A mapping of filetype to true or false, to enable virtual text.
          filetypes = {},
          -- Whether to enable virtual text of not for filetypes not specifically listed above.
          default_filetype_enabled = true,
          -- How long to wait (in ms) before requesting completions after typing stops.
          idle_delay = 75,
          -- Priority of the virtual text. This usually ensures that the completions appear on top of
          -- other plugins that also add virtual text, such as LSP inlay hints, but can be modified if
          -- desired.
          virtual_text_priority = 65535,
          -- Set to false to disable all key bindings for managing completions.
          map_keys = true,
          -- The key to press when hitting the accept keybinding but no completion is showing.
          -- Defaults to \t normally or <c-n> when a popup is showing.
          accept_fallback = nil,
          -- Key bindings for managing completions in virtual text mode.
          key_bindings = {
            -- Accept the current completion.
            accept = "<C-z>",
            -- Accept the next word.
            accept_word = "<C-.>",
            -- Accept the next line.
            accept_line = "<C-a>",
            -- Clear the virtual text.
            clear = "<C-x>",
            -- Cycle to the next completion.
            next = "<C-;>",
            -- Cycle to the previous completion.
            prev = "<C-,>",
          },
        },
        -- require("codeium.virtual_text").set_statusbar_refresh(function()
        --   require("lualine").refresh()
        -- end),
      }
    end,
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
