-- Movimientos de lineas con alt+j/k
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Tabs
vim.keymap.set("n", "<Tab>", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })

-- MODO FOCUS
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { desc = "Toggle Focus (Zen)" })

-- LazyGit
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Open LazyGit" })

-- Toggle wrap
vim.keymap.set("n", "<leader>w", function()
  vim.o.wrap = not vim.o.wrap
  print("Wrap: " .. (vim.o.wrap and "ON" or "OFF"))
end, { desc = "Toggle line wrap" })

vim.keymap.set("n", "<Leader>q", ":wq<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>qa", ":wqa<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<A-S-j>", "yyp", { noremap = true, silent = true })
vim.keymap.set("n", "<A-S-k>", "yyP", { noremap = true, silent = true })
vim.keymap.set("v", "<A-S-j>", "y'>pgv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-S-k>", "y'<Pgv", { noremap = true, silent = true })

-- COMANDOS GIT --

vim.keymap.set("n", "<C-g>", ":G<space>", { noremap = true, silent = false })

-- BUSCADOR DE COMENTARIOS
vim.keymap.set("n", "<Leader>n", function()
	require('telescope').extensions["todo-comments"].todo()
end, { desc = "Buscar todos los TODO" })


 -- ==== Obsidian ====
local function slugify(title)
  local s = title:lower()
  s = s:gsub("ñ", "n")
  s = s:gsub("[áà]", "a")
  s = s:gsub("[éè]", "e")
  s = s:gsub("[íì]", "i")
  s = s:gsub("[óò]", "o")
  s = s:gsub("[úù]", "u")
  s = s:gsub("[^a-z0-9]+", "-")
  s = s:gsub("%-+", "-")
  s = s:gsub("^%-", "")
  s = s:gsub("%-$", "")
  return s
end

local function create_note_in_workspace(ws_name)
  local ok, obsidian = pcall(require, "obsidian")
  if not ok then
    vim.notify("obsidian.nvim no está cargado", vim.log.levels.ERROR)
    return
  end

  local client = obsidian.get_client()
  local workspaces = client.opts.workspaces or {}

  local ws_path = nil
  for _, ws in ipairs(workspaces) do
    if ws.name == ws_name then
      ws_path = ws.path
      break
    end
  end

  if not ws_path then
    vim.notify("Workspace '" .. ws_name .. "' no existe en tu obsidian.lua", vim.log.levels.ERROR)
    return
  end

  local title = vim.fn.input("Título: ")
  if title == "" then return end

  local filename = slugify(title) .. ".md"
  local fullpath = ws_path .. "/" .. filename
  vim.cmd("edit " .. fullpath)

  -- si el archivo está vacío, escribimos plantilla
  if vim.api.nvim_buf_line_count(0) == 1 and vim.api.nvim_buf_get_lines(0, 0, 1, false)[1] == "" then
    local lines = {
      "---",
      "title: " .. title,
      "created: " .. os.date("%Y-%m-%d %H:%M"),
      "workspace: " .. ws_name,
      "---",
      "",
      "# " .. title,
      "",
    }
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  end
end

-----------------------------------------------------------
-- 🔹 Atajos para crear nota por workspace
-----------------------------------------------------------
vim.keymap.set("n", "<leader>ni", function() create_note_in_workspace("ideas") end,
  { desc = "Nueva nota en Ideas" })
vim.keymap.set("n", "<leader>np", function() create_note_in_workspace("programacion") end,
  { desc = "Nueva nota en Programación" })
vim.keymap.set("n", "<leader>nl", function() create_note_in_workspace("planificacion") end,
  { desc = "Nueva nota en Planificación" })
vim.keymap.set("n", "<leader>nd", function() create_note_in_workspace("diario") end,
  { desc = "Nueva nota en Diario" })
vim.keymap.set("n", "<leader>ns", function() create_note_in_workspace("personal") end,
  { desc = "Nueva nota en Personal" })
vim.keymap.set("n", "<leader>os", ":ObsidianSearch<CR>",   { desc = "Buscar nota" })

local ok_t, telescope = pcall(require, "telescope")
if ok_t then
  local pickers      = require("telescope.pickers")
  local finders      = require("telescope.finders")
  local conf         = require("telescope.config").values
  local actions      = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  local function pick_workspace_and_create_note()
    local ok, obsidian = pcall(require, "obsidian")
    if not ok then
      vim.notify("obsidian.nvim no está cargado", vim.log.levels.ERROR)
      return
    end

    local client = obsidian.get_client()
    local workspaces = client.opts.workspaces or {}

    -- armamos la lista para mostrar
    pickers.new({}, {
      prompt_title = "Elegí carpeta de Obsidian",
      finder = finders.new_table({
        results = workspaces,
        entry_maker = function(entry)
          return {
            value   = entry.name,
            display = entry.name .. "  →  " .. entry.path,
            ordinal = entry.name,
          }
        end,
      }),
      sorter = conf.generic_sorter({}),
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          local selection = action_state.get_selected_entry()
          actions.close(prompt_bufnr)

          -- usamos la misma función que ya tenés
          vim.schedule(function()
            create_note_in_workspace(selection.value)
          end)
        end)
        return true
      end,
    }):find()
  end

  -- atajo: lista de carpetas y crear nota ahí
  vim.keymap.set("n", "<leader>no", pick_workspace_and_create_note,
    { desc = "Nueva nota (elegir carpeta)" })
end

vim.keymap.set("n", "<leader>s", "<Plug>SlimeLineSend", { desc = "Slime send line" })
vim.keymap.set("v", "<leader>s", "<Plug>SlimeRegionSend", { desc = "Slime send selection" })

vim.keymap.set("n", "<leader>r", function()
  vim.cmd("w")
  vim.cmd("botright split | terminal node %")
end, { desc = "Run current JS file in terminal" })

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
