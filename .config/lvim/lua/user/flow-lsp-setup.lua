local configs = require('lspconfig/configs')
local util = require('lspconfig/util')

function flow_config()
  local bin_name = 'typescript-language-server'
  if vim.fn.has 'win32' == 1 then
    bin_name = bin_name .. '.cmd'
  end
  configs.tsserver = {
    default_config = {
      init_options = { hostInfo = 'neovim' },
      cmd = { bin_name, '--stdio' },
      filetypes = {
        'javascript',
        'javascriptreact',
        'javascript.jsx',
        'typescript',
        'typescriptreact',
        'typescript.tsx',
      },
      root_dir = function(fname)
        return util.root_pattern('tsconfig.json')(fname) and not util.root_pattern('.flowconfig')(fname)
          or util.root_pattern('package.json', 'jsconfig.json', '.git')(fname)
      end,
    },
    docs = {
      description = [[
https://github.com/theia-ide/typescript-language-server
`typescript-language-server` depends on `typescript`. Both packages can be installed via `npm`:
```sh
npm install -g typescript typescript-language-server
```
]],
      default_config = {
        root_dir = [[root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")]],
      },
    },
  }

  configs.flow = {
    default_config = {
      cmd = { 'npx', '--no-install', 'flow', 'lsp' },
      filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx' },
      root_dir = util.root_pattern('.flowconfig'),
    },
    docs = {
      package_json = 'https://raw.githubusercontent.com/flowtype/flow-for-vscode/master/package.json',
      description = [[
https://flow.org/
https://github.com/facebook/flow
See below for how to setup Flow itself.
https://flow.org/en/docs/install/
See below for lsp command options.
```sh
npx flow lsp --help
```
    ]],
      default_config = {
        root_dir = [[root_pattern(".flowconfig")]],
      },
    },
  }
end

return flow_config
