return {
  "jdhao/better-escape.vim",
  event = "InsertEnter",
  setup = function()
    vim.cmd("let g:better_escape_shortcut = ['jk', 'kj', 'jj', 'kk']")
    -- vim.cmd ("let g:better_escape_interval = 200")
  end
}
