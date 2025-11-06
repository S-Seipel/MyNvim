return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  event = "BufReadPost",
  config = function()
    -- 👇 esto fuerza a Neovim a usar Treesitter para crear folds
    vim.o.foldmethod = "expr"
    vim.o.foldexpr = "nvim_treesitter#foldexpr()"

    -- que arranque todo abierto
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.o.foldcolumn = "1"

    require("ufo").setup({
      provider_selector = function(_, _, _)
        return { "treesitter", "indent" }
      end,
    })

    -- atajos
    vim.keymap.set("n", "zR", require("ufo").openAllFolds)
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
  end,
}
