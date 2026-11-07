vim.g.mapleader = ' '

-- Set appearance
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.signcolumn = 'yes'
vim.opt.scrolloff = 8
vim.opt.winborder = 'rounded'

-- Set indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.formatoptions:append('r')

-- Set window and input behavior
vim.opt.mouse = ''
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.clipboard = 'unnamedplus'

-- Set search behavior
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'split'

-- Set spell checking
vim.opt.spelllang = 'en_us'

-- Set manual completion behavior because nvim-cmp handles the rest
vim.opt.completeopt = 'menu,menuone,noselect,popup'

-- Set file and command behavior
vim.opt.path:append('**')
vim.opt.wildignore:append('*/node_modules/*')
vim.opt.wildmode = 'longest:full,full'
vim.opt.swapfile = false
vim.opt.shortmess:append('WI')

-- Set colors
vim.opt.termguicolors = true
