return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    theme = "wave",            -- 'wave' | 'dragon' (más oscuro)
    transparent = true,
    dimInactive = true,
    background = { dark = "wave", light = "lotus" },
  },
  config = function(_, opts)
    require("kanagawa").setup(opts)
    vim.cmd.colorscheme("kanagawa")

		vim.api.nvim_set_hl(0, "Normal",      { bg = "NONE" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "SignColumn",  { bg = "NONE" })
		vim.api.nvim_set_hl(0, "StatusLine",  { bg = "NONE" })
		vim.api.nvim_set_hl(0, "WinSeparator",{ fg = "#4b4b4b", bg = "NONE" })
  end,
}

