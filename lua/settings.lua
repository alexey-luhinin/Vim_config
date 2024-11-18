-- Description: General settings for vim

-- Enable syntax highlighting
vim.o.syntax = "on"

-- Enable file type detection
vim.o.filetype = "on"  

-- Enable true colors
vim.o.termguicolors = true

-- Show line numbers
vim.o.number = true

-- Show relative line numbers
vim.o.relativenumber = true

-- Set background color
vim.o.background = "dark"

-- Set history length
vim.o.history = 10000

-- Set undodir directory path
vim.o.undodir = vim.fn.expand("~/.vim/undodir")

-- Set persistent undo
vim.o.undofile = true

-- Swap files off
vim.o.swapfile = false

-- Set undolevels
vim.o.undolevels = 10000

-- Set encoding to utf-8
vim.o.encoding = "utf-8"

-- Highlight search results
vim.o.hlsearch = false

-- Incremental search
vim.o.incsearch = true

-- Spell check settings
vim.o.spell = true
vim.o.spelllang = "en_us"

-- Wrap line settings
vim.o.wrap = true

-- Set color column
vim.o.colorcolumn = "80"

-- Set split window settings
vim.o.splitbelow = true
vim.o.splitright = true

-- Tabs settings
vim.o.tabstop = 4
vim.o.softtabstop = 0
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Set color scheme
vim.cmd('colorscheme gruvbox')

-- Set leader key
vim.g.mapleader = ','

-- Set sign column
vim.opt.signcolumn = 'yes'
