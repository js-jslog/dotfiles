-- LSP configuration
-- Documentation: https://github.com/neovim/nvim-lspconfig
local lspconfig = require'lspconfig'

-- Use default tsserver config
lspconfig.tsserver.setup{}

-- Use diagnosticls (by any means at this point..)
-- Copied and modified from https://github.com/nvim-lua/wishlist/issues/9#issuecomment-693311042
-- Documentation: https://github.com/iamcco/diagnostic-languageserver
lspconfig.diagnosticls.setup{
  filetypes={'javascript', 'javascriptreact', 'typescript', 'typescriptreact'},
  init_options = {
    linters = {
      eslint = {
        command = './node_modules/.bin/eslint',
        rootPatterns = {'.git'},
        debounce = 100,
        args = {
          '--stdin',
          '--stdin-filename',
          '%filepath',
          '--format',
          'json'
        },
        sourceName = 'eslint',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '${message} [${ruleId}]',
          security = 'severity'
        },
        securities = {
          [2] = 'error',
          [1] = 'warning',
        },
      },
    },
    filetypes = {
      javascript = 'eslint',
      javascriptreact = 'eslint',
      typescript = 'eslint',
      typescriptreact = 'eslint'
    },
    formatters = {
      prettier = {
        command = "./node_modules/.bin/prettier",
        args = {"--stdin-filepath" ,"%filepath", '--single-quote', '--print-width 120'}
      }
    },
    formatFiletypes = {
      javascript = 'prettier',
      javascriptreact = 'prettier',
      typescript = 'prettier',
      typescriptreact = 'prettier'
    },
  }
}
