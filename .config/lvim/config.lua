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

-- lua file paths
-- package.path = package.path .. ';/Users/lorentz/.config/lvim/lua/user/?.lua'
package.path = package.path .. ';/Users/didi/.config/lvim/lua/user/?.lua'

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

-- prevent * searching from jumping to next match
vim.keymap.set({ 'n' }, '*', "<cmd>let @/= '\\<' . expand('<cword>') . '\\>' <bar> set hls <cr>")

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

vim.o.grepprg = 'rg --vimgrep --no-heading --smart-case'
vim.opt.grepformat:append({ '%f:%l:%c:%m' })

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
lvim.keys.insert_mode["<C-t>"] = "<cmd>ToggleTerm direction=float<CR>"
lvim.keys.normal_mode["<C-t>"] = "<cmd>ToggleTerm direction=float<CR>"
lvim.keys.term_mode["<C-t>"] = "<C-\\><C-n><C-w>l"
lvim.keys.normal_mode["tt"] = "<cmd>1ToggleTerm direction=float<CR>"
lvim.keys.term_mode["tt"] = "<C-\\><C-n><C-w>k"
lvim.keys.term_mode["<C-n>"] = "<C-\\><C-n>"
lvim.keys.normal_mode["gt"] = "<cmd>2ToggleTerm direction=horizontal size=10<CR>"

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
lvim.builtin.which_key.mappings["b"].F = {
  "<cmd>tabe %<cr>", "Open this buffer in new tab"
}
lvim.builtin.which_key.mappings["b"]["<tab>"] = {
  "<cmd>b#<cr>", "Switch to most recent buffer"
}
lvim.builtin.which_key.mappings["b"]["v"] = {
  "<cmd>vsplit<cr>", "Vertical split"
}
lvim.builtin.which_key.mappings["b"]["-"] = {
  "<cmd>split<cr>", "Horizontal split"
}
lvim.builtin.which_key.mappings["B"] = {
  name = "+Bookmark",
  a = { "<cmd>BookmarkAnnotate<cr>", "Add/edit/remove annotation bookmark" },
  t = { "<cmd>BookmarkToggle<cr>", "Toggle bookmark at current line" },
  l = { "<cmd>BookmarkShowAll<cr>", "List all bookmarks in quickfix" },
  j = { "<cmd>BookmarkNext", "Jump to next bookmark" },
  k = { "<cmd>BookmarkPrev", "Jump to previous bookmark" },
  J = { "<cmd>BookmarkMoveDown", "Bookmark move down" },
  K = { "<cmd>BookmarkMoveUp", "Bookmark move up" },
  M = { "<cmd>BookmarkMoveToLine", "Move bookmark to line" }
}
lvim.builtin.which_key.mappings["D"] = {
  name = "+Diagnostics",
  c = { "<cmd>TroubleToggle document_diagnostics<cr>", "Toggle diagnostics window of current buffer" },
  l = { "<cmd>lua require('lsp_lines').toggle()<cr>", "Toggle diagnostics in virtual lines" },
  s = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Show diagnostics for current line" },
}

local last_pattern = ''
local last_include_dir = 'src'
local last_glob = '*'
local find_text_occurrence = function (pattern)
  vim.ui.input(
    { prompt = 'Search Pattern?', default = pattern or last_pattern },
    function (pattern)
      if pattern == nil or pattern == '' then
        return
      end
      vim.ui.input(
        { prompt = 'Where to Find?', default = last_include_dir },
        function (includes)
          if includes == nil then
            return
          end
          vim.ui.input(
            { prompt = 'File glob pattern?', default = last_glob},
            function (glob)
              last_pattern = pattern
              last_include_dir = includes
              last_glob = glob
              local search_cmd = 'silent! lgrep! ' .. pattern .. ' ' .. includes
              if glob ~= nil then
                search_cmd = search_cmd .. ' -g' .. glob
              end
              local result = vim.api.nvim_command_output(search_cmd)
              local did_found = result.match(result, 'Error') == nil
              if did_found then
                vim.cmd('Trouble loclist')
              else
                vim.notify('No result found')
              end
            end
          )
        end
      )
    end)
end

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
  r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
  s = { "<cmd>Telescope treesitter<cr>", "Treesitter symbols" },
  t = {
    find_text_occurrence,
    "Text occurrence",
  },
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
lvim.builtin.which_key.mappings.g["O"] = {
  name = "+Others",
  u = {
    function ()
      local Terminal = require('toggleterm.terminal').Terminal
      local gituiTerm = Terminal:new({
        cmd = "gitui",
        direction = "float",
        hidden = true,
        float_opts = {
          border = "none",
          width = 100000,
          height = 100000,
        },
      })
      gituiTerm:toggle()
    end,
    "gitui"
  }
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
  h = {
    function ()
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
    end,
    "Toggle htop"
  }
}
lvim.builtin.which_key.mappings["r"] = {
  name = "+Run",
  n = {
    -- TODO: refactor these keymappings
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
      elseif extension == 'sh' then
        command = "bash" .. path
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
lvim.builtin.which_key.mappings["W"] = {
  name = "+Window",
  c = { "<c-w>c", "Close current window" }
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
      local endno = vim.fn.line("'>")
      local path = vim.api.nvim_buf_get_name(0)
      local cwd = vim.fn.getcwd() .. '/'
      local filename = string.sub(path, string.len(cwd) + 1)
      local branch = vim.fn.system('cd ' .. cwd .. ' && git branch --show-current 2> /dev/null | tr -d "\n"')
      if branch ~= '' then
        filename = filename .. ' on  ' .. branch
      end
      local extension = vim.fn.expand('%:e')
      vim.ui.input(
        {
          prompt = string.format('Lines to highlight (capturing lines %d - %d): (example:1;3-4)', startno, endno),
          default = ''
        },
        function (range)
          local addBaseToNumbers = function(str, base)
            return str:gsub("(%d+)", function(match)
              return tostring(tonumber(match) + base)
            end)
          end
          range = addBaseToNumbers(range, -startno + 1)
          if extension == 'mpx' then
            vim.ui.select({ 'vue', 'ts', 'stylus' }, {
              prompt = 'select a language highlight'
            },
              function (item)
                if item then
                  extension = item
                else
                  extension = 'vue'
                end
                local cmd = 'silicon --from-clipboard --to-clipboard -l ' .. extension .. ' --line-offset ' .. startno .. ' --window-title="' .. filename .. '"'
                if (range ~= '' and range ~= nil) then
                  cmd = cmd .. ' --highlight-lines ' .. '"' .. range .. '"'
                end
                os.execute(cmd)
                local msg = string.format('Capture saved to the clipboard with title:\n"%s"', filename)
                vim.notify(msg, vim.log.levels.INFO, {
                  title = 'Silicon'
                })
              end
            )
          else
            local cmd = 'silicon --from-clipboard --to-clipboard -l ' .. extension .. ' --line-offset ' .. startno .. ' --window-title="' .. filename .. '"'
            if (range ~= '' and range ~= nil) then
              cmd = cmd .. ' --highlight-lines ' .. '"' .. range .. '"'
            end
            os.execute(cmd)
            local msg = string.format('Capture saved to the clipboard with title:\n"%s"', filename)
            vim.notify(msg, vim.log.levels.INFO, {
              title = 'Silicon'
            })
          end
        end
      )
    end)
  end, "Silicon Snapshot"
}

lvim.builtin.which_key.vmappings["f"] = {
  function ()
    vim.api.nvim_feedkeys('"vy', 'n', false)
    vim.schedule(function ()
      local text = vim.fn.getreg('v')
      find_text_occurrence(text)
    end)
  end,
  "Search for selected text"
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
lvim.builtin.telescope.pickers.live_grep.layout_config = {
  width = 0.8,
  height = 0.5,
}

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
    wxs = 'javascript',
    axml = 'html',
    acss = 'css'
  }
})

require('ts_context_commentstring').setup({
  languages = {
    typescript = { __default = '// %s', __multiline = '/* %s */' },
    mpx = {
      __default = '// %s',
      template_element = '<!-- %s -->'
    }
  },
})

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.mpx = {
  install_info = {
    url = "~/tree-sitter-mpx",
    files = { "src/parser.c", "src/scanner.cc" },
  },
  filetype = "mpx", -- if filetype does not match the parser name
}

vim.treesitter.language.register('mpx', 'mpx')
-- vim.treesitter.language.register('vue', 'mpx')
vim.treesitter.language.register('javascript', 'wxs')
vim.treesitter.language.register('html', 'axml')
vim.treesitter.language.register('css', 'acss')

-- require('vim.treesitter.query').set('mpx', 'injections', '(attribute_value) @javascript')

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
  on_init = function(client, initialization_result)
    if client.server_capabilities then
      client.server_capabilities.semanticTokensProvider = false  -- turn off semantic tokens for lsp highlighting
    end
  end,
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
  -- reload('user.extra-plugins.treesj'),
  {
    "Wansmer/treesj",
    dependencies = { 'nvim-treesitter' },
    config = function()
      local lang_utils = require('treesj.langs.utils')
      local html = require('treesj.langs.html')
      require("treesj").setup({
        -- Use default keymaps
        -- (<space>m - toggle, <space>j - join, <space>s - split)
        use_default_keymaps = false,
        -- Node with syntax error will not be formatted
        check_syntax_error = true,
        -- If line after join will be longer than max value,
        -- node will not be formatted
        max_join_length = 300,
        -- hold|start|end:
        -- hold - cursor follows the node/place on which it was called
        -- start - cursor jumps to the first symbol of the node being formatted
        -- end - cursor jumps to the last symbol of the node being formatted
        cursor_behavior = 'hold',
        -- Notify about possible problems or not
        notify = true,
        langs = {
          mpx = lang_utils.merge_preset(html, {
            element = {
              join = {
                recursive = false,
              },
            },
          })
        },
      })
    end,
  },

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
        signs = false,
        underline = true,
        virtual_text = false,
        virtual_lines = true,
        update_in_insert = false,
        float = {
          border = 'rounded',
          focusable = true
        }
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
    "grapp-dev/nui-components.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim"
    }
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
  },
  {
    'APZelos/blamer.nvim',
    config = function ()
      vim.g.blamer_enabled = true
      vim.g.blamer_delay = 500
      vim.g.blamer_show_in_visual_mode = 0
      vim.g.blamer_show_in_insert_mode = 0
      vim.g.blamer_prefix = ' -> '
      -- vim.g.blamer_template = '<committer>, <committer-time> • <summary>'
      vim.g.blamer_date_format = '%y/%m/%d - %H:%M'
      vim.g.blamer_relative_time = 1
    end
  },
  {
    'echasnovski/mini.align',
    version = '*',
    config = function ()
      require('mini.align').setup()
    end
  },
  -- WARN: nvim-scissors now requires neovim 0.10
  -- {
  --   'chrisgrieser/nvim-scissors',
  --   dependencies = "nvim-telescope/telescope.nvim", -- optional
  --   opts = {
  --     snippetDir = "~/.config/lvim/snippets",
  --   },
  --   config = function ()
  --     -- default settings
  --     require("scissors").setup {
  --       snippetDir = vim.fn.stdpath("config") .. "/snippets",
  --       editSnippetPopup = {
  --         height = 0.4, -- relative to the window, number between 0 and 1
  --         width = 0.6,
  --         border = "rounded",
  --         keymaps = {
  --           cancel = "q",
  --           saveChanges = "<CR>", -- alternatively, can also use `:w`
  --           goBackToSearch = "<BS>",
  --           deleteSnippet = "<C-BS>",
  --           duplicateSnippet = "<C-d>",
  --           openInFile = "<C-o>",
  --           insertNextToken = "<C-t>", -- insert & normal mode
  --           jumpBetweenBodyAndPrefix = "<Tab>", -- insert & normal mode
  --         },
  --       },
  --       telescope = {
  --         -- By default, the query only searches snippet prefixes. Set this to
  --         -- `true` to also search the body of the snippets.
  --         alsoSearchSnippetBody = false,
  --       },
  --       -- `none` writes as a minified json file using `vim.encode.json`.
  --       -- `yq`/`jq` ensure formatted & sorted json files, which is relevant when
  --       -- you version control your snippets.
  --       jsonFormatter = "none", -- "yq"|"jq"|"none"
  --     }
  --   end
  -- },
  reload('user.extra-plugins.diffview'),
  {
    'b0o/nvim-tree-preview.lua',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config = function ()
      local preview = require'nvim-tree-preview'

      -- Default config:
      preview.setup {
        -- Keymaps for the preview window (does not apply to the tree window).
        -- Keymaps can be a string (vimscript command), a function, or a table.
        --
        -- If a table, it must contain either an 'action' or 'open' key:
        --
        -- Actions:
        --   { action = 'close', unwatch? = false, focus_tree? = true }
        --   { action = 'toggle_focus' }
        --
        -- Open modes:
        --   { open = 'edit' }
        --   { open = 'tab' }
        --   { open = 'vertical' }
        --   { open = 'horizontal' }
        --
        -- To disable a default keymap, set it to false.
        -- All keymaps are set in normal mode. Other modes are not currently supported.
        keymaps = {
          ['<Esc>'] = { action = 'close', unwatch = true },
          ['<Tab>'] = { action = 'toggle_focus' },
          ['<CR>'] = { open = 'edit' },
          ['<C-t>'] = { open = 'tab' },
          ['<C-v>'] = { open = 'vertical' },
          ['<C-x>'] = { open = 'horizontal' },
        },
        min_width = 10,
        min_height = 5,
        max_width = 85,
        max_height = 25,
        wrap = false, -- Whether to wrap lines in the preview window
        border = 'rounded', -- Border style for the preview window
      }
    end
  },
  {
    'yujinyuz/gitpad.nvim',
    config = function()
      require('gitpad').setup({
        title = 'Note', -- The title of the floating window
        border = 'rounded', -- The border style of the floating window. Possible values are `'single'`, `'double'`, `'shadow'`, `'rounded'`, and `''` (no border).
        style = '', -- The style of the floating window. Possible values are `'minimal'` (no line numbers, statusline, or sign column. See :help nvim_open_win() '), and `''` (default Neovim style).
        dir = vim.fn.stdpath('data') .. '/gitpad', -- The directory where the notes are stored. Possible value is a valid path ie '~/notes'
        default_text = '', -- Leave this nil if you want to use the default text
        on_attach = function(bufnr)
          -- You can also define a function to be called when the gitpad window is opened, by setting the `on_attach` option:
          -- This is just an example
          vim.api.nvim_buf_set_keymap(bufnr, 'n', 'q', '<Cmd>wq<CR>', { noremap = true, silent = true })
        end,
      })
    end,
    keys = {
      {
        '<leader>.p',
        function()
          require('gitpad').toggle_gitpad() -- or require('gitpad').toggle_gitpad({ title = 'Project notes' })
        end,
        desc = 'gitpad project',
      },
      {
        '<leader>.b',
        function()
          require('gitpad').toggle_gitpad_branch() -- or require('gitpad').toggle_gitpad_branch({ title = 'Branch notes' })
        end,
        desc = 'gitpad branch',
      },
      -- Daily notes
      {
        '<leader>.d',
        function()
          local date_filename = 'daily-' .. os.date('%Y-%m-%d.md')
          require('gitpad').toggle_gitpad({ filename = date_filename }) -- or require('gitpad').toggle_gitpad({ filename = date_filename, title = 'Daily notes' })
        end,
        desc = 'gitpad daily notes',
      },
      -- Per file notes
      {
        '<leader>.f',
        function()
          local filename = vim.fn.expand('%:p') -- or just use vim.fn.bufname()
          if filename == '' then
            vim.notify('empty bufname')
            return
          end
          filename = vim.fn.pathshorten(filename, 2) .. '.md'
          require('gitpad').toggle_gitpad({ filename = filename }) -- or require('gitpad').toggle_gitpad({ filename = filename, title = 'Current file notes' })
        end,
        desc = 'gitpad per file notes',
      },
    },
  },
  {
    "mistricky/codesnap.nvim",
    build = "make build_generator",
    keys = {
      { "<leader>Occ", "<Esc><cmd>CodeSnap<cr>", mode = "x", desc = "Take a snapshot of selected code and save to clipboard" },
      { "<leader>Ocs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Take a snapshot of selected code and save to desktop" },
      { "<leader>Ochc", "<cmd>CodeSnapHighlight<cr>", mode = "x", desc = "Take a snapshot of selected code and save to clipboard" },
      { "<leader>Ochs", "<cmd>CodeSnapSaveHighlight<cr>", mode = "x", desc = "Take a snapshot of selected code and save to desktop" },
      { "<leader>Ocs", "<cmd>CodeSnapASCII<cr>", mode = "x", desc = "Take a ascii snapshot of selected code and save to clipboard" },
    },
    opts = {
      save_path = "~/Desktop",
      mac_window_bar = true,
      title = "CodeSnap.nvim",
      code_font_family = "CaskaydiaCove Nerd Font",
      watermark_font_family = "Pacifico",
      watermark = "",
      bg_theme = "default",
      breadcrumbs_separator = "/",
      has_breadcrumbs = true,
      has_line_number = true,
      show_workspace = true,
      min_width = 0,
      bg_x_padding = 0,
      bg_y_padding = 0,
    },
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    commit = "55e13ca",
    -- config = function ()
    --   -- config for this plugin is attached to lvim.builtin.treesitter.textobjects (see below)
    -- end
  },
  {
    'aliqyan-21/wit.nvim',
    config = function()
      require('wit').setup({
        search_engine = 'google' -- your preferred search engine name from the list
        -- search_engine = "https://any_other_search_engine.com/search?q=" -- for any other search engine not in list you can define it's url directly

        -- for example:
        -- search_engine = "https://you.com/search?q=" -- defining the search url of you.com as it is not in the list
      })
    end
  }
}

lvim.builtin.which_key.setup = {
  plugins = {
    marks = true,     -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = { -- adds help for operators like d, y, ...
      operators = {
        v = false,
        d = false,
      },
      motions = false,      -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = false,      -- default bindings on <c-w>
      nav = true,           -- misc bindings to work with windows
      z = true,             -- bindings for folds, spelling and others prefixed with z
      g = true,             -- bindings for prefixed with g
    },
  },
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true,         -- show help message on the command line when the popup is visible
}

local ts = lvim.builtin.treesitter
ts.textobjects = {
  select = {
    enable = true,

    -- Automatically jump forward to textobj, similar to targets.vim
    lookahead = true,

    keymaps = {
      -- You can use the capture groups defined in textobjects.scm
      ['af'] = '@function.outer',
      ['if'] = '@function.inner',
      -- [''] = '@function'
      -- You can optionally set descriptions to the mappings (used in the desc parameter of
      -- nvim_buf_set_keymap) which plugins like which-key display
      -- ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
      -- You can also use captures from other query groups like `locals.scm`
      -- ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
    },
    -- You can choose the select mode (default is charwise 'v')
    --
    -- Can also be a function which gets passed a table with the keys
    -- * query_string: eg '@function.inner'
    -- * method: eg 'v' or 'o'
    -- and should return the mode ('v', 'V', or '<c-v>') or a table
    -- mapping query_strings to modes.
    selection_modes = {
      ['@parameter.outer'] = 'v', -- charwise
      ['@function.outer'] = 'V', -- linewise
      ['@class.outer'] = '<c-v>', -- blockwise
    },
-- If you set this to `true` (default is `false`) then any textobject is
    -- extended to include preceding or succeeding whitespace. Succeeding
    -- whitespace has priority in order to act similarly to eg the built-in
    -- `ap`.
    --
    -- Can also be a function which gets passed a table with the keys
    -- * query_string: eg '@function.inner'
    -- * selection_mode: eg 'v'
    -- and should return true or false
    include_surrounding_whitespace = true,
  },
  swap = {
    enable = true,
    swap_next = {
      ["<leader>lAl"] = "@parameter.inner",
    },
    swap_previous = {
      ["<leader>lAh"] = "@parameter.inner",
    },
  },
}

lvim.builtin.nvimtree.setup.on_attach = function(bufnr)
  local preview = require'nvim-tree-preview'
  local api = require "nvim-tree.api"
  api.config.mappings.default_on_attach(bufnr)

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  local nvimtree_keymaps = {
    ["P"] = { preview.watch, opts 'Preview (Watch)' },
    ["<Esc>"] = { preview.unwatch, opts 'Close Preview/Unwatch' },
    ["<Tab>"] = { preview.node_under_cursor, opts 'Preview' },
    ["l"] = { api.node.open.edit, opts "Open" },
    ["o"] = { api.node.open.edit, opts "Open" },
    ["<CR>"] = { api.node.open.edit, opts "Open" },
    ["v"] = { api.node.open.vertical, opts "Open: Vertical Split" },
    ["h"] = { api.node.navigate.parent_close, opts "Close Directory" },
    ["C"] = { api.tree.change_root_to_node, opts "CD" },
  }
  require('lvim.keymappings').load_mode('n', nvimtree_keymaps)

  -- vim.keymap.set('n', 'P', preview.watch, opts('Preview (Watch)'))
-- vim.keymap.set('n', '<Esc>', preview.unwatch, opts('Close Preview/Unwatch'))

  -- -- Option A: Simple tab behavior: Always preview
  -- vim.keymap.set('n', '<Tab>', preview.node_under_cursor, opts('Preview'))

  -- Option B: Smart tab behavior: Only preview files, expand/collapse directories.
  -- vim.keymap.set('n', '<Tab>', function()
  --   local ok, node = pcall(api.tree.get_node_under_cursor)
  --   if ok and node then
  --     if node.type == 'directory' then
  --       api.node.open.edit()
  --     else
  --       preview.node(node, { toggle_focus = true })
--     end
--   end
  -- end, opts 'Preview')
end

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

-- local showBlameVirtualText = function()
--   local ft = vim.fn.expand('%:h:t') -- get the current file extension
--   local api = vim.api
--   if ft == '' then -- if we are in a scratch buffer or unknown filetype
--     return
--   end
--   if ft == 'bin' then -- if we are in nvim's terminal window
--     return
--   end
--   api.nvim_buf_clear_namespace(0, 2, 0, -1) -- clear out virtual text from namespace 2 (the namespace we will set later)
--   local currFile = vim.fn.expand('%')
--   local line = api.nvim_win_get_cursor(0)
--   local blame = vim.fn.system(string.format('git blame -c -L %d,%d %s', line[1], line[1], currFile))
--   local hash = vim.split(blame, '%s')[1]
--   local cmd = string.format("git show %s ", hash).."--format='%an | %ar | %s'"
--   local text
--   if hash == '00000000' then
--     text = 'Not Committed Yet'
--   else
--     text = vim.fn.system(cmd)
--     text = vim.split(text, '\n')[1]
--     if text:find("fatal") then -- if the call to git show fails
--       text = 'Not Committed Yet'
--     end
--   end
--   text = '    ' .. text
--   api.nvim_buf_set_virtual_text(0, 2, line[1] - 1, {{ text,'GitLens' }}, {}) -- set virtual text for namespace 2 with the content from git and assign it to the higlight group 'GitLens'
-- end

-- local clearBlameVirtualText = function ()
--   vim.api.nvim_buf_clear_namespace(0, 2, 0, -1)
-- end

-- local gitlens_aug_id = vim.api.nvim_create_augroup('GitLens', { clear = true })
-- vim.api.nvim_set_hl(0, 'GitLens', { fg = '#575F86', bg = '#2A2E40' })

-- vim.api.nvim_create_autocmd('CursorHold', {
--   pattern = '*',
--   callback = showBlameVirtualText,
--   group = gitlens_aug_id
-- })
-- vim.api.nvim_create_autocmd('CursorMoved', {
--   pattern = '*',
--   callback = clearBlameVirtualText,
--   group = gitlens_aug_id
-- })
-- vim.api.nvim_create_autocmd('CursorMovedI', {
--   pattern = '*',
--   callback = clearBlameVirtualText,
--   group = gitlens_aug_id
-- })

-- -- Debugging
-- -- =============================
if lvim.builtin.dap.active then
  reload('user.dap-config').config()
end
