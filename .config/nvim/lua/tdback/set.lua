-- Colors 
vim.opt.termguicolors = true

-- Enable mouse movements in vim
vim.opt.guicursor = ""
vim.opt.mouse = "v"
vim.opt.mouse = "a"

-- Relative line numbers & such
vim.opt.relativenumber = true 
vim.opt.nu = true 
vim.opt.scrolloff = 8
vim.opt.cmdheight = 2
vim.opt.wrap = false

-- Line highlighting
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true 
vim.opt.cursorlineopt = "number"

-- Tabs, tabs, TABS 
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true 
vim.opt.smartindent = true 
vim.opt.autoindent = true 
vim.opt.wildmode = {'longest', 'list'}

-- Bells and Whistles
vim.opt.hlsearch = false 
vim.opt.hidden = true 
vim.opt.errorbells = false 
vim.opt.incsearch = true
vim.opt.completeopt = {'menu', 'menuone', 'noselect', 'noinsert'}

-- Undos and backups
vim.opt.swapfile = false
vim.opt.backup = false 
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Shorter update time
vim.opt.updatetime = 50

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "
