local group = vim.api.nvim_create_augroup('config', { clear = true })

-- Use request_sync so the edits land before the write
local function apply_source_action(buffer, client_name, kind)
	local client = vim.lsp.get_clients({ bufnr = buffer, name = client_name })[1]
	if not client then
		return
	end

	local response = client:request_sync('textDocument/codeAction', {
		textDocument = vim.lsp.util.make_text_document_params(buffer),
		range = {
			start = { line = 0, character = 0 },
			['end'] = { line = vim.api.nvim_buf_line_count(buffer), character = 0 },
		},
		context = { only = { kind }, diagnostics = {} },
	}, 2000, buffer)

	for _, action in ipairs(response and response.result or {}) do
		-- Resolve first because ruff returns the action without its edit
		if not action.edit and client:supports_method('codeAction/resolve') then
			local resolved =
				client:request_sync('codeAction/resolve', action, 2000, buffer)
			action = resolved and resolved.result or action
		end
		if action.edit then
			vim.lsp.util.apply_workspace_edit(action.edit, client.offset_encoding)
		end
	end
end

-- Register before conform because autocmds run in order and fixes go first
vim.api.nvim_create_autocmd('BufWritePre', {
	group = group,
	callback = function(event)
		apply_source_action(event.buf, 'eslint', 'source.fixAll.eslint')
		apply_source_action(event.buf, 'gopls', 'source.organizeImports')
		apply_source_action(event.buf, 'ruff', 'source.organizeImports')
	end,
})

-- Spell check prose only because code is full of words the dictionary lacks
vim.api.nvim_create_autocmd('FileType', {
	group = group,
	pattern = { 'gitcommit', 'markdown', 'text' },
	callback = function()
		vim.opt_local.spell = true
	end,
})

-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
	group = group,
	callback = function()
		vim.hl.on_yank()
	end,
})
