return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "L3MON4D3/LuaSnip", enabled = false },
  },
  opts = function(_, opts)
    local cmp = require "cmp"

    opts.preselect = cmp.PreselectMode.None
    opts.completion = opts.completion or {}
    opts.completion.completeopt = "menu,menuone,noinsert,noselect"

    opts.snippet = nil -- Deactivate snippets support

    opts.mapping["<CR>"] = cmp.mapping(function(fallback)
      if cmp.visible() and cmp.get_selected_entry() then
        cmp.confirm { behavior = cmp.ConfirmBehavior.Insert, select = false }
      else
        fallback()
      end
    end, { "i", "s" })

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

    return opts
  end,
}
