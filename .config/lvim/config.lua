--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

require("nvim-treesitter.install").prefer_git = true

local path = debug.getinfo(1, 'S').source
local config_directory = string.match(path, '^(.*/).*.lua')
package.path = package.path .. ';/Users/lorentz/.config/lvim/lua/user/?.lua'

local luasnip = require('luasnip')
luasnip.filetype_extend('javascript', { 'javascriptreact' })
luasnip.config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnipets = false
})
vim.keymap.set({ 'i', 's' }, '<C-l>', function ()
  if luasnip.jumpable(1) then
    luasnip.jump(1)
  end
end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<C-h>', function ()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, { silent = true })

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
lvim.builtin.terminal.shell = 'fish'
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

lvim.keys.normal_mode["gR"] = "<cmd>TroubleToggle lsp_references<cr>"

-- keymapping for inserting a blank line
-- lvim.keys.normal_mode["<CR>"] = "o<Esc>"
-- lvim.keys.normal_mode["^M"] = "O<Esc>"

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
lvim.builtin.which_key.mappings["A"] = {
  "+AI",
  i = {
    function ()
      vim.ui.input({
        prompt = "What do you want to inject here?"
      }, function (prompt)
          vim.cmd("NeoAIInject " .. prompt)
        end)
    end, "Inject from ChatGPT answers"
  },
  t = { "<cmd>NeoAIToggle<cr>", "Toggle ChatGPT chat UI" },
}
lvim.builtin.which_key.mappings["B"] = {
  name = "+Bookmark",
  a = { "<cmd>BookmarkAnnotate<cr>", "Add/edit/remove annotation bookmark" },
  t = { "<cmd>BookmarkToggle<cr>", "Toggle bookmark at current line" },
  l = { "<cmd>BookmarkShowAll<cr>", "List all bookmarks in quickfix" },
}
lvim.builtin.which_key.mappings["D"] = {
  name = "+Diagnostics",
  c = { "<cmd>TroubleToggle document_diagnostics<cr>", "Toggle diagnostics window of current buffer" },
  l = { "<cmd>lua require('lsp_lines').toggle()<cr>", "Toggle diagnostics in virtual lines" },
  s = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Show diagnostics for current line" },
}
lvim.builtin.which_key.mappings["f"] = {
  name = "+Find",
  c = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current buffer" },
  b = { "<cmd>Telescope buffers<cr>", "Buffers" },
  B = {
    name = "+Bookmarks",
    a = { "<cmd>Telescope vim_bookmarks all<cr>", "All bookmarks" },
    c = { "<cmd>Telescope vim_bookmarks current_file<cr>", "Current file only" }
  },
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
      '<cmd>g/console.log/d _<cr><cmd>nohlsearch<cr>',
      "Delete all lines with console.log()s",
    },
  }
}
lvim.builtin.which_key.mappings["H"] = {
  name = "+Harpoon",
  a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add current file" },
  f = { "<cmd>Telescope harpoon marks<cr>", "Find marks" },
  m = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle menu" },
  h = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Navigate to next marked file" },
  l = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Navigate to previous marked file" },
}
lvim.builtin.which_key.mappings["i"] = {
  name = "+Set indent size",
  ["2"] = { "<cmd>set tabstop=2 shiftwidth=2<cr>", "Set to 2" },
  ["4"] = { "<cmd>set tabstop=4 shiftwidth=4<cr>", "Set to 4" },
}
lvim.builtin.which_key.mappings["j"] = { "<cmd>TSJToggle<cr>", "Toggle code join" }
lvim.builtin.which_key.mappings["m"] = {
  name = "+Mark",
  t = { "<cmd>HiMyWordsToggle<cr>", "Toggle mark on current word" },
  c = { "<cmd>HiMyWordsClear<cr>", "Clear all marks" },
  f = { "<cmd>lua require('nvim-tree.api').marks.navigate.select()<cr>", "Find marked files" },
  n = { "<cmd>lua require('nvim-tree.api').marks.navigate.next()<cr>", "Jump to next marked files" },
  p = { "<cmd>lua require('nvim-tree.api').marks.navigate.prev()<cr>", "Jump to prev marked files" },
}
lvim.builtin.which_key.mappings["M"] = {
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
  h = { function ()
    local Terminal = require('toggleterm.terminal').Terminal
    local htopTerm = Terminal:new({
      cmd = "htop",
      direction = "float",
      hidden = true,
      float_opts = {
        border = "none",
        width = 100000,
        height = 100000,
      },
    })
    htopTerm:toggle()
  end, "Toggle htop" },
}
lvim.builtin.which_key.mappings["r"] = {
  name = "+Run",
  n = {
    function ()
      local extension = vim.fn.expand('%:e')
      local Terminal = require('toggleterm.terminal').Terminal
      local path = vim.api.nvim_buf_get_name(0)
      local command = "echo 'This file is not runnable by configuration'"
      if extension == 'js' or extension == 'cjs' or extension == 'mjs' then
        command = "node " .. path
      elseif extension == 'ts' then
        command = "ts-node " .. path
      elseif extension == 'rs' then
        command = "cargo run"
      end
      local taskTerm = Terminal:new({
        cmd = command,
        direction = "float",
        hidden = true,
        close_on_exit = false,
        float_opts = {
          width = 100,
          height = 20,
        },
      })
      taskTerm:toggle()
    end,
    "Node run"
  },
  j = {
    function ()
      local Terminal = require('toggleterm.terminal').Terminal
      local filename = vim.fn.expand('%:p:r')
      local taskTerm = Terminal:new({
        cmd = 'NODE_OPTIONS="--experimental-vm-modules --no-warnings" jest ' .. filename,
        direction = "float",
        hidden = true,
        close_on_exit = false,
        float_opts = {
          width = 100,
          height = 20,
        },
      })
      taskTerm:toggle()
    end,
    "Jest"
  },
  s = {
    function ()
      local Terminal = require('toggleterm.terminal').Terminal
      local path = vim.api.nvim_buf_get_name(0)
      local taskTerm = Terminal:new({
        cmd = 'bash ' .. path,
        direction = "float",
        hidden = true,
        close_on_exit = false,
        float_opts = {
          width = 100,
          height = 20,
        },
      })
      taskTerm:toggle()
    end,
    'Bash'
  }
}
lvim.builtin.which_key.mappings["R"] = { "<cmd>RnvimrToggle<cr>", "Ranger" }
lvim.builtin.which_key.mappings["s"] = {
  name = "+Substitution",
  l = { "", "Line wise" },
  b = { "", "Entire buffer" },
}
lvim.builtin.which_key.mappings["S"] = {
  name = "+Session Manager",
  l = { "<cmd>SessionManager load_last_session<cr>", "Load last saved session" },
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

lvim.builtin.which_key.vmappings["A"] = {
  "+AI",
  t = { "<cmd>'<,'>NeoAIContext<cr>", "Open ChatGPT chat UI with selected code" }
}
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
      local msg = string.format('Capture saved to the clipboard with title:\n"%s"', filename)
      vim.notify(msg, vim.log.levels.INFO, {
        title = 'Silicon'
      })
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
  "vue",
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
local lspconfig = require('lspconfig')
local root_pattern = lspconfig.util.root_pattern
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
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}
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

lsp_manager.setup('eslint', {
  capabilities = capabilities
})

vim.filetype.add({
  extension = {
    mpx = 'mpx',
    wxs = 'javascript'
  }
})

vim.treesitter.language.register('vue', 'mpx')
vim.treesitter.language.register('javascript', 'wxs')

local configs = require('lspconfig.configs')
if not configs.mpx_ls then
  configs.mpx_ls = {
    default_config = {
      cmd = { 'vls' },
      root_dir = lspconfig.util.root_pattern('package.json'),
      filetypes = { 'mpx' },
    },
  }
end
lspconfig.mpx_ls.setup{
  capabilities = capabilities,
  cmd = { 'vls' },
  filetypes = { 'mpx' },
  root_dir = root_pattern('package.json'),
  on_attach = function(client, bufnr)
    --[[
        Internal Vetur formatting is not supported out of the box

        This line below is required if you:
          - want to format using Nvim's native `vim.lsp.buf.formatting**()`
          - want to use Vetur's formatting config instead, e.g, settings.vetur.format {...}
    --]]
    -- client.resolved_capabilities.document_formatting = true
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true }

    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  end,
  init_options = {
    config = {
      css = {},
      emmet = {},
      html = {
        suggest = {}
      },
      javascript = {
        format = {}
      },
      stylusSupremacy = {},
      typescript = {
        format = {}
      },
      mpx = {
        completion = {
          autoImport = false,
          tagCasing = "kebab",
          useScaffoldSnippets = false
        },
        format = {
          defaultFormatter = {
            js = "none",
            ts = "none"
          },
          defaultFormatterOptions = {},
          scriptInitialIndent = false,
          styleInitialIndent = false
        },
        useWorkspaceDependencies = false,
        validation = {
          script = true,
          style = true,
          template = true
        }
      }
    }
  },
  settings = {
    css = {},
    emmet = {},
    html = {
      suggest = {}
    },
    javascript = {
      format = {}
    },
    stylusSupremacy = {},
    typescript = {
      format = {}
    },
    mpx = {
      completion = {
        autoImport = true,
        useScaffoldSnippets = true
      },
      format = {
        defaultFormatter = {
          html = "none",
          js = "prettier",
          ts = "prettier",
        }
      },
      validation = {
        template = true,
        script = true,
        style = true,
        templateProps = true,
        interpolation = true
      },
      experimental = {
        templateInterpolationService = true
      }
    }
  },
}

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
lvim.plugins = {
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
    -- init = function()
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
    init = function()
      require("nvim-ts-autotag").setup()
    end
  },
  reload('user.extra-plugins.vista'),
  -- {
  --     "preservim/tagbar",
  --     init = function ()
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

  -- highlight and search for todo comments like TODO, FIX, WARNING, PERF, NOTE
  reload('user.extra-plugins.todo-comments'),

  -- task runner and job management plugin
  reload('user.extra-plugins.overseer'),

  {
    'echasnovski/mini.animate',
    init = function ()
      require('mini.animate').setup()
    end
  },
  {
    'MattesGroeger/vim-bookmarks',
    init = function ()
      vim.g.bookmark_sign = ''
      vim.g.bookmark_annotation_sign = ''
      vim.g.bookmark_no_default_key_mappings = 0
      vim.g.bookmark_auto_close = 1
      vim.g.bookmark_display_annotation = 1
      vim.g.bookmark_highlight_lines = 1
    end
  },
  {
    'tom-anders/telescope-vim-bookmarks.nvim',
    init = function ()
      
    end
  },
  {
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
      vim.diagnostic.config({
        virtual_text = false,
      })
    end,
  },
  {
    'kkharji/sqlite.lua'
  },
  {
    "ecthelionvi/NeoComposer.nvim",
    dependencies = { "kkharji/sqlite.lua" },
    config = function ()
      require("NeoComposer").setup({
        notify = true,
        delay_timer = "150",
        status_bg = "#16161e",
        preview_fg = "#ff9e64",
        keymaps = {
          play_macro = "Q",
          yank_macro = "yq",
          stop_macro = "cq",
          toggle_record = "q",
          cycle_next = "<c-n>",
          cycle_prev = "<c-p>",
          toggle_macro_menu = "<c-q>",
        },
      })
    end
  },
  {
    "Bryley/neoai.nvim",
    require = { "MunifTanjim/nui.nvim" },
    config = function ()
      require('neoai').setup({
        -- Below are the default options, feel free to override what you would like changed
        ui = {
          output_popup_text = "NeoAI",
          input_popup_text = "Prompt",
          width = 40,      -- As percentage eg. 30%
          output_popup_height = 80, -- As percentage eg. 80%
          submit = "<Enter>", -- Key binding to submit the prompt
        },
        models = {
          {
            name = "openai",
            model = "gpt-3.5-turbo",
            params = nil,
          },
        },
        register_output = {
          ["g"] = function(output)
            return output
          end,
          ["c"] = require("neoai.utils").extract_code_snippets,
        },
        inject = {
          cutoff_width = 75,
        },
        prompts = {
          context_prompt = function(context)
            return "Hey, I'd like to provide some context for future "
              .. "messages. Here is the code/text that I want to refer "
              .. "to in our upcoming conversations:\n\n"
              .. context
          end,
        },
        mappings = {
          ["select_up"] = "<C-k>",
          ["select_down"] = "<C-j>",
        },
        use_api_key_from_config = true,
        openai_api_key = "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",
        open_api_key_env = "OPENAI_API_KEY",
        proxy_url = "localhost:7890",
        shortcuts = {
          -- {
          --   name = "textify",
          --   key = "<leader>as",
          --   desc = "fix text with AI",
          --   use_context = true,
          --   prompt = [[
          --       Please rewrite the text to make it more readable, clear,
          --       concise, and fix any grammatical, punctuation, or spelling
          --       errors
          --   ]],
          --   modes = { "v" },
          --   strip_function = nil,
          -- },
          -- {
          --   name = "gitcommit",
          --   key = "<leader>ag",
          --   desc = "generate git commit message",
          --   use_context = false,
          --   prompt = function ()
          --     return [[
          --           Using the following git diff generate a consise and
          --           clear git commit message, with a short title summary
          --           that is 75 characters or less:
          --       ]] .. vim.fn.system("git diff --cached")
          --   end,
          --   modes = { "n" },
          --   strip_function = nil,
          -- },
        },
      })
    end
  },
  {
    "dvoytik/hi-my-words.nvim",
    config = function ()
      require("hi-my-words").setup({
        silent = false,
        hl_grps = {
          {
            "HiMyWordsHLG0",
            { ctermfg = 130, ctermbg = 21, fg = "#eea47f", bg = "#00539c", bold = true, italic = true },
          },
          {
            "HiMyWordsHLG1",
            { ctermfg = 0, ctermbg = 11, fg = "#101820", bg = "#fee715", bold = true, italic = true },
          },
          {
            "HiMyWordsHLG2",
            { ctermfg = 0, ctermbg = 11, fg = "#ccf381", bg = "#4831d4", bold = true, italic = true },
          },
          {
            "HiMyWordsHLG3",
            { ctermfg = 0, ctermbg = 11, fg = "#e2d1f9", bg = "#317773", bold = true, italic = true },
          },
          {
            "HiMyWordsHLG4",
            { ctermfg = 15, ctermbg = 1, fg = "#ffffff", bg = "#8aaae5", bold = true, italic = true },
          },
          {
            "HiMyWordsHLG5",
            { ctermfg = 15, ctermbg = 1, fg = "#fcf6f5", bg = "#990011", bold = true, italic = true },
          },
          {
            "HiMyWordsHLG6",
            { ctermfg = 0, ctermbg = 11, fg = "#2f3c7e", bg = "#fbeaeb", bold = true, italic = true },
          },
          {
            "HiMyWordsHLG7",
            { ctermfg = 0, ctermbg = 11, fg = "#2c5f2d", bg = "#97bc62", bold = true, italic = true },
          },
          {
            "HiMyWordsHLG8",
            { ctermfg = 0, ctermbg = 11, fg = "#408ec6", bg = "#1e2761", bold = true, italic = true },
          },
          {
            "HiMyWordsHLG9",
            { ctermfg = 15, ctermbg = 1, fg = "#990011", bg = "#fcf6f5", bold = true, italic = true },
          },
        },
      })
    end
  },
  {
    'ThePrimeagen/harpoon',
    require = { 'nvim-lua/plenary.nvim' },
    config = function ()
      require('harpoon').setup({
        global_settings = {
          -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
          save_on_toggle = false,

          -- saves the harpoon file upon every change. disabling is unrecommended.
          save_on_change = true,

          -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
          enter_on_sendcmd = false,

          -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
          tmux_autoclose_windows = false,

          -- filetypes that you want to prevent from adding to the harpoon list menu.
          excluded_filetypes = { "harpoon" },

          -- set marks specific to each git branch inside git repository
          mark_branch = false,

          -- enable tabline with harpoon marks
          tabline = false,
          tabline_prefix = "   ",
          tabline_suffix = "   ",
        }
      })
      require("telescope").load_extension('harpoon')
    end
  },
  {
    "chrisgrieser/nvim-various-textobjs",
    config = function () 
      require("various-textobjs").setup({
        -- lines to seek forwards for "small" textobjs (mostly characterwise textobjs)
        -- set to 0 to only look in the current line
        lookForwardSmall = 5,

        -- lines to seek forwards for "big" textobjs (linewise textobjs & url textobj)
        lookForwardBig = 15,

        -- use suggested keymaps (see README)
        useDefaultKeymaps = true,

        -- disable some default keymaps, e.g. { "ai", "ii" }
        disabledKeymaps = {},
      })
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    config = function ()
      local rt = require("rust-tools")

      rt.setup({
        tools = { -- rust-tools options

          -- how to execute terminal commands
          -- options right now: termopen / quickfix / toggleterm / vimux
          executor = require("rust-tools.executors").termopen,

          -- callback to execute once rust-analyzer is done initializing the workspace
          -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
          on_initialized = nil,

          -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
          reload_workspace_from_cargo_toml = true,

          -- These apply to the default RustSetInlayHints command
          inlay_hints = {
            -- automatically set inlay hints (type hints)
            -- default: true
            auto = true,

            -- Only show inlay hints for the current line
            only_current_line = false,

            -- whether to show parameter hints with the inlay hints or not
            -- default: true
            show_parameter_hints = true,

            -- prefix for parameter hints
            -- default: "<-"
            parameter_hints_prefix = "<- ",

            -- prefix for all the other hints (type, chaining)
            -- default: "=>"
            other_hints_prefix = "=> ",

            -- whether to align to the length of the longest line in the file
            max_len_align = false,

            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,

            -- whether to align to the extreme right or not
            right_align = false,

            -- padding from the right if right_align is true
            right_align_padding = 7,

            -- The color of the hints
            highlight = "Comment",
          },

          -- options same as lsp hover / vim.lsp.util.open_floating_preview()
          hover_actions = {

            -- the border that is used for the hover window
            -- see vim.api.nvim_open_win()
            border = {
              { "╭", "FloatBorder" },
              { "─", "FloatBorder" },
              { "╮", "FloatBorder" },
              { "│", "FloatBorder" },
              { "╯", "FloatBorder" },
              { "─", "FloatBorder" },
              { "╰", "FloatBorder" },
              { "│", "FloatBorder" },
            },

            -- Maximal width of the hover window. Nil means no max.
            max_width = nil,

            -- Maximal height of the hover window. Nil means no max.
            max_height = nil,

            -- whether the hover action window gets automatically focused
            -- default: false
            auto_focus = false,
          },

          -- settings for showing the crate graph based on graphviz and the dot
          -- command
          crate_graph = {
            -- Backend used for displaying the graph
            -- see: https://graphviz.org/docs/outputs/
            -- default: x11
            backend = "x11",
            -- where to store the output, nil for no output stored (relative
            -- path from pwd)
            -- default: nil
            output = nil,
            -- true for all crates.io and external crates, false only the local
            -- crates
            -- default: true
            full = true,

            -- List of backends found on: https://graphviz.org/docs/outputs/
            -- Is used for input validation and autocompletion
            -- Last updated: 2021-08-26
            enabled_graphviz_backends = {
              "bmp",
              "cgimage",
              "canon",
              "dot",
              "gv",
              "xdot",
              "xdot1.2",
              "xdot1.4",
              "eps",
              "exr",
              "fig",
              "gd",
              "gd2",
              "gif",
              "gtk",
              "ico",
              "cmap",
              "ismap",
              "imap",
              "cmapx",
              "imap_np",
              "cmapx_np",
              "jpg",
              "jpeg",
              "jpe",
              "jp2",
              "json",
              "json0",
              "dot_json",
              "xdot_json",
              "pdf",
              "pic",
              "pct",
              "pict",
              "plain",
              "plain-ext",
              "png",
              "pov",
              "ps",
              "ps2",
              "psd",
              "sgi",
              "svg",
              "svgz",
              "tga",
              "tiff",
              "tif",
              "tk",
              "vml",
              "vmlz",
              "wbmp",
              "webp",
              "xlib",
              "x11",
            },
          },
        },

        -- all the opts to send to nvim-lspconfig
        -- these override the defaults set by rust-tools.nvim
        -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
        server = {
          -- standalone file support
          -- setting it to false may improve startup time
          standalone = true,
          on_attach = function(client, bufnr)
            require("lvim.lsp").common_on_attach(client, bufnr)
            -- Hover actions
            vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
          end,
          on_init = require("lvim.lsp").common_on_init,
          capabilities = require("lvim.lsp").common_capabilities(),
          settings = {
            ["rust-analyzer"] = {
              inlayHints = { locationLinks = false },
              lens = {
                enable = true,
              },
              checkOnSave = {
                enable = true,
                command = "clippy",
              },
            },
          },
        }, -- rust-analyzer options

        -- debugging stuff
        dap = {
          adapter = {
            type = "executable",
            command = "lldb-vscode",
            name = "rt_lldb",
          },
        },
      })
    end
  }
}

-- this is a comment
-- lvim.builtin.lualine.sections.lualine_c = {
--   { require('NeoComposer.ui').status_recording },
-- }

require('telescope').load_extension('vim_bookmarks')

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
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = '*',
--   command = 'TroubleRefresh'
-- })
vim.api.nvim_create_autocmd('CursorHold', {
  pattern = '*',
  command = 'checktime'
})
-- vim.o.updatetime = 250
vim.api.nvim_create_autocmd('CursorHold', {
  buffer = bufnr,
  callback = function ()
    local opts = {
      focusable = false,
      close_events = {
        'BufLeave',
        'CursorMoved',
        'InsertEnter',
        'FocusLost'
      },
      border = 'rounded',
      source = 'always',
      prefix = '  ',
      scope = 'cursor', -- or 'line'
      max_width = 70,
    }
    vim.diagnostic.open_float(nil, opts)
  end
})

-- -- Debugging
-- -- =============================
if lvim.builtin.dap.active then
  reload('user.dap-config').config()
end
