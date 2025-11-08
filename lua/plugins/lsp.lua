return {
  "neovim/nvim-lspconfig",
  config = function()
    -- 1️⃣ Cargamos el plugin
    local ok, lspconfig = pcall(require, "lspconfig")
    if not ok then
      vim.notify("lspconfig no disponible", vim.log.levels.ERROR)
      return
    end

    -- 2️⃣ Activamos servers
    vim.lsp.enable({
      "jsonls",
      "cssls",
      "html",
      "yamlls",
      "intelephense",
      "emmet_ls",
      "ts_ls",
      "tailwindcss",
    })

    -- 3️⃣ Forzamos silenciar warnings de deprecación (solo temporal)
    vim.schedule(function()
      local notify = vim.notify
      vim.notify = function(msg, ...)
        if msg:match("The require%(\'lspconfig%)") then
          return
        end
        notify(msg, ...)
      end
    end)

    -- 4️⃣ Configuración de TS
    lspconfig.ts_ls.setup({
      settings = {
        typescript = {
          preferences = {
            importModuleSpecifier = "relative",
          },
          tsserver = {
            useSyntaxServer = "auto",
          },
        },
        javascript = {
          preferences = {
            importModuleSpecifier = "relative",
          },
        },
      },
      root_dir = lspconfig.util.root_pattern(
        "tsconfig.json",
        "package.json",
        ".git"
      ),
    })

    -- 5️⃣ PHP (Intelephense)
    lspconfig.intelephense.setup({
      settings = {
        intelephense = {
          environment = {
            phpVersion = "8.2",
          },
        },
      },
    })

    -- 6️⃣ Diagnósticos
    vim.diagnostic.config({
      virtual_text = { prefix = "●" },
      signs = true,
      underline = true,
      severity_sort = true,
    })
  end,
}
