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

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.compatible = false
vim.opt.hidden = false
vim.opt.autoread = true
vim.opt.mouse = "a"
vim.opt.termguicolors = true

vim.opt.lazyredraw = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 500

vim.opt.wildmenu = true
vim.opt.wildmode = { "longest", "list", "full" }
vim.opt.path:append("**")
vim.opt.completeopt = { "menuone", "noselect" }

vim.opt.confirm = true
vim.opt.switchbuf = "useopen"

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.fillchars:append({ eob = " " })
vim.opt.inccommand = "split"
vim.opt.title = true

