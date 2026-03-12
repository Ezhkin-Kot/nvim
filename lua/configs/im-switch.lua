return {
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
}
