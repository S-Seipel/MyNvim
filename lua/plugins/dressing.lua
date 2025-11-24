return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  opts = {
    input = {
      enabled = true,
      border = "rounded",
      title_pos = "center",
    },
    select = {
      enabled = true,
      backend = { "telescope", "nui", "builtin" }, -- usa lo mejor disponible
    },
  },
}

