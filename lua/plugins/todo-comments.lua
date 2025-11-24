return {
  "folke/todo-comments.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs = true,
    keywords = {
      TODO = { icon = " ", color = "info" },
      FIX = { icon = " ", color = "error" },
      NOTE = { icon = " ", color = "#7EBD89" },

      URGENTE = { icon = " ", color = "error" },
      REVISAR = { icon = " ", color = "warning" },
      IMPORTANTE = { icon = " ", color = "info" },
    },
  },
}

-- TODO: kadsjdkjad
-- FIX: dskadkjasd
-- NOTE: asdkaskjd
-- URGENTE: dkjsadjaskjd
-- REVISAR: KJASDKJDKJ
-- IMPORTANTE: kjasdkadkj
