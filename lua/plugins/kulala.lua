-- Set KULALA_CORE_LICENSE_TOKEN because kulala-core needs a license token
vim.pack.add({
	{ src = 'https://github.com/dont-be-evil-company/kulala.nvim' },
})

require('kulala').setup({
	global_keymaps = true,
})
