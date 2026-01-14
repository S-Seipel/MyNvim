-- lua/plugins/focus.lua
return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = {
        backdrop = 0.85,     -- oscurece el resto de la pantalla
        width = 100,         -- ancho del texto
        options = {
          number = false,
          relativenumber = false,
          signcolumn = "no",
        },
      },
      plugins = {
        options = { laststatus = 0 }, -- oculta statusline
        twilight = { enabled = true },
        gitsigns = { enabled = false },
        tmux = { enabled = false },
      },
    },
  },
  {
    "folke/twilight.nvim",
    opts = { dimming = { alpha = 0.25 }, context = 8 },
  },
}

