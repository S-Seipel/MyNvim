vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = true
vim.opt.expandtab = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.colorcolumn = ""
vim.opt.laststatus = 3
vim.opt.cmdheight = 1
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.backspace = "indent,eol,start"
vim.opt.smarttab = true

vim.opt.fileformats = { "unix", "dos" }
vim.opt.fileformat = "unix"

vim.opt.termguicolors = true

vim.diagnostic.config({ virtual_text = true })

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99
vim.o.foldenable = true

vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#ff6b6b" })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#f2c94c" })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#56b6c2" })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#9ca3af" })

vim.o.conceallevel = 2

vim.cmd.colorscheme("catppuccin")
