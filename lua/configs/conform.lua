local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    cpp = { "clang-format" },
    c_sharp = { "csharpier" },
    go = { "gofumpt", "goimports-reviser", "golines" },
    -- rust = { "ast_grep" },
    typst = { "typstyle" },
    -- css = { "prettier" },
    -- html = { "prettier" },
    python = { "black" },
  },

  formatters = {
    -- C & C++
    ["clang-format"] = {
      prepend_args = {
        "-style={ \
                    IndentWidth: 4, \
                    TabWidth: 4, \
                    UseTab: Never, \
                    AccessModifierOffset: 0, \
                    IndentAccessModifiers: true, \
                    PackConstructorInitializers: Never}",
      },
    },
    -- Golang
    ["goimports-reviser"] = {
      prepend_args = { "-rm-unused" },
    },
    golines = {
      prepend_args = { "--max-len=80" },
    },
    -- Lua
    stylua = {
      prepend_args = {
        "--column-width", "80",
        "--line-endings", "Unix",
        "--indent-type", "Spaces",
        "--indent-width", "2",
        "--quote-style", "AutoPreferDouble",
      },
    },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

require("conform").setup(options)
