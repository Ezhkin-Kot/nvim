***This config almost completely matches with the config from [gohy907](https://github.com/gohy907), so I took and brazenly stole his readme with minimal editing)***

***There is his config and it's pretty good: https://github.com/gohy907/nvim***

---

This is my config for [Neovim v0.11.1](https://github.com/neovim/neovim) powered by [NvChad v2.5](https://github.com/NvChad/NvChad)

# Features
- All features of latest NvChad
- Go
    - gopls LSP
    - gofumpt, goimports-reviser and golines formatters
- C++
    - clangd LSP
    - clang-format formatter
- C#
    - omnisharp LSP
    - csharpier formatter
- Typst
    - tinymist LSP
    - typstyle formatter
- Lua
    - lua-language-server LSP
    - stylua formatters
- Go, C++ and C# debuggers:
    - `<F9>` toggle breakpoint
    - `<Space>du` open DAP UI
    - `<Space>dc` close DAP UI
    - `<F5>` starts debugger / Continue
    - `<F10>` step over
    - `<F11>` step into
    - `<S-F11>` step out
    - `<S-F5>` terminate
    - `<Space>dr` restart
    - **All of these mappings can be easily changed to your taste in "dap" section of mappings.lua** 
- Automatic installation of neccesary LSP servers, formatters and linters via mason.nvim

# Defaults
- NvDash opens at start 
    - You can disable that by editing [chadrc.lua](./lua/chadrc.lua)
- catppuccin theme
    - You can change that via NvChad, press `<leader>th` to change the theme to your liking *(`<leader>` stands for Space key)* 

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

To install .cpp debugger run `:MasonInstall codelldb` and wait for mason.nvim to install it

To install .cs debugger run `:MasonInstall netcoredbg` and wait for mason.nvim to install it

After mason.nvim finishes with that, reopen Neovim and you are ready to go!

# Uninstallation
## MacOS/Linux
Delete this config with these commands:

```sh
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```
