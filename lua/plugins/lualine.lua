return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin", -- o "tokyonight", etc.
        icons_enabled = true,
        section_separators = "",
        component_separators = "",
      },
    })
  end,
}

