return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "L3MON4D3/LuaSnip", enabled = false },
  },
  opts = function(_, opts)
    local cmp = require("cmp")

    opts.snippet = nil -- Deactivate snippets support

    opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" })

    opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" })
  end,
}
