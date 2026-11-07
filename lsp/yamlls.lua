-- Accept CloudFormation tags because the parser flags unknown tags
local cloudformation_tags = {
	'!Ref scalar',
	'!Sub scalar',
	'!GetAtt scalar',
	'!ImportValue scalar',
	'!Join sequence',
	'!Select sequence',
	'!If sequence',
}

return {
	cmd = {
		'yaml-language-server',
		'--stdio',
	},

	filetypes = {
		'yaml',
	},

	root_markers = {
		'.git',
	},

	settings = {
		yaml = {
			-- Turn off the built-in store because schemastore.nvim provides the schemas
			schemaStore = { enable = false },
			format = { enable = true },
			schemas = require('schemastore').yaml.schemas(),
			customTags = cloudformation_tags,
		},
	},
}
