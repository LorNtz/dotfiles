--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
local path = debug.getinfo(1, 'S').source
local config_directory = string.match(path, '^(.*/).*.lua')
package.path = package.path .. ';/Users/lorentz/.config/lvim/lua/user/?.lua'

-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "tokyonight-night"
lvim.transparent_window = false
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 10

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
lvim.builtin.terminal.open_mapping = [[<C-Bslash>]]
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- add your own keymapping
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- <Option+j> move a line down and auto indent
lvim.keys.normal_mode["<M-j>"] = ":m .+1<CR>=="
lvim.keys.normal_mode["∆"] = ":m .+1<CR>=="
lvim.keys.visual_mode["∆"] = ":m '>+1<CR>gv=gv"
-- lvim.keys.insert_mode["∆"] = "<Esc>:m .+1<CR>==gi"
-- <Option+k> move a line up and auto indent
lvim.keys.normal_mode["˚"] = ":m .-2<CR>=="
lvim.keys.visual_mode["˚"] = ":m '<-2<CR>gv=gv"
-- lvim.keys.insert_mode["˚"] = "<Esc>:m .-2<CR>==gi"

-- keymapping for inserting a blank line
lvim.keys.normal_mode["<CR>"] = "o<Esc>"
lvim.keys.normal_mode["^M"] = "O<Esc>"

-- keymapping for toggling floating terminal
lvim.keys.insert_mode["<C-t>"] = ":ToggleTerm direction=float<CR>"
lvim.keys.normal_mode["<C-t>"] = ":ToggleTerm direction=float<CR>"
lvim.keys.term_mode["<C-t>"] = "<C-\\><C-n><C-w>l"
lvim.keys.normal_mode["tt"] = ":ToggleTerm direction=float<CR>"
lvim.keys.term_mode["tt"] = "<C-\\><C-n><C-w>l"

-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }
lvim.builtin.which_key.mappings["a"] = { "<cmd>AerialToggle<cr>", "Toggle Aerial" }
lvim.builtin.which_key.mappings["f"] = {
  name = "+Find",
  c = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current buffer" },
  b = { "<cmd>Telescope buffers<cr>", "Buffers" },
  d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
  f = { "<cmd>Telescope find_files<cr>", "Files" },
  g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
  p = { "<cmd>Telescope fd<cr>", "Files with preview" },
  s = { "<cmd>Telescope treesitter<cr>", "Treesitter symbols" },
  r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
  l = {
    name = "+LSP",
    r = { "<cmd>Telescope lsp_references<cr>", "References" },
    d = { "<cmd>Telescope lsp_document_symbols<cr>", "Document symbols" },
    w = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace symbols" },
  },
  m = { "<cmd>Telescope marks<cr>", "Marks" },
  o = {
    name = "+Others",
    c = { "<cmd>Telescope commands<cr>", "Find commands" },
    h = { "<cmd>Telescope help_tags<cr>", "Help tags" },
    r = { "<cmd>Telescope registers<cr>", "Registers" },
  },
}
lvim.builtin.which_key.mappings["G"] = {
  name = "+Global commands",
  l = {
    name = "+Manage console.log()s",
    ["/"] = {
      '<cmd>g/^ *console.log/exe "norm! I// "<cr><C-o><cmd>nohlsearch<cr>',
      "Comment all single line console.log()s"
    },
    ["\\"] = {
      '<cmd>g/^ *\\(\\/\\/ \\)\\+console.log/s/^\\s*\\zs\\(\\/\\/ \\)\\+\\zeconsole.log/<cr><C-o><cmd>nohlsearch<cr>',
      "Uncomment all single line console.log()s"
    },
    d = {
      '<cmd>g/console.log/d _<cr><C-o><cmd>nohlsearch<cr>',
      "Delete all lines with console.log()s",
    },
  }
}
lvim.builtin.which_key.mappings["i"] = {
  name = "+Set indent size",
  ["2"] = { "<cmd>set tabstop=2 shiftwidth=2<cr>", "Set to 2" },
  ["4"] = { "<cmd>set tabstop=4 shiftwidth=4<cr>", "Set to 4" },
}
lvim.builtin.which_key.mappings["j"] = { "<cmd>TSJToggle<cr>", "Toggle code join" }
lvim.builtin.which_key.mappings["m"] = {
  name = "+Minimap",
  o = { function() require('codewindow').open_minimap() end, "Open minimap" },
  c = { function() require('codewindow').close_minimap() end, "Close minimap" },
  m = { function() require('codewindow').toggle_minimap() end, "Toggle minimap" },
  f = { function() require('codewindow').toggle_focus() end, "Toggle focus on minimap" }
}
lvim.builtin.which_key.mappings["n"] = { function ()
  require("ts-node-action").node_action()
end, "Toggle Node Action" }
lvim.builtin.which_key.mappings["o"] = { "<cmd>SymbolsOutline<cr>", "Outline" }
lvim.builtin.which_key.mappings["O"] = {
  name = "+Others",
  d = { "", "Toggle diagnostics" }
}
lvim.builtin.which_key.mappings["r"] = { "<cmd>RnvimrToggle<cr>", "Ranger" }
lvim.builtin.which_key.mappings["S"] = {
  name = "+Session Manager",
  l = { "<cmd>SessionManager load_last_session<cr>", "Load last session" },
  L = { "<cmd>SessionManager load_session<cr>", "Load a session from saved session files" },
  s = { "<cmd>SessionManager save_current_session<cr>", "Save Current Session" },
  S = {
    name = "+Other Save Options",
    n = { "<cmd>SessionManager save_current_session_to_new_file<cr>", "Save to a new session file" },
    e = { "<cmd>SessionManager save_current_to_existing_file<cr>", "Save to an existing file" },
  },
  d = { "<cmd>SessionManager delete_session<cr>", "Delete a session from list" }
}
lvim.builtin.which_key.mappings["v"] = {
  name = "+Vista",
  v = { "<cmd>Vista nvim_lsp<cr>", "Open vista" },
  c = { "<cmd>Vista!<cr>", "Close vista" }
}
lvim.builtin.which_key.mappings["x"] = { "<cmd>e!<cr>", " Discard all changes of current file" }
lvim.builtin.which_key.mappings["y"] = { "ggyG<C-o>", "Copy content of current file" }
lvim.builtin.which_key.vmappings["s"] = {
  function ()
    vim.api.nvim_feedkeys('y', 'n', false) -- copy selected lines
    vim.schedule(function ()
      local startno = vim.fn.line("'<")
      local path = vim.api.nvim_buf_get_name(0)
      local cwd = vim.fn.getcwd() .. '/'
      local filename = string.sub(path, string.len(cwd) + 1)
      local extension = vim.fn.expand('%:e')
      local cmd = 'silicon --from-clipboard --to-clipboard -l ' .. extension .. ' --line-offset ' .. startno .. ' --window-title ' .. filename
      os.execute(cmd)
      print('title:', filename)
    end)
  end, "Silicon Snapshot"
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.dap.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.view.width = 25
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.telescope.pickers.buffers.initial_mode = "normal"

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)
local lspconfig_util = require('lspconfig/util')
local root_pattern = lspconfig_util.root_pattern
local lsp_manager = require('lvim.lsp.manager')
lsp_manager.setup('tsserver', {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  init_options = {
    hostInfo = "neovim"
  },
  root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
  -- root_dir = function (fname)
  --   return root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")(fname)
  --     and not root_pattern(".flowconfig")(fname)
  -- end,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.references = true
lsp_manager.setup('flow', {
  cmd = { 'flow', 'lsp' },
  filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx' },
  root_dir = root_pattern('.flowconfig'),
  capabilities = capabilities,
  on_attach = function (client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true }

    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  end
})

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {-- {{{
  -- UI plugin for vim.notify()
  reload('user.extra-plugins.nvim-notify'),

  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup {
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
    end,
  },

  -- ranger client for nvim
  reload('user.extra-plugins.rnvimr'),

  -- {
  --     'wfxr/minimap.vim',
  --     run = "cargo install --locked code-minimap",
  --     -- cmd = {"Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight"},
  --     config = function ()
  --         vim.cmd ("let g:minimap_width = 10")
  --         vim.cmd ("let g:minimap_auto_start = 1")
  --         vim.cmd ("let g:minimap_auto_start_win_enter = 1")
  --     end,
  -- },

  -- alternative for minimap.vim
  reload('user.extra-plugins.codewindow'),

  -- provide mappings to delete, change and add surroundings in pairs
  {
    "tpope/vim-surround",
    -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
    -- setup = function()
    --  vim.o.timeoutlen = 500
    -- end
  },
  {
    "tpope/vim-repeat",
  },

  -- enhance the builtin F f, T t and ; keys
  {
    "dahu/vim-fanfingtastic"
  },
  {
    "windwp/nvim-ts-autotag",
    setup = function()require("nvim-ts-autotag").setup()end
  },
  reload('user.extra-plugins.vista'),
  -- {
  --     "preservim/tagbar",
  --     setup = function ()
  --         vim.g.tagbar_ctags_bin = ""
  --     end,
  -- },
  reload('user.extra-plugins.symbols-outline'),
  reload('user.extra-plugins.aerial'),
  reload('user.extra-plugins.pretty-fold'),

  -- toggle code join
  reload('user.extra-plugins.treesj'),

  -- provide a quick way of going back to normal mode under insert mode
  reload('user.extra-plugins.better-escape'),

  -- toggle node actions
  reload('user.extra-plugins.ts-node-action'),

  -- session management
  reload('user.extra-plugins.neovim-session-manager'),

  -- UI improvement based on vim core ui hooks
  reload('user.extra-plugins.dressing'),

  -- annotation generator
  reload('user.extra-plugins.neogen'),

  reload('user.extra-plugins.noice'),
  reload('user.extra-plugins.trouble'),

  -- task runner and job management plugin
  reload('user.extra-plugins.overseer'),
}-- }}}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

-- -- Debugging
-- -- =============================
if lvim.builtin.dap.active then
  -- dap_config()
  reload('user.dap-config').config()
end
