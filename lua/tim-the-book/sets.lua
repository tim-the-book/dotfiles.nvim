-- Enable (relative) line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- No backups
vim.opt.swapfile = false
vim.opt.backup = false

-- Persistent history
vim.opt.undodir = os.getenv('HOME') .. '/.cache/nvim/undodir'
vim.opt.undofile = true

-- Searching
vim.opt.incsearch = true
vim.opt.hlsearch = false

-- Terminal-related settings
vim.opt.termguicolors = true

-- Scrolling
vim.opt.scrolloff = 8

-- Styling
vim.opt.colorcolumn = '100'
