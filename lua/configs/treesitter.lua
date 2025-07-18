local options = {
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "c_sharp",
    "dockerfile",
    "go",
    "gomod",
    "gosum",
    "gotmpl",
    "gowork",
    "html",
    "json",
    "lua",
    "luadoc",
    "markdown",
    "printf",
    "python",
    "rust",
    "sql",
    "toml",
    "typst",
    "vim",
    "vimdoc",
    "yaml",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
