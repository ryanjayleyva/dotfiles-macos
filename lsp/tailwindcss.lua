return {
	cmd = {
		'tailwindcss-language-server',
		'--stdio',
	},

	filetypes = {
		'astro',
		'css',
		'html',
		'javascript',
		'javascriptreact',
		'svelte',
		'templ',
		'typescript',
		'typescriptreact',
	},

	-- Attach only to Tailwind projects because the server idles elsewhere
	root_dir = function(bufnr, on_dir)
		local root = vim.fs.root(bufnr, function(name, path)
			if name:find('^tailwind%.config%.') then
				return true
			end
			-- Read package.json because v4 has no tailwind.config file
			if name == 'package.json' then
				local lines = vim.fn.readfile(vim.fs.joinpath(path, name))
				return table.concat(lines):find('"@?tailwindcss[/"]') ~= nil
			end
			return false
		end)
		if root then
			on_dir(root)
		end
	end,

	-- Map templ to html because the server has no templ support
	settings = {
		tailwindCSS = {
			includeLanguages = { templ = 'html' },
		},
	},
}
