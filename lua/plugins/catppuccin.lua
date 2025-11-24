return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  opts = {
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    transparent_background = false, -- true si querés Neovide/terminal con fondo transparente

    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },

    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      telescope = true,
      treesitter = true,
      mason = true,
      which_key = true,
      lualine = true,
      notify = true,
			noice = true,
			dressing = true,
			gitsigns = true,
			lsp_saga = true,
      mini = false,
    },
  },

  config = function(_, opts)
    vim.opt.termguicolors = true
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}

