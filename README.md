This is my config for [Neovim v0.11.1](https://github.com/neovim/neovim) powered by [NvChad v2.5](https://github.com/NvChad/NvChad)

# Features
- All features of latest NvChad
- Go
    - gopls LSP
    - gofumpt, goimports-reviser and golines formatters
- Rust
    - rust-analyzer LSP
    - crates.nvim
    - ast_grep formatter
- C++
    - clangd LSP
    - clang-format formatter
- C#
    - omnisharp LSP
    - csharpier formatter
- Typst
    - tinymist LSP
    - typstyle formatter
    - typst-preview
- Lua
    - lua-language-server LSP
    - stylua formatters
- Code completion with windsurf.nvim:
    - `<C-z>` accept current completion
    - `<C-a>` accept the next line
    - `<C-.>` accept the next word
    - `<C-;>` cycle to the next completion
    - `<C-,>` cycle to the previous completion
- DAP Debugger for the following languages:
    - Go, Rust, C++, C#
    - Debugger mappings:
        - `<F9>` toggle breakpoint
        - `<Space>du` open DAP UI
        - `<Space>dc` close DAP UI
        - `<F5>` starts debugger / Continue
        - `<F10>` step over
        - `<F11>` step into
        - `<S-F11>` step out
        - `<S-F5>` terminate
        - `<Space>dr` restart
        - *All of these mappings can be easily changed to your taste in "dap" section of mappings.lua*
- Automatic installation of neccesary LSP servers, formatters and linters via mason.nvim

# Defaults
- NvDash opens at start 
    - You can edit that in [chadrc.lua](./lua/chadrc.lua)
- catppuccin theme
    - You can change that via NvChad, press `<leader>th` to change the theme to your liking *(`<leader>` stands for Space key)* 

# Prerequisites
- Neovim v0.11.1+
- Nerd Font
- Go, Rust, Clangd, Python, Typst, .NET Core SDK
    - If you don't need to use them, just comment the corresponding lsp and formatters configs in [lspconfig.lua](./lua/configs/lspconfig.lua) and [conform.lua](./lua/configs/conform.lua)
    - You may also need to comment nvim-dap-go for Go, crates.nvim for Rust and typst-preview for Typst in [init.lua](./lua/plugins/init.lua) if you don't use them and it causes errors

# Installation
## MacOS/Linux
Delete your previous Neovim configs:

```sh
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```

And install this config: 

```sh
git clone https://github.com/Ezhkin-Kot/nvim ~/.config/nvim && nvim 
```
Or through ssh:
```sh
git clone git@github.com:Ezhkin-Kot/nvim.git ~/.config/nvim && nvim
```

After lazy.nvim installs all plugins, wait for treesitter to install all plugins and mason.nvim to install all LSPs

To install debuggers run `:MasonInstall codelldb`, then `:MasonInstall netcoredbg` and `:MasonInstall delve`, and wait for mason.nvim to install it

After that you can authorize in windsurf.nvim for code completion with `:Codeium Auth`

And finally, reopen Neovim and you are ready to go!

# Uninstallation
## MacOS/Linux
Delete this config with these commands:

```sh
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```
