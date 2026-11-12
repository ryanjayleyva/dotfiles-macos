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
	{ 'af', '@function.outer', 'Select outer function' },
	{ 'if', '@function.inner', 'Select inner function' },
	{ 'aa', '@parameter.outer', 'Select outer parameter' },
	{ 'ia', '@parameter.inner', 'Select inner parameter' },
}

for _, item in ipairs(selects) do
	local lhs, query, desc = unpack(item)
	vim.keymap.set({ 'x', 'o' }, lhs, function()
		select.select_textobject(query, 'textobjects')
	end, { desc = desc })
end

-- Map motions between textobjects
local moves = {
	{ ']f', move.goto_next_start, '@function.outer', 'Next function start' },
	{ ']a', move.goto_next_start, '@parameter.inner', 'Next parameter start' },
	{ ']F', move.goto_next_end, '@function.outer', 'Next function end' },
	{ ']A', move.goto_next_end, '@parameter.inner', 'Next parameter end' },
	{
		'[f',
		move.goto_previous_start,
		'@function.outer',
		'Previous function start',
	},
	{
		'[a',
		move.goto_previous_start,
		'@parameter.inner',
		'Previous parameter start',
	},
	{ '[F', move.goto_previous_end, '@function.outer', 'Previous function end' },
	{
		'[A',
		move.goto_previous_end,
		'@parameter.inner',
		'Previous parameter end',
	},
}

for _, item in ipairs(moves) do
	local lhs, goto_fn, query, desc = unpack(item)
	vim.keymap.set({ 'n', 'x', 'o' }, lhs, function()
		goto_fn(query, 'textobjects')
	end, { desc = desc })
end
