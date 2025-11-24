return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",     -- opcional, pero hace más linda la UX
  },
  opts = {
    -- UI presets prácticos
    presets = {
      bottom_search = true,   -- mover "/" a la parte inferior estilo Vim
      command_palette = true, -- cmdline + popup nice
      long_message_to_split = true,
      lsp_doc_border = true,
    },

    -- CMDLINE (:%s, /, :, lua, help, etc.)
    cmdline = {
      view = "cmdline_popup",
      format = {
        cmdline = { pattern = "^:", icon = "", lang = "vim" },
        search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
        search_up   = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
        lua = { pattern = "^:%s*lua%s+", icon = "", lang = "lua" },
        help = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖" },
      },
    },

    messages = {
      view = "mini",
      view_error = "notify",
      view_warn  = "notify",
      view_history = "messages",
    },

    lsp = {
      progress = { enabled = true },
      hover = { enabled = true, view = nil, opts = { border = { style = "rounded" } } },
      signature = { enabled = true, auto_open = { enabled = true, trigger = true } },
      message = { enabled = true, view = "notify" },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },

    -- Filtrar ruido (ej.: LSP spam)
    routes = {
      -- ocultar “written x lines”
      {
        filter = { event = "msg_show", kind = "", find = "written" },
        opts = { skip = true },
      },
      -- ocultar mensajes de búsqueda “%d matches”
      {
        filter = { event = "msg_show", find = "%d+ more lines?" },
        opts = { skip = true },
      },
    },

    views = {
      cmdline_popup = {
        border = { style = "rounded" },
        position = { row = "35%", col = "50%" },
        size = { width = 60, height = "auto" },
        win_options = { winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder" },
      },
    },
  },
  config = function(_, opts)
    require("noice").setup(opts)

    -- Keymaps útiles
    local map = vim.keymap.set
    map({ "n", "i", "s" }, "<C-f>", function()
      if not require("noice.lsp").scroll(4) then return "<C-f>" end
    end, { silent = true, expr = true, desc = "Noice scroll down" })

    map({ "n", "i", "s" }, "<C-b>", function()
      if not require("noice.lsp").scroll(-4) then return "<C-b>" end
    end, { silent = true, expr = true, desc = "Noice scroll up" })

    map("n", "<leader>sn", "<cmd>NoiceTelescope<cr>", { desc = "Noice history (Telescope)" })
    map("n", "<leader>nh", "<cmd>NoiceHistory<cr>", { desc = "Noice history" })
    map("n", "<leader>nd", "<cmd>NoiceDismiss<cr>", { desc = "Dismiss all" })
    map("n", "<leader>nm", "<cmd>Noice<cr>", { desc = "Noice status" })
  end,
}

