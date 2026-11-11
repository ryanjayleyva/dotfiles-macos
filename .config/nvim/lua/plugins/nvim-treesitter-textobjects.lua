vim.pack.add({
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects' },
})

require('nvim-treesitter-textobjects').setup({
	select = {
		lookahead = true,
		selection_modes = {
			['@parameter.outer'] = 'v',
			['@function.outer'] = 'V',
		},
	},
	move = {
		set_jumps = true,
	},
})

local move = require('nvim-treesitter-textobjects.move')
local select = require('nvim-treesitter-textobjects.select')

-- Map select textobjects
local selects = {
	af = '@function.outer',
	['if'] = '@function.inner',
	aa = '@parameter.outer',
	ia = '@parameter.inner',
}

for lhs, query in pairs(selects) do
	vim.keymap.set({ 'x', 'o' }, lhs, function()
		select.select_textobject(query, 'textobjects')
	end)
end

-- Map motions between textobjects
local moves = {
	{ ']f', move.goto_next_start, '@function.outer' },
	{ ']a', move.goto_next_start, '@parameter.inner' },
	{ ']F', move.goto_next_end, '@function.outer' },
	{ ']A', move.goto_next_end, '@parameter.inner' },
	{ '[f', move.goto_previous_start, '@function.outer' },
	{ '[a', move.goto_previous_start, '@parameter.inner' },
	{ '[F', move.goto_previous_end, '@function.outer' },
	{ '[A', move.goto_previous_end, '@parameter.inner' },
}

for _, item in ipairs(moves) do
	local lhs, goto_fn, query = unpack(item)
	vim.keymap.set({ 'n', 'x', 'o' }, lhs, function()
		goto_fn(query, 'textobjects')
	end)
end
