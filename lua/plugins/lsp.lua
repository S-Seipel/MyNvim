return {
  "neovim/nvim-lspconfig",
  config = function()
    local ok, lspconfig = pcall(require, "lspconfig")
    if not ok then
      vim.notify("lspconfig no disponible", vim.log.levels.ERROR)
      return
    end

    vim.lsp.enable({
      "jsonls",
      "cssls",
      "html",
      "yamlls",
      "intelephense",
      "emmet_ls",
      "ts_ls",
      "tailwindcss",
			"pyright"
    })

    vim.schedule(function()
      local notify = vim.notify
      vim.notify = function(msg, ...)
        if msg:match("The require%(\'lspconfig%)") then
          return
        end
        notify(msg, ...)
      end
    end)

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

    lspconfig.intelephense.setup({
      settings = {
        intelephense = {
          environment = {
            phpVersion = "8.2",
          },
        },
      },
    })

    vim.diagnostic.config({
      virtual_text = { prefix = "●" },
      signs = true,
      underline = true,
      severity_sort = true,
    })
		lspconfig.pyright.setup({})
  end,
}

