return {
  "epwalsh/obsidian.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim", -- 👈 aseguramos el picker
  },
  cmd = {
    "ObsidianOpen",
    "ObsidianNew",
    "ObsidianSearch",
    "ObsidianQuickSwitch",
    "ObsidianToday",
		"ObsidianWorkspace",
  },
  ft = "markdown",
  opts = {
    workspaces = {
			{ name = "main", path = "/home/seipel/obsidian" },
      { name = "ideas", path = "/home/seipel/obsidian/Ideas y ntoas rapidas" },
      { name = "programacion", path = "/home/seipel/obsidian/Programacion" },
      { name = "planificacion", path = "/home/seipel/obsidian/Planificacion" },
      { name = "diario", path = "/home/seipel/obsidian/Diario" },
      { name = "personal", path = "/home/seipel/obsidian/Personal" },
      { name = "propulse", path = "/home/seipel/obsidian/Propulse" },
			},
    picker = {
      name = "telescope.nvim",   -- 👈 ESTA línea es la que te faltaba
    },
  },
}
