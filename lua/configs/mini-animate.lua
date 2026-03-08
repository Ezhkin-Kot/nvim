local animate = require "mini.animate"

animate.setup {
  cursor = {
    enable = true,
    timing = animate.gen_timing.linear { duration = 100, unit = "total" },
  },
  scroll = { enable = false },
}
