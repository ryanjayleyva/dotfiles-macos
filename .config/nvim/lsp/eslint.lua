local M = {}

M.spec = {
  cmd = { 'vscode-eslint-language-server', '--stdio' },

  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'json',
    'yaml',
  },

  root_markers = {
    '.eslintrc',
    '.eslintrc.js',
    '.eslintrc.cjs',
    '.eslintrc.json',
    '.eslintrc.yaml',
    '.eslintrc.yml',
    'eslint.config.js',
    'eslint.config.cjs',
    'eslint.config.mjs',
    'eslint.config.ts',
    'package.json',
    'pnpm-lock.yaml',
    'yarn.lock',
    'package-lock.json',
    'bun.lock',
    'bun.lockb',
    '.git',
  },

  settings = {
    validate = 'on',
    useESLintClass = false,
    experimental = {
      useFlatConfig = true,
    },
    codeAction = {
      disableRuleComment = {
        enable = true,
        location = 'separateLine',
      },
      showDocumentation = {
        enable = true,
      },
    },
    format = false,
    quiet = false,
    onIgnoredFiles = 'off',
    run = 'onType',
    nodePath = '',
    workingDirectory = { mode = 'location' },
  },

  single_file_support = false,
  log_level = vim.lsp.protocol.MessageType.Warning,
}

M.name = 'eslint'

return M.spec
