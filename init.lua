require("config.lazy")
require('config/options')

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.keymap.set("n", "<Tab>", ">gv", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", "<gv", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>w", function()
  vim.o.wrap = not vim.o.wrap
  print("Wrap: " .. (vim.o.wrap and "ON" or "OFF"))
end, { desc = "Toggle line wrap" })

vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#ff6b6b" })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#f2c94c" })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#56b6c2" })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#9ca3af" })
