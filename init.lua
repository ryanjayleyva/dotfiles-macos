require('config.options')
require('config.keymaps')
require('config.autocmds') -- Load before conform because the save fixes must run before formatting
require('plugins.mason')
require('plugins.conform')
require('plugins.schemastore')
require('plugins.plenary')
require('plugins.nvim-nio') -- Load before nvim-dap and neotest because they require nio
require('plugins.telescope')
require('plugins.gitsigns')
require('plugins.nvim-treesitter')
require('plugins.nvim-treesitter-context')
require('plugins.nvim-treesitter-textobjects')
require('plugins.refactoring')
require('plugins.nvim-surround')
require('plugins.nvim-ts-autotag')
require('plugins.mini-pairs')
require('plugins.vim-tmux-navigator')
require('plugins.luasnip') -- Load before nvim-cmp because its config requires luasnip
require('plugins.nvim-cmp')
require('plugins.kulala')
require('plugins.vim-dadbod') -- Load after nvim-cmp because its config extends cmp
require('plugins.nvim-dap')
require('plugins.rustaceanvim') -- Load before neotest because its adapter requires rustaceanvim
require('plugins.neotest')
require('core.lsp')
