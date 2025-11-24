return {
  "neovim/nvim-lspconfig",
  config = function()
    local ok, lspconfig = pcall(require, "lspconfig")
    if not ok then
      vim.notify("lspconfig no disponible", vim.log.levels.ERROR)
      return
    end

    local util = require("lspconfig.util")

    -- Diagnósticos
    vim.diagnostic.config({
      virtual_text = { prefix = "●" },
      signs = true,
      underline = true,
      severity_sort = true,
    })

    -- ---------- SERVERS ----------
    -- TypeScript / JavaScript (nuevo nombre: ts_ls)
    lspconfig.ts_ls.setup({
      settings = {
        typescript = {
          preferences = { importModuleSpecifier = "relative" },
          tsserver = { useSyntaxServer = "auto" },
        },
        javascript = {
          preferences = { importModuleSpecifier = "relative" },
        },
      },
      root_dir = util.root_pattern("tsconfig.json", "package.json", ".git"),
    })

    -- PHP
    lspconfig.intelephense.setup({
      settings = {
        intelephense = { environment = { phpVersion = "8.2" } },
      },
    })

    -- CSS / HTML / JSON / YAML / Tailwind / Emmet / Python
    lspconfig.cssls.setup({})
    lspconfig.html.setup({})
    lspconfig.jsonls.setup({})
    lspconfig.yamlls.setup({})
    lspconfig.tailwindcss.setup({})
    lspconfig.emmet_ls.setup({})
    lspconfig.pyright.setup({})
  end,
}

