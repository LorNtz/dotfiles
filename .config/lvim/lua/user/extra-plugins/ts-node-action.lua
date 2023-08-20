local helpers = require('ts-node-action.helpers')

local map = {
  ['const'] = 'let',
  ['let'] = 'const',
}

return {
  'ckolkey/ts-node-action',
  requires = { 'nvim-treesitter' },
  config = function() -- Optional
    require("ts-node-action").setup({
      ['*'] = {
        ['lexical_declaration'] = function (node)
          -- local text = helpers.node_text(node)
          local text = vim.treesitter.get_node_text(node, vim.api.nvim_get_current_buf())
          vim.treesitter.inspect_tree()
          -- local replaced_text = map[text]
          -- if replaced_text then
          --   return replaced_text
          -- end
          return text
        end
      }
    })
  end
}
