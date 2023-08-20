-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/lorentz/.cache/lvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/lorentz/.cache/lvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/lorentz/.cache/lvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/lorentz/.cache/lvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/lorentz/.cache/lvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22lvim.core.comment\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/opt/Comment.nvim",
    url = "git@github.com:numToStr/Comment.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\nÒ\3\0\0\v\0\23\00166\0\0\0'\2\1\0B\0\2\0024\1\0\0006\2\2\0009\2\3\0029\2\4\0029\2\5\0029\2\6\2\15\0\2\0X\3\fÄ\21\2\1\0\22\2\0\0029\3\a\0006\5\b\0B\5\1\2'\6\t\0'\a\n\0'\b\v\0'\t\f\0'\n\r\0B\3\a\2<\3\2\0019\2\a\0006\4\14\0B\4\1\2'\5\15\0B\2\3\0029\3\16\0\18\5\2\0B\3\2\2\15\0\3\0X\4\3Ä\21\3\1\0\22\3\0\3<\2\3\0016\3\0\0'\5\17\0B\3\2\0029\3\18\3B\3\1\0016\3\0\0'\5\19\0B\3\2\0029\3\18\0035\5\20\0=\1\21\5B\3\2\0016\3\0\0'\5\22\0B\3\2\0029\3\18\3B\3\1\1K\0\1\0\"luasnip.loaders.from_snipmate\npaths\1\0\0 luasnip.loaders.from_vscode\14lazy_load\29luasnip.loaders.from_lua\17is_directory\rsnippets\19get_config_dir\22friendly-snippets\nstart\vpacker\tpack\tsite\20get_runtime_dir\15join_paths\22friendly_snippets\fsources\fluasnip\fbuiltin\tlvim\15lvim.utils\frequire\2\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/LuaSnip",
    url = "git@github.com:L3MON4D3/LuaSnip"
  },
  ["NeoComposer.nvim"] = {
    config = { "\27LJ\2\nÉ\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\fkeymaps\1\0\a\15stop_macro\acq\22toggle_macro_menu\n<c-q>\15yank_macro\ayq\15cycle_prev\n<c-p>\15play_macro\6Q\15cycle_next\n<c-n>\18toggle_record\6q\1\0\4\14status_bg\f#16161e\16delay_timer\b150\vnotify\2\15preview_fg\f#ff9e64\nsetup\16NeoComposer\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/NeoComposer.nvim",
    url = "git@github.com:ecthelionvi/NeoComposer.nvim"
  },
  ["aerial.nvim"] = {
    config = { "\27LJ\2\n+\0\1\4\1\1\0\5-\1\0\0009\1\0\1\18\3\0\0B\1\2\1K\0\1\0\0¿\18tree_open_all\v\0\1\1\0\0\0\1K\0\1\0\v\0\2\2\0\0\0\1L\0\2\0£\16\1\0\6\0(\00006\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\0035\4\a\0005\5\6\0=\5\b\0044\5\0\0=\5\t\4=\4\n\0034\4\0\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0034\4\0\0=\4\16\0035\4\17\0004\5\0\0=\5\18\4=\4\19\0033\4\20\0=\4\21\0033\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0005\5\27\0=\5\28\0043\5\29\0=\5\30\4=\4\31\0035\4 \0=\4!\0035\4\"\0=\4#\0035\4$\0=\4%\0035\4&\0=\4'\3B\1\2\0012\0\0ÄK\0\1\0\bman\1\0\1\17update_delay\3¨\2\rmarkdown\1\0\1\17update_delay\3¨\2\15treesitter\1\0\1\17update_delay\3¨\2\blsp\1\0\3\31diagnostics_trigger_update\2\23update_when_errors\2\17update_delay\3¨\2\nfloat\roverride\0\15min_height\1\3\0\0\3\b\4ö≥ÊÃ\tô≥Ê˝\3\1\0\3\15max_height\4Õô≥Ê\fÃô≥ˇ\3\rrelative\vcursor\vborder\frounded\vguides\1\0\4\rmid_item\15‚îú‚îÄ‚ñ∏ \15nested_top\t‚îÇ \15whitespace\a  \14last_item\15‚ï∞‚îÄ‚ñ∏ \21on_first_symbols\0\14on_attach\0\vignore\14filetypes\1\0\3\rwintypes\fspecial\rbuftypes\fspecial\21unlisted_buffers\1\nicons\16filter_kind\1\v\0\0\nClass\16Constructor\tEnum\rFunction\14Interface\vModule\vMethod\vStruct\nArray\vObject\fkeymaps\1\0 \azR\26actions.tree_open_all\6h\23actions.tree_close\6?\22actions.show_help\6}\17actions.next\azC!actions.tree_close_recursive\6p\19actions.scroll\azr%actions.tree_increase_fold_level\6O\"actions.tree_toggle_recursive\azo\22actions.tree_open\azm%actions.tree_decrease_fold_level\azM\27actions.tree_close_all\18<2-LeftMouse>\17actions.jump\6H!actions.tree_close_recursive\6q\18actions.close\6{\17actions.prev\azA\"actions.tree_toggle_recursive\azO actions.tree_open_recursive\azX\28actions.tree_sync_folds\a]]\20actions.next_up\azc\23actions.tree_close\6o\24actions.tree_toggle\n<C-v>\24actions.jump_vsplit\a[[\20actions.prev_up\6L actions.tree_open_recursive\aza\24actions.tree_toggle\azx\28actions.tree_sync_folds\ag?\22actions.show_help\t<CR>\17actions.jump\n<C-j>\28actions.down_and_scroll\n<C-s>\23actions.jump_split\n<C-k>\26actions.up_and_scroll\6l\22actions.tree_open\27close_automatic_events\vlayout\rwin_opts\14max_width\1\0\4\22preserve_equality\1\14placement\vwindow\22default_direction\17prefer_right\14min_width\3\n\1\3\0\0\3(\4ö≥ÊÃ\tô≥¶˛\3\rbackends\1\0\17\17manage_folds\2\19highlight_mode\16split_width\22disable_max_lines\3êN\14lazy_load\2\18post_jump_cmd\15normal! zz\16attach_mode\vwindow\14nerd_font\tauto\22highlight_closest\2\23highlight_on_hover\1\20close_on_select\1\18update_events\28TextChanged,InsertLeave\23link_tree_to_folds\2\23link_folds_to_tree\2\16show_guides\2\21disable_max_size\3Äâz\19open_automatic\1\22highlight_on_jump\3¨\2\1\5\0\0\15treesitter\blsp\rmarkdown\bman\nsetup\vaerial\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/aerial.nvim",
    url = "git@github.com:stevearc/aerial.nvim"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20lvim.core.alpha\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/alpha-nvim",
    url = "git@github.com:goolord/alpha-nvim"
  },
  ["better-escape.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/opt/better-escape.vim",
    url = "git@github.com:jdhao/better-escape.vim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\nB\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\25lvim.core.bufferline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/opt/bufferline.nvim",
    url = "git@github.com:akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/cmp-buffer",
    url = "git@github.com:hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "git@github.com:hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/cmp-path",
    url = "git@github.com:hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/cmp_luasnip",
    url = "git@github.com:saadparwaiz1/cmp_luasnip"
  },
  ["codewindow.nvim"] = {
    config = { "\27LJ\2\nq\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0019\1\4\0B\1\1\1K\0\1\0\27apply_default_keybinds\1\0\1\21width_multiplier\3\2\nsetup\15codewindow\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/codewindow.nvim",
    url = "git@github.com:gorbit99/codewindow.nvim"
  },
  ["dressing.nvim"] = {
    config = { "\27LJ\2\n\v\0\1\1\0\0\0\1L\0\2\0\v\0\1\1\0\0\0\1L\0\2\0Ø\t\1\0\6\0001\0?6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\19\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0034\4\0\0=\4\b\0035\4\t\0=\4\n\0035\4\f\0005\5\v\0=\5\r\0045\5\14\0=\5\15\4=\4\16\0033\4\17\0=\4\18\3=\3\20\0025\3\21\0005\4\22\0=\4\23\0035\4\25\0005\5\24\0=\5\26\4=\4\27\0035\4\29\0005\5\28\0=\5\30\4=\4\31\0035\4 \0005\5!\0=\5\"\0045\5#\0=\5\b\0045\5$\0=\5\n\4=\4%\0035\4&\0004\5\0\0=\5\b\0045\5'\0=\5\n\0045\5(\0=\5\5\0045\5)\0=\5\a\0045\5*\0=\5+\0045\5,\0=\5\16\0043\5-\0=\5\18\4=\4.\0034\4\0\0=\4/\3=\0030\2B\0\2\1K\0\1\0\vselect\25format_item_override\fbuiltin\0\1\0\3\n<Esc>\nClose\n<C-c>\nClose\t<CR>\fConfirm\15min_height\1\3\0\0\3\n\4ö≥ÊÃ\tô≥¶˛\3\1\3\0\0\3(\4ö≥ÊÃ\tô≥¶˛\3\1\3\0\0\3å\1\4ö≥ÊÃ\tô≥¶ˇ\3\1\0\1\rwinblend\3\n\1\0\4\15max_height\4Õô≥Ê\fÃô≥ˇ\3\rrelative\veditor\vanchor\aNW\vborder\frounded\bnui\1\0\1\rwinblend\3\n\1\0\2\rswapfile\1\rfiletype\19DressingSelect\vborder\1\0\1\nstyle\frounded\1\0\6\15max_height\3(\rrelative\veditor\rposition\b50%\15min_height\3\n\14max_width\3P\14min_width\3(\ffzf_lua\fwinopts\1\0\0\1\0\2\vheight\4ö≥ÊÃ\tô≥Ê˛\3\nwidth\4\0ÄÄÄˇ\3\bfzf\vwindow\1\0\0\1\0\2\vheight\4ö≥ÊÃ\tô≥Ê˛\3\nwidth\4\0ÄÄÄˇ\3\fbackend\1\6\0\0\14telescope\ffzf_lua\bfzf\fbuiltin\bnui\1\0\2\fenabled\2\16trim_prompt\2\ninput\1\0\0\roverride\0\rmappings\6i\1\0\4\t<Up>\16HistoryPrev\n<C-c>\nClose\v<Down>\16HistoryNext\t<CR>\fConfirm\6n\1\0\0\1\0\2\n<Esc>\nClose\t<CR>\fConfirm\16win_options\1\0\2\rwinblend\3\n\twrap\1\16buf_options\14min_width\1\3\0\0\3\20\4ö≥ÊÃ\tô≥¶˛\3\14max_width\1\3\0\0\3å\1\4Õô≥Ê\fÃô≥ˇ\3\1\0\t\20start_in_insert\2\17prompt_align\tleft\19default_prompt\vInput:\fenabled\2\17prefer_width\3(\16insert_only\2\rrelative\vcursor\vanchor\aSW\vborder\frounded\nsetup\rdressing\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/dressing.nvim",
    url = "git@github.com:stevearc/dressing.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/friendly-snippets",
    url = "git@github.com:rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23lvim.core.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/opt/gitsigns.nvim",
    url = "git@github.com:lewis6991/gitsigns.nvim"
  },
  harpoon = {
    config = { "\27LJ\2\nµ\2\0\0\5\0\n\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\0016\0\0\0'\2\b\0B\0\2\0029\0\t\0'\2\1\0B\0\2\1K\0\1\0\19load_extension\14telescope\20global_settings\1\0\0\23excluded_filetypes\1\2\0\0\fharpoon\1\0\b\19save_on_toggle\1\19tabline_suffix\b   \27tmux_autoclose_windows\1\21enter_on_sendcmd\1\19save_on_change\2\19tabline_prefix\b   \ftabline\1\16mark_branch\1\nsetup\fharpoon\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/harpoon",
    url = "git@github.com:ThePrimeagen/harpoon"
  },
  ["hi-my-words.nvim"] = {
    config = { "\27LJ\2\n˚\a\0\0\6\0\25\00016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\v\0005\4\4\0005\5\5\0>\5\2\4>\4\1\0035\4\6\0005\5\a\0>\5\2\4>\4\2\0035\4\b\0005\5\t\0>\5\2\4>\4\3\0035\4\n\0005\5\v\0>\5\2\4>\4\4\0035\4\f\0005\5\r\0>\5\2\4>\4\5\0035\4\14\0005\5\15\0>\5\2\4>\4\6\0035\4\16\0005\5\17\0>\5\2\4>\4\a\0035\4\18\0005\5\19\0>\5\2\4>\4\b\0035\4\20\0005\5\21\0>\5\2\4>\4\t\0035\4\22\0005\5\23\0>\5\2\4>\4\n\3=\3\24\2B\0\2\1K\0\1\0\fhl_grps\1\0\6\afg\f#990011\fctermbg\3\1\vitalic\2\abg\f#fcf6f5\tbold\2\fctermfg\3\15\1\2\0\0\18HiMyWordsHLG9\1\0\6\afg\f#408ec6\fctermbg\3\v\vitalic\2\abg\f#1e2761\tbold\2\fctermfg\3\0\1\2\0\0\18HiMyWordsHLG8\1\0\6\afg\f#2c5f2d\fctermbg\3\v\vitalic\2\abg\f#97bc62\tbold\2\fctermfg\3\0\1\2\0\0\18HiMyWordsHLG7\1\0\6\afg\f#2f3c7e\fctermbg\3\v\vitalic\2\abg\f#fbeaeb\tbold\2\fctermfg\3\0\1\2\0\0\18HiMyWordsHLG6\1\0\6\afg\f#fcf6f5\fctermbg\3\1\vitalic\2\abg\f#990011\tbold\2\fctermfg\3\15\1\2\0\0\18HiMyWordsHLG5\1\0\6\afg\f#ffffff\fctermbg\3\1\vitalic\2\abg\f#8aaae5\tbold\2\fctermfg\3\15\1\2\0\0\18HiMyWordsHLG4\1\0\6\afg\f#e2d1f9\fctermbg\3\v\vitalic\2\abg\f#317773\tbold\2\fctermfg\3\0\1\2\0\0\18HiMyWordsHLG3\1\0\6\afg\f#ccf381\fctermbg\3\v\vitalic\2\abg\f#4831d4\tbold\2\fctermfg\3\0\1\2\0\0\18HiMyWordsHLG2\1\0\6\afg\f#101820\fctermbg\3\v\vitalic\2\abg\f#fee715\tbold\2\fctermfg\3\0\1\2\0\0\18HiMyWordsHLG1\1\0\6\afg\f#eea47f\fctermbg\3\21\vitalic\2\abg\f#00539c\tbold\2\fctermfg\3Ç\1\1\2\0\0\18HiMyWordsHLG0\1\0\1\vsilent\1\nsetup\16hi-my-words\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/hi-my-words.nvim",
    url = "git@github.com:dvoytik/hi-my-words.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\26lvim.core.indentlines\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/indent-blankline.nvim",
    url = "git@github.com:lukas-reineke/indent-blankline.nvim"
  },
  ["lir.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18lvim.core.lir\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/lir.nvim",
    url = "git@github.com:christianchiarulli/lir.nvim"
  },
  ["lsp_lines.nvim"] = {
    config = { "\27LJ\2\nr\0\0\3\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0005\2\6\0B\0\2\1K\0\1\0\1\0\1\17virtual_text\1\vconfig\15diagnostic\bvim\nsetup\14lsp_lines\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22lvim.core.lualine\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/lualine.nvim",
    url = "git@github.com:nvim-lualine/lualine.nvim"
  },
  ["lunar.nvim"] = {
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/lunar.nvim",
    url = "git@github.com:lunarvim/lunar.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "git@github.com:williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20lvim.core.mason\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/mason.nvim",
    url = "git@github.com:williamboman/mason.nvim"
  },
  ["mini.animate"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/opt/mini.animate",
    url = "git@github.com:echasnovski/mini.animate"
  },
  ["neoai.nvim"] = {
    config = { "\27LJ\2\n\v\0\1\1\0\0\0\1L\0\2\0´\1\0\1\5\0\3\0\6'\1\0\0'\2\1\0'\3\2\0\18\4\0\0&\1\4\1L\1\2\0(to in our upcoming conversations:\n\n:messages. Here is the code/text that I want to refer 6Hey, I'd like to provide some context for future Ê\4\1\0\a\0\24\0 6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0024\3\3\0005\4\6\0>\4\1\3=\3\a\0025\3\t\0003\4\b\0=\4\n\0036\4\0\0'\6\v\0B\4\2\0029\4\f\4=\4\r\3=\3\14\0025\3\15\0=\3\16\0025\3\18\0003\4\17\0=\4\19\3=\3\20\0025\3\21\0=\3\22\0024\3\0\0=\3\23\2B\0\2\1K\0\1\0\14shortcuts\rmappings\1\0\2\16select_down\n<C-j>\14select_up\n<C-k>\fprompts\19context_prompt\1\0\0\0\vinject\1\0\1\17cutoff_width\3K\20register_output\6c\26extract_code_snippets\16neoai.utils\6g\1\0\0\0\vmodels\1\0\2\nmodel\18gpt-3.5-turbo\tname\vopenai\aui\1\0\4\21open_api_key_env\19OPENAI_API_KEY\19openai_api_key8sk-Rk3Ft0Vwqd3mVBDeEufoT3BlbkFJIKiW0SG2lUjfBGOyBphj\28use_api_key_from_config\2\14proxy_url\19localhost:7890\1\0\5\nwidth\3(\22output_popup_text\nNeoAI\vsubmit\f<Enter>\24output_popup_height\3P\21input_popup_text\vPrompt\nsetup\nneoai\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/neoai.nvim",
    url = "git@github.com:Bryley/neoai.nvim"
  },
  ["neodev.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/opt/neodev.nvim",
    url = "git@github.com:folke/neodev.nvim"
  },
  neogen = {
    config = { "\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\19snippet_engine\fluasnip\nsetup\vneogen\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/neogen",
    url = "git@github.com:danymat/neogen"
  },
  ["neovim-session-manager"] = {
    config = { "\27LJ\2\n≤\3\0\0\6\0\f\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0006\3\0\0'\5\4\0B\3\2\0029\3\5\0039\3\6\3=\3\a\0024\3\0\0=\3\b\0025\3\t\0=\3\n\0024\3\0\0=\3\v\2B\0\2\1K\0\1\0\29autosave_ignore_buftypes\30autosave_ignore_filetypes\1\2\0\0\14gitcommit\25autosave_ignore_dirs\18autoload_mode\rDisabled\17AutoloadMode\27session_manager.config\1\0\a\18path_replacer\a__\29autosave_only_in_session\1\19colon_replacer\a++\26autosave_last_session\1\31autosave_ignore_not_normal\2\20max_path_length\3P\17sessions_dir\"/Users/lorentz/.nvimsessions/\nsetup\20session_manager\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/neovim-session-manager",
    url = "git@github.com:Shatur/neovim-session-manager"
  },
  ["nlsp-settings.nvim"] = {
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/nlsp-settings.nvim",
    url = "git@github.com:tamago324/nlsp-settings.nvim"
  },
  ["noice.nvim"] = {
    config = { "\27LJ\2\n»\19\0\0\t\0h\0ñ\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\20\0005\3\3\0004\4\0\0=\4\4\0035\4\6\0005\5\5\0=\5\a\0045\5\b\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\0045\5\14\0=\5\15\0045\5\16\0=\5\17\0044\5\0\0=\5\18\4=\4\19\3=\3\a\0025\3\21\0=\3\22\0025\3\23\0004\4\0\0=\4\24\3=\3\25\0025\3\26\0005\4\27\0=\4\r\3=\3\28\0025\3(\0005\4\29\0005\5\30\0=\5\4\0045\5&\0004\6\6\0005\a\31\0>\a\1\0065\a \0>\a\2\0065\a!\0>\a\3\0065\a\"\0005\b#\0=\b$\a>\a\4\0065\a%\0>\a\5\6=\6'\5=\5\r\4=\4)\0035\4*\0005\5+\0=\5\4\0045\0052\0004\6\6\0005\a,\0>\a\1\0065\a-\0>\a\2\0065\a.\0>\a\3\0065\a/\0005\b0\0=\b$\a>\a\4\0065\a1\0>\a\5\6=\6'\5=\5\r\0045\0053\0=\0054\4=\0045\0035\0046\0005\0057\0=\5\4\0045\0058\0=\5\r\0045\0059\0=\0054\4=\4:\3=\3;\0025\3<\0=\3=\0025\3?\0005\4>\0=\4@\0035\4A\0=\4B\0035\4C\0004\5\0\0=\5\4\4=\4D\0035\4E\0005\5F\0=\5G\0044\5\0\0=\5\4\4=\4H\0035\4I\0004\5\0\0=\5\4\4=\4J\0035\4K\0005\5L\0005\6M\0=\6\19\0055\6N\0=\6O\5=\5\4\4=\4P\3=\3Q\0025\3Y\0005\4T\0006\5R\0009\5S\0059\5\17\5=\5U\0046\5\0\0'\aV\0B\5\2\0029\5W\5=\5X\4=\4D\0035\4Z\0=\4[\3=\3\\\0025\3]\0=\3^\0025\3_\0005\4`\0=\4a\3=\3b\0025\3c\0=\3d\0024\3\0\0=\3e\0024\3\0\0=\3f\0024\3\0\0=\3g\0024\3\0\0=\3\19\2B\0\2\1K\0\1\0\vstatus\vroutes\nviews\fpresets\1\0\5\26long_message_to_split\1\20command_palette\2\18bottom_search\1\19lsp_doc_border\2\15inc_rename\1\15smart_move\23excluded_filetypes\1\4\0\0\rcmp_menu\rcmp_docs\vnotify\1\0\1\fenabled\2\vhealth\1\0\1\fchecker\1\rmarkdown\15highlights\1\0\6\n|%S-|\20@text.reference\18^%s*(Return:)\16@text.title\n{%S-}\15@parameter\20^%s*(See also:)\16@text.title\22^%s*(Parameters:)\16@text.title\t@%S+\15@parameter\1\0\0\20%[.-%]%((%S-)%)\topen\15noice.util\f|(%S-)|\1\0\0\bcmd\bvim\blsp\18documentation\16win_options\1\0\2\18concealcursor\6n\17conceallevel\3\3\1\2\0\0\14{message}\1\0\3\freplace\2\vrender\nplain\tlang\rmarkdown\1\0\1\tview\nhover\fmessage\1\0\2\fenabled\2\tview\vnotify\14signature\14auto_open\1\0\4\rthrottle\0032\fluasnip\2\fenabled\2\ftrigger\2\1\0\1\fenabled\2\nhover\1\0\1\fenabled\1\roverride\1\0\0031vim.lsp.util.convert_input_to_markdown_lines\1 cmp.entry.get_documentation\1\"vim.lsp.util.stylize_markdown\1\rprogress\1\0\0\1\0\5\rthrottle\4´’™’\n™’ÇÇ\4\tview\tmini\vformat\17lsp_progress\16format_done\22lsp_progress_done\fenabled\2\vnotify\1\0\2\fenabled\2\tview\vnotify\rcommands\verrors\1\0\1\freverse\2\1\0\1\nerror\2\1\0\2\vformat\fdetails\nenter\2\1\0\1\tview\npopup\tlast\16filter_opts\1\0\1\ncount\3\1\1\0\0\1\0\2\tkind\fmessage\nevent\blsp\1\2\0\0\5\1\0\1\nevent\rmsg_show\1\0\1\fwarning\2\1\0\1\nerror\2\1\0\1\nevent\vnotify\1\0\2\vformat\fdetails\nenter\2\1\0\1\tview\npopup\fhistory\1\0\0\bany\1\0\0\1\0\2\tkind\fmessage\nevent\blsp\tkind\1\2\0\0\5\1\0\1\nevent\rmsg_show\1\0\1\fwarning\2\1\0\1\nerror\2\1\0\1\nevent\vnotify\1\0\2\vformat\fdetails\nenter\2\1\0\1\tview\nsplit\rredirect\1\0\1\nevent\rmsg_show\1\0\1\tview\npopup\14popupmenu\15kind_icons\1\0\2\fbackend\bnui\fenabled\2\rmessages\1\0\6\16view_search\16virtualtext\17view_history\rmessages\tview\vnotify\fenabled\1\14view_warn\vnotify\15view_error\vnotify\1\0\1\rthrottle\4´’™’\n™’ÇÇ\4\vformat\ninput\thelp\1\0\2\ticon\bÔüï\fpattern\20^:%s*he?l?p?%s+\blua\1\0\3\ticon\bÓò†\fpattern\16^:%s*lua%s+\tlang\blua\vfilter\1\0\3\ticon\6$\fpattern\v^:%s*!\tlang\tbash\14search_up\1\0\4\ticon\fÔÄÇ ÔÑÇ\fpattern\b^%?\tkind\vsearch\tlang\nregex\16search_down\1\0\4\ticon\fÔÄÇ ÔÑÉ\fpattern\a^/\tkind\vsearch\tlang\nregex\fcmdline\1\0\0\1\0\3\ticon\bÔÅî\fpattern\a^:\tlang\bvim\topts\1\0\2\fenabled\2\tview\18cmdline_popup\nsetup\nnoice\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/noice.nvim",
    url = "git@github.com:folke/noice.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/nui.nvim",
    url = "git@github.com:MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/null-ls.nvim",
    url = "git@github.com:jose-elias-alvarez/null-ls.nvim"
  },
  ["numb.nvim"] = {
    config = { "\27LJ\2\nX\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\20show_cursorline\2\17show_numbers\2\nsetup\tnumb\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/opt/numb.nvim",
    url = "git@github.com:nacro90/numb.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24lvim.core.autopairs\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/nvim-autopairs",
    url = "git@github.com:windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n`\0\0\3\0\6\0\v6\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\5Ä6\0\3\0'\2\4\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\nsetup\18lvim.core.cmp\frequire\bcmp\fbuiltin\tlvim\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/nvim-cmp",
    url = "git@github.com:hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18lvim.core.dap\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/nvim-dap",
    url = "git@github.com:mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rsetup_ui\18lvim.core.dap\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/nvim-dap-ui",
    url = "git@github.com:rcarriga/nvim-dap-ui"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/nvim-lspconfig",
    url = "git@github.com:neovim/nvim-lspconfig"
  },
  ["nvim-navic"] = {
    config = { "\27LJ\2\nC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\26lvim.core.breadcrumbs\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/nvim-navic",
    url = "git@github.com:SmiteshP/nvim-navic"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n\1\0\0\5\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\3B\1\2\0016\1\6\0=\0\1\1K\0\1\0\bvim\nicons\1\0\5\nERROR\bÔÅó\tWARN\bÔÅ™\nDEBUG\bÔÜà\tINFO\bÔÅö\nTRACE\b‚úé\1\0\b\ftimeout\3à'\bfps\3\30\vrender\fdefault\nlevel\3\2\rtop_down\2\18minimum_width\0032\vstages\nslide\22background_colour\vNormal\nsetup\vnotify\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/nvim-notify",
    url = "git@github.com:rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23lvim.core.nvimtree\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/nvim-tree.lua",
    url = "git@github.com:kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nB\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\25lvim.core.treesitter\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/nvim-treesitter",
    url = "git@github.com:nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "git@github.com:windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "git@github.com:JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-various-textobjs"] = {
    config = { "\27LJ\2\nî\1\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\20disabledKeymaps\1\0\3\22useDefaultKeymaps\2\19lookForwardBig\3\15\21lookForwardSmall\3\5\nsetup\21various-textobjs\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/nvim-various-textobjs",
    url = "git@github.com:chrisgrieser/nvim-various-textobjs"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/nvim-web-devicons",
    url = "git@github.com:kyazdani42/nvim-web-devicons"
  },
  ["overseer.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\roverseer\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/overseer.nvim",
    url = "git@github.com:stevearc/overseer.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/packer.nvim",
    url = "git@github.com:wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/plenary.nvim",
    url = "git@github.com:nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/popup.nvim",
    url = "git@github.com:nvim-lua/popup.nvim"
  },
  ["pretty-fold.nvim"] = {
    config = { "\27LJ\2\nB\0\0\4\0\6\0\a6\0\0\0009\0\1\0'\2\2\0006\3\3\0009\3\4\0039\3\5\3D\0\3\0\14foldlevel\6v\bvim\b‚Ä¢\brep\vstringB\0\0\4\0\6\0\a6\0\0\0009\0\1\0'\2\2\0006\3\3\0009\3\4\0039\3\5\3D\0\3\0\14foldlevel\6v\bvim\b‚Ä¢\brep\vstringÄ\6\1\0\b\0\"\00096\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\t\0005\4\5\0005\5\3\0003\6\4\0>\6\4\5=\5\6\0045\5\a\0=\5\b\4=\4\n\0034\4\0\0=\4\v\0035\4\f\0=\4\r\0034\4\4\0005\5\14\0>\5\1\0045\5\15\0>\5\2\0045\5\16\0>\5\3\4=\4\17\0035\4\18\0=\4\19\3B\1\2\0019\1\20\0'\3\21\0005\4\29\0004\5\b\0005\6\22\0>\6\1\0055\6\23\0>\6\2\0055\6\24\0>\6\3\0055\6\25\0>\6\4\0055\6\26\0>\6\5\0055\6\27\0>\6\6\0055\6\28\0>\6\a\5=\5\17\0045\5 \0005\6\30\0003\a\31\0>\a\4\6=\6\6\0055\6!\0=\6\b\5=\5\n\4B\1\3\1K\0\1\0\1\6\0\0\t‚î´ \27number_of_folded_lines\a: \15percentage\15 ‚î£‚îÅ‚îÅ\1\0\0\0\1\6\0\0\fcontent\v‚î£‚îÅ\6 \0\6 \1\0\0\1\3\0\0\a%[\6]\1\3\0\0\a%(\6)\1\3\0\0\6{\6}\1\3\0\0\18function%s*%(\bend\1\3\0\0\f^%s*for\bend\1\3\0\0\v^%s*if\bend\1\3\0\0\f^%s*do$\bend\blua\rft_setup\14ft_ignore\1\2\0\0\nneorg\21matchup_patterns\1\3\0\0\a%[\6]\1\3\0\0\a%(\6)\1\3\0\0\6{\6}\15stop_words\1\2\0\0\14@brief%s*\18comment_signs\rsections\1\0\5\14fill_char\b‚îÅ\21keep_indentation\2\26process_comment_signs\vspaces\24remove_fold_markers\2\22add_close_pattern\2\nright\1\6\0\0\t‚î´ \27number_of_folded_lines\a: \15percentage\15 ‚î£‚îÅ‚îÅ\tleft\1\0\0\0\1\6\0\0\fcontent\v‚î£‚îÅ\6 \0\6 \nsetup\16pretty-fold\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/pretty-fold.nvim",
    url = "git@github.com:anuvyklack/pretty-fold.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22lvim.core.project\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/project.nvim",
    url = "git@github.com:ahmedkhalf/project.nvim"
  },
  rnvimr = {
    after_files = { "/Users/lorentz/.local/share/lunarvim/site/pack/packer/opt/rnvimr/after/plugin/rnvimr.vim" },
    commands = { "RnvimrToggle" },
    config = { "\27LJ\2\nx\0\0\2\0\5\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0K\0\1\0\21rnvimr_bw_enable\23rnvimr_pick_enable\23rnvimr_draw_border\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/opt/rnvimr",
    url = "git@github.com:kevinhwang91/rnvimr"
  },
  ["rust-tools.nvim"] = {
    config = { "\27LJ\2\nÂ\b\0\0\b\0 \0.6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\24\0005\4\5\0006\5\0\0'\a\3\0B\5\2\0029\5\4\5=\5\6\0045\5\a\0=\5\b\0045\5\17\0004\6\t\0005\a\t\0>\a\1\0065\a\n\0>\a\2\0065\a\v\0>\a\3\0065\a\f\0>\a\4\0065\a\r\0>\a\5\0065\a\14\0>\a\6\0065\a\15\0>\a\a\0065\a\16\0>\a\b\6=\6\18\5=\5\19\0045\5\20\0005\6\21\0=\6\22\5=\5\23\4=\4\25\0035\4\26\0=\4\27\0035\4\29\0005\5\28\0=\5\30\4=\4\31\3B\1\2\1K\0\1\0\bdap\fadapter\1\0\0\1\0\3\fcommand\16lldb-vscode\ttype\15executable\tname\frt_lldb\vserver\1\0\1\15standalone\2\ntools\1\0\0\16crate_graph\30enabled_graphviz_backends\0017\0\0\bbmp\fcgimage\ncanon\bdot\agv\txdot\fxdot1.2\fxdot1.4\beps\bexr\bfig\agd\bgd2\bgif\bgtk\bico\tcmap\nismap\timap\ncmapx\fimap_np\rcmapx_np\bjpg\tjpeg\bjpe\bjp2\tjson\njson0\rdot_json\14xdot_json\bpdf\bpic\bpct\tpict\nplain\14plain-ext\bpng\bpov\aps\bps2\bpsd\bsgi\bsvg\tsvgz\btga\ttiff\btif\atk\bvml\tvmlz\twbmp\twebp\txlib\bx11\1\0\2\tfull\2\fbackend\bx11\18hover_actions\vborder\1\0\1\15auto_focus\1\1\3\0\0\b‚îÇ\16FloatBorder\1\3\0\0\b‚ï∞\16FloatBorder\1\3\0\0\b‚îÄ\16FloatBorder\1\3\0\0\b‚ïØ\16FloatBorder\1\3\0\0\b‚îÇ\16FloatBorder\1\3\0\0\b‚ïÆ\16FloatBorder\1\3\0\0\b‚îÄ\16FloatBorder\1\3\0\0\b‚ï≠\16FloatBorder\16inlay_hints\1\0\n\26max_len_align_padding\3\1\16right_align\1\27parameter_hints_prefix\b<- \tauto\2\23other_hints_prefix\b=> \24right_align_padding\3\a\14highlight\fComment\25show_parameter_hints\2\18max_len_align\1\22only_current_line\1\rexecutor\1\0\1%reload_workspace_from_cargo_toml\2\rtermopen\25rust-tools.executors\nsetup\15rust-tools\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/rust-tools.nvim",
    url = "git@github.com:simrat39/rust-tools.nvim"
  },
  ["schemastore.nvim"] = {
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/schemastore.nvim",
    url = "git@github.com:b0o/schemastore.nvim"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/sqlite.lua",
    url = "git@github.com:kkharji/sqlite.lua"
  },
  ["structlog.nvim"] = {
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/structlog.nvim",
    url = "git@github.com:Tastyep/structlog.nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/opt/symbols-outline.nvim",
    url = "git@github.com:simrat39/symbols-outline.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "git@github.com:nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-vim-bookmarks.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/opt/telescope-vim-bookmarks.nvim",
    url = "git@github.com:tom-anders/telescope-vim-bookmarks.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24lvim.core.telescope\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/telescope.nvim",
    url = "git@github.com:nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\nÑ\t\0\0\6\0001\00096\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\4\0005\5\5\0=\5\6\4=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0005\5\14\0=\5\6\4=\4\15\0035\4\16\0005\5\17\0=\5\6\4=\4\18\0035\4\19\0005\5\20\0=\5\6\4=\4\21\0035\4\22\0005\5\23\0=\5\6\4=\4\24\3=\3\25\0025\3\26\0=\3\27\0025\3\28\0004\4\0\0=\4\29\3=\3\30\0025\3 \0005\4\31\0=\4!\0035\4\"\0=\4#\0035\4$\0=\4%\0035\4&\0=\4'\0035\4(\0=\4)\0035\4*\0=\4+\3=\3,\0025\3-\0005\4.\0=\4/\3=\0030\2B\0\2\1K\0\1\0\vsearch\targs\1\6\0\0\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\1\0\2\fcommand\arg\fpattern\18\\b(KEYWORDS):\vcolors\ttest\1\3\0\0\15Identifier\f#FF00FF\fdefault\1\3\0\0\15Identifier\f#7C3AED\thint\1\3\0\0\19DiagnosticHint\f#10B981\tinfo\1\3\0\0\19DiagnosticInfo\f#2563EB\fwarning\1\4\0\0\19DiagnosticWarn\15WarningMsg\f#FBBF24\nerror\1\0\0\1\4\0\0\20DiagnosticError\rErrorMsg\f#DC2626\14highlight\fexclude\1\0\t\nafter\afg\18comments_only\2\14multiline\2\fpattern\22.*<(KEYWORDS)\\s*:\22multiline_pattern\a^.\17max_line_len\3ê\3\22multiline_context\3\n\fkeyword\twide\vbefore\5\14gui_style\1\0\2\afg\tNONE\abg\tBOLD\rkeywords\tTEST\1\4\0\0\fTESTING\vPASSED\vFAILED\1\0\2\ncolor\ttest\ticon\t‚è≤ \tNOTE\1\2\0\0\tINFO\1\0\2\ncolor\thint\ticon\tÔ°ß \tPERF\1\4\0\0\nOPTIM\16PERFORMANCE\rOPTIMIZE\1\0\1\ticon\tÔôë \tWARN\1\3\0\0\fWARNING\bXXX\1\0\2\ncolor\fwarning\ticon\tÔÅ± \tHACK\1\0\2\ncolor\fwarning\ticon\tÔíê \tTODO\1\0\2\ncolor\tinfo\ticon\tÔÄå \bFIX\1\0\0\balt\1\5\0\0\nFIXME\bBUG\nFIXIT\nISSUE\1\0\2\ncolor\nerror\ticon\tÔÜà \1\0\3\nsigns\2\18sign_priority\3\b\19merge_keywords\2\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/todo-comments.nvim",
    url = "git@github.com:folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23lvim.core.terminal\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/opt/toggleterm.nvim",
    url = "git@github.com:akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/tokyonight.nvim",
    url = "git@github.com:folke/tokyonight.nvim"
  },
  treesj = {
    config = { "\27LJ\2\nì\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\5\24use_default_keymaps\1\20cursor_behavior\thold\vnotify\2\23check_syntax_error\2\20max_join_length\3x\nsetup\vtreesj\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/treesj",
    url = "git@github.com:Wansmer/treesj"
  },
  ["trouble.nvim"] = {
    commands = { "TroubleToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/opt/trouble.nvim",
    url = "git@github.com:folke/trouble.nvim"
  },
  ["ts-node-action"] = {
    config = { "\27LJ\2\nÇ\1\0\1\6\0\6\0\0146\1\0\0009\1\1\0019\1\2\1\18\3\0\0006\4\0\0009\4\3\0049\4\4\4B\4\1\0A\1\1\0026\2\0\0009\2\1\0029\2\5\2B\2\1\1L\1\2\0\17inspect_tree\25nvim_get_current_buf\bapi\18get_node_text\15treesitter\bvimm\1\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0003\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\6*\1\0\0\24lexical_declaration\1\0\0\0\nsetup\19ts-node-action\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/ts-node-action",
    url = "git@github.com:ckolkey/ts-node-action"
  },
  ["vim-bookmarks"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/opt/vim-bookmarks",
    url = "git@github.com:MattesGroeger/vim-bookmarks"
  },
  ["vim-fanfingtastic"] = {
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/vim-fanfingtastic",
    url = "git@github.com:dahu/vim-fanfingtastic"
  },
  ["vim-illuminate"] = {
    config = { "\27LJ\2\nB\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\25lvim.core.illuminate\frequire\0" },
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/vim-illuminate",
    url = "git@github.com:RRethy/vim-illuminate"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/vim-repeat",
    url = "git@github.com:tpope/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/start/vim-surround",
    url = "git@github.com:tpope/vim-surround"
  },
  ["vista.vim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/opt/vista.vim",
    url = "git@github.com:liuchengxu/vista.vim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24lvim.core.which-key\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/lorentz/.local/share/lunarvim/site/pack/packer/opt/which-key.nvim",
    url = "git@github.com:folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^neodev"] = "neodev.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: telescope-vim-bookmarks.nvim
time([[Setup for telescope-vim-bookmarks.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "setup", "telescope-vim-bookmarks.nvim")
time([[Setup for telescope-vim-bookmarks.nvim]], false)
time([[packadd for telescope-vim-bookmarks.nvim]], true)
vim.cmd [[packadd telescope-vim-bookmarks.nvim]]
time([[packadd for telescope-vim-bookmarks.nvim]], false)
-- Setup for: nvim-ts-autotag
time([[Setup for nvim-ts-autotag]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0", "setup", "nvim-ts-autotag")
time([[Setup for nvim-ts-autotag]], false)
time([[packadd for nvim-ts-autotag]], true)
vim.cmd [[packadd nvim-ts-autotag]]
time([[packadd for nvim-ts-autotag]], false)
-- Setup for: symbols-outline.nvim
time([[Setup for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\n‹\f\0\0\5\0B\0G6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\0024\3\0\0=\3\n\0024\3\0\0=\3\v\0025\3\r\0005\4\f\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\0035\4\25\0=\4\26\0035\4\27\0=\4\28\0035\4\29\0=\4\30\0035\4\31\0=\4 \0035\4!\0=\4\"\0035\4#\0=\4$\0035\4%\0=\4&\0035\4'\0=\4(\0035\4)\0=\4*\0035\4+\0=\4,\0035\4-\0=\4.\0035\4/\0=\0040\0035\0041\0=\0042\0035\0043\0=\0044\0035\0045\0=\0046\0035\0047\0=\0048\0035\0049\0=\4:\0035\4;\0=\4<\0035\4=\0=\4>\0035\4?\0=\4@\3=\3A\2B\0\2\1K\0\1\0\fsymbols\18TypeParameter\1\0\2\ticon\tùôè\ahl\16TSParameter\rOperator\1\0\2\ticon\6+\ahl\15TSOperator\nEvent\1\0\2\ticon\tüó≤\ahl\vTSType\vStruct\1\0\2\ticon\tùì¢\ahl\vTSType\15EnumMember\1\0\2\ticon\bÔÖù\ahl\fTSField\tNull\1\0\2\ticon\tNULL\ahl\vTSType\bKey\1\0\2\ticon\tüîê\ahl\vTSType\vObject\1\0\2\ticon\b‚¶ø\ahl\vTSType\nArray\1\0\2\ticon\bÔô©\ahl\15TSConstant\fBoolean\1\0\2\ticon\b‚ä®\ahl\14TSBoolean\vNumber\1\0\2\ticon\6#\ahl\rTSNumber\vString\1\0\2\ticon\tùìê\ahl\rTSString\rConstant\1\0\2\ticon\bÓà¨\ahl\15TSConstant\rVariable\1\0\2\ticon\bÓûõ\ahl\15TSConstant\rFunction\1\0\2\ticon\bÔÇö\ahl\15TSFunction\14Interface\1\0\2\ticon\bÔ∞Æ\ahl\vTSType\tEnum\1\0\2\ticon\b‚Ñ∞\ahl\vTSType\16Constructor\1\0\2\ticon\bÓàè\ahl\18TSConstructor\nField\1\0\2\ticon\bÔöß\ahl\fTSField\rProperty\1\0\2\ticon\bÓò§\ahl\rTSMethod\vMethod\1\0\2\ticon\a∆í\ahl\rTSMethod\nClass\1\0\2\ticon\tùìí\ahl\vTSType\fPackage\1\0\2\ticon\bÔ£ñ\ahl\16TSNamespace\14Namespace\1\0\2\ticon\bÔô©\ahl\16TSNamespace\vModule\1\0\2\ticon\bÔö¶\ahl\16TSNamespace\tFile\1\0\0\1\0\2\ticon\bÔúì\ahl\nTSURI\21symbol_blacklist\18lsp_blacklist\fkeymaps\nclose\1\0\v\tfold\6h\vunfold\6l\rfold_all\6W\15unfold_all\6E\18goto_location\t<Cr>\19focus_location\6o\17hover_symbol\14<C-space>\19toggle_preview\6K\18rename_symbol\6r\15fold_reset\6R\17code_actions\6a\1\3\0\0\n<Esc>\6q\17fold_markers\1\3\0\0\bÔë†\bÔëº\1\0\r\15auto_close\1\rposition\nright\nwidth\3\25\26show_relative_numbers\1\17auto_preview\1\twrap\1\24show_symbol_details\2\25preview_bg_highlight\nPmenu\22auto_unfold_hover\2\16show_guides\2\27highlight_hovered_item\2\19relative_width\2\17show_numbers\1\nsetup\20symbols-outline\frequire\0", "setup", "symbols-outline.nvim")
time([[Setup for symbols-outline.nvim]], false)
time([[packadd for symbols-outline.nvim]], true)
vim.cmd [[packadd symbols-outline.nvim]]
time([[packadd for symbols-outline.nvim]], false)
-- Setup for: mini.animate
time([[Setup for mini.animate]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17mini.animate\frequire\0", "setup", "mini.animate")
time([[Setup for mini.animate]], false)
time([[packadd for mini.animate]], true)
vim.cmd [[packadd mini.animate]]
time([[packadd for mini.animate]], false)
-- Setup for: vim-bookmarks
time([[Setup for vim-bookmarks]], true)
try_loadstring("\27LJ\2\nä\2\0\0\2\0\n\0\0256\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0)\1\0\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0006\0\0\0009\0\1\0)\1\1\0=\1\t\0K\0\1\0\29bookmark_highlight_lines bookmark_display_annotation\24bookmark_auto_close%bookmark_no_default_key_mappings\bÔë°\29bookmark_annotation_sign\bÔêµ\18bookmark_sign\6g\bvim\0", "setup", "vim-bookmarks")
time([[Setup for vim-bookmarks]], false)
time([[packadd for vim-bookmarks]], true)
vim.cmd [[packadd vim-bookmarks]]
time([[packadd for vim-bookmarks]], false)
-- Setup for: better-escape.vim
time([[Setup for better-escape.vim]], true)
try_loadstring("\27LJ\2\n[\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0<let g:better_escape_shortcut = ['jk', 'kj', 'jj', 'kk']\bcmd\bvim\0", "setup", "better-escape.vim")
time([[Setup for better-escape.vim]], false)
-- Setup for: vista.vim
time([[Setup for vista.vim]], true)
try_loadstring("\27LJ\2\nB\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\rnvim_lsp\28vista_default_executive\6g\bvim\0", "setup", "vista.vim")
time([[Setup for vista.vim]], false)
time([[packadd for vista.vim]], true)
vim.cmd [[packadd vista.vim]]
time([[packadd for vista.vim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20lvim.core.alpha\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: overseer.nvim
time([[Config for overseer.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\roverseer\frequire\0", "config", "overseer.nvim")
time([[Config for overseer.nvim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22lvim.core.project\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nÒ\3\0\0\v\0\23\00166\0\0\0'\2\1\0B\0\2\0024\1\0\0006\2\2\0009\2\3\0029\2\4\0029\2\5\0029\2\6\2\15\0\2\0X\3\fÄ\21\2\1\0\22\2\0\0029\3\a\0006\5\b\0B\5\1\2'\6\t\0'\a\n\0'\b\v\0'\t\f\0'\n\r\0B\3\a\2<\3\2\0019\2\a\0006\4\14\0B\4\1\2'\5\15\0B\2\3\0029\3\16\0\18\5\2\0B\3\2\2\15\0\3\0X\4\3Ä\21\3\1\0\22\3\0\3<\2\3\0016\3\0\0'\5\17\0B\3\2\0029\3\18\3B\3\1\0016\3\0\0'\5\19\0B\3\2\0029\3\18\0035\5\20\0=\1\21\5B\3\2\0016\3\0\0'\5\22\0B\3\2\0029\3\18\3B\3\1\1K\0\1\0\"luasnip.loaders.from_snipmate\npaths\1\0\0 luasnip.loaders.from_vscode\14lazy_load\29luasnip.loaders.from_lua\17is_directory\rsnippets\19get_config_dir\22friendly-snippets\nstart\vpacker\tpack\tsite\20get_runtime_dir\15join_paths\22friendly_snippets\fsources\fluasnip\fbuiltin\tlvim\15lvim.utils\frequire\2\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: vim-illuminate
time([[Config for vim-illuminate]], true)
try_loadstring("\27LJ\2\nB\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\25lvim.core.illuminate\frequire\0", "config", "vim-illuminate")
time([[Config for vim-illuminate]], false)
-- Config for: aerial.nvim
time([[Config for aerial.nvim]], true)
try_loadstring("\27LJ\2\n+\0\1\4\1\1\0\5-\1\0\0009\1\0\1\18\3\0\0B\1\2\1K\0\1\0\0¿\18tree_open_all\v\0\1\1\0\0\0\1K\0\1\0\v\0\2\2\0\0\0\1L\0\2\0£\16\1\0\6\0(\00006\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\0035\4\a\0005\5\6\0=\5\b\0044\5\0\0=\5\t\4=\4\n\0034\4\0\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0034\4\0\0=\4\16\0035\4\17\0004\5\0\0=\5\18\4=\4\19\0033\4\20\0=\4\21\0033\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0005\5\27\0=\5\28\0043\5\29\0=\5\30\4=\4\31\0035\4 \0=\4!\0035\4\"\0=\4#\0035\4$\0=\4%\0035\4&\0=\4'\3B\1\2\0012\0\0ÄK\0\1\0\bman\1\0\1\17update_delay\3¨\2\rmarkdown\1\0\1\17update_delay\3¨\2\15treesitter\1\0\1\17update_delay\3¨\2\blsp\1\0\3\31diagnostics_trigger_update\2\23update_when_errors\2\17update_delay\3¨\2\nfloat\roverride\0\15min_height\1\3\0\0\3\b\4ö≥ÊÃ\tô≥Ê˝\3\1\0\3\15max_height\4Õô≥Ê\fÃô≥ˇ\3\rrelative\vcursor\vborder\frounded\vguides\1\0\4\rmid_item\15‚îú‚îÄ‚ñ∏ \15nested_top\t‚îÇ \15whitespace\a  \14last_item\15‚ï∞‚îÄ‚ñ∏ \21on_first_symbols\0\14on_attach\0\vignore\14filetypes\1\0\3\rwintypes\fspecial\rbuftypes\fspecial\21unlisted_buffers\1\nicons\16filter_kind\1\v\0\0\nClass\16Constructor\tEnum\rFunction\14Interface\vModule\vMethod\vStruct\nArray\vObject\fkeymaps\1\0 \azR\26actions.tree_open_all\6h\23actions.tree_close\6?\22actions.show_help\6}\17actions.next\azC!actions.tree_close_recursive\6p\19actions.scroll\azr%actions.tree_increase_fold_level\6O\"actions.tree_toggle_recursive\azo\22actions.tree_open\azm%actions.tree_decrease_fold_level\azM\27actions.tree_close_all\18<2-LeftMouse>\17actions.jump\6H!actions.tree_close_recursive\6q\18actions.close\6{\17actions.prev\azA\"actions.tree_toggle_recursive\azO actions.tree_open_recursive\azX\28actions.tree_sync_folds\a]]\20actions.next_up\azc\23actions.tree_close\6o\24actions.tree_toggle\n<C-v>\24actions.jump_vsplit\a[[\20actions.prev_up\6L actions.tree_open_recursive\aza\24actions.tree_toggle\azx\28actions.tree_sync_folds\ag?\22actions.show_help\t<CR>\17actions.jump\n<C-j>\28actions.down_and_scroll\n<C-s>\23actions.jump_split\n<C-k>\26actions.up_and_scroll\6l\22actions.tree_open\27close_automatic_events\vlayout\rwin_opts\14max_width\1\0\4\22preserve_equality\1\14placement\vwindow\22default_direction\17prefer_right\14min_width\3\n\1\3\0\0\3(\4ö≥ÊÃ\tô≥¶˛\3\rbackends\1\0\17\17manage_folds\2\19highlight_mode\16split_width\22disable_max_lines\3êN\14lazy_load\2\18post_jump_cmd\15normal! zz\16attach_mode\vwindow\14nerd_font\tauto\22highlight_closest\2\23highlight_on_hover\1\20close_on_select\1\18update_events\28TextChanged,InsertLeave\23link_tree_to_folds\2\23link_folds_to_tree\2\16show_guides\2\21disable_max_size\3Äâz\19open_automatic\1\22highlight_on_jump\3¨\2\1\5\0\0\15treesitter\blsp\rmarkdown\bman\nsetup\vaerial\frequire\0", "config", "aerial.nvim")
time([[Config for aerial.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n`\0\0\3\0\6\0\v6\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\5Ä6\0\3\0'\2\4\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\nsetup\18lvim.core.cmp\frequire\bcmp\fbuiltin\tlvim\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: NeoComposer.nvim
time([[Config for NeoComposer.nvim]], true)
try_loadstring("\27LJ\2\nÉ\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\fkeymaps\1\0\a\15stop_macro\acq\22toggle_macro_menu\n<c-q>\15yank_macro\ayq\15cycle_prev\n<c-p>\15play_macro\6Q\15cycle_next\n<c-n>\18toggle_record\6q\1\0\4\14status_bg\f#16161e\16delay_timer\b150\vnotify\2\15preview_fg\f#ff9e64\nsetup\16NeoComposer\frequire\0", "config", "NeoComposer.nvim")
time([[Config for NeoComposer.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nB\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\25lvim.core.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: neoai.nvim
time([[Config for neoai.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\1\1\0\0\0\1L\0\2\0´\1\0\1\5\0\3\0\6'\1\0\0'\2\1\0'\3\2\0\18\4\0\0&\1\4\1L\1\2\0(to in our upcoming conversations:\n\n:messages. Here is the code/text that I want to refer 6Hey, I'd like to provide some context for future Ê\4\1\0\a\0\24\0 6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0024\3\3\0005\4\6\0>\4\1\3=\3\a\0025\3\t\0003\4\b\0=\4\n\0036\4\0\0'\6\v\0B\4\2\0029\4\f\4=\4\r\3=\3\14\0025\3\15\0=\3\16\0025\3\18\0003\4\17\0=\4\19\3=\3\20\0025\3\21\0=\3\22\0024\3\0\0=\3\23\2B\0\2\1K\0\1\0\14shortcuts\rmappings\1\0\2\16select_down\n<C-j>\14select_up\n<C-k>\fprompts\19context_prompt\1\0\0\0\vinject\1\0\1\17cutoff_width\3K\20register_output\6c\26extract_code_snippets\16neoai.utils\6g\1\0\0\0\vmodels\1\0\2\nmodel\18gpt-3.5-turbo\tname\vopenai\aui\1\0\4\21open_api_key_env\19OPENAI_API_KEY\19openai_api_key8sk-Rk3Ft0Vwqd3mVBDeEufoT3BlbkFJIKiW0SG2lUjfBGOyBphj\28use_api_key_from_config\2\14proxy_url\19localhost:7890\1\0\5\nwidth\3(\22output_popup_text\nNeoAI\vsubmit\f<Enter>\24output_popup_height\3P\21input_popup_text\vPrompt\nsetup\nneoai\frequire\0", "config", "neoai.nvim")
time([[Config for neoai.nvim]], false)
-- Config for: harpoon
time([[Config for harpoon]], true)
try_loadstring("\27LJ\2\nµ\2\0\0\5\0\n\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\0016\0\0\0'\2\b\0B\0\2\0029\0\t\0'\2\1\0B\0\2\1K\0\1\0\19load_extension\14telescope\20global_settings\1\0\0\23excluded_filetypes\1\2\0\0\fharpoon\1\0\b\19save_on_toggle\1\19tabline_suffix\b   \27tmux_autoclose_windows\1\21enter_on_sendcmd\1\19save_on_change\2\19tabline_prefix\b   \ftabline\1\16mark_branch\1\nsetup\fharpoon\frequire\0", "config", "harpoon")
time([[Config for harpoon]], false)
-- Config for: lir.nvim
time([[Config for lir.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18lvim.core.lir\frequire\0", "config", "lir.nvim")
time([[Config for lir.nvim]], false)
-- Config for: neogen
time([[Config for neogen]], true)
try_loadstring("\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\19snippet_engine\fluasnip\nsetup\vneogen\frequire\0", "config", "neogen")
time([[Config for neogen]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18lvim.core.dap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: lsp_lines.nvim
time([[Config for lsp_lines.nvim]], true)
try_loadstring("\27LJ\2\nr\0\0\3\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0005\2\6\0B\0\2\1K\0\1\0\1\0\1\17virtual_text\1\vconfig\15diagnostic\bvim\nsetup\14lsp_lines\frequire\0", "config", "lsp_lines.nvim")
time([[Config for lsp_lines.nvim]], false)
-- Config for: noice.nvim
time([[Config for noice.nvim]], true)
try_loadstring("\27LJ\2\n»\19\0\0\t\0h\0ñ\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\20\0005\3\3\0004\4\0\0=\4\4\0035\4\6\0005\5\5\0=\5\a\0045\5\b\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\0045\5\14\0=\5\15\0045\5\16\0=\5\17\0044\5\0\0=\5\18\4=\4\19\3=\3\a\0025\3\21\0=\3\22\0025\3\23\0004\4\0\0=\4\24\3=\3\25\0025\3\26\0005\4\27\0=\4\r\3=\3\28\0025\3(\0005\4\29\0005\5\30\0=\5\4\0045\5&\0004\6\6\0005\a\31\0>\a\1\0065\a \0>\a\2\0065\a!\0>\a\3\0065\a\"\0005\b#\0=\b$\a>\a\4\0065\a%\0>\a\5\6=\6'\5=\5\r\4=\4)\0035\4*\0005\5+\0=\5\4\0045\0052\0004\6\6\0005\a,\0>\a\1\0065\a-\0>\a\2\0065\a.\0>\a\3\0065\a/\0005\b0\0=\b$\a>\a\4\0065\a1\0>\a\5\6=\6'\5=\5\r\0045\0053\0=\0054\4=\0045\0035\0046\0005\0057\0=\5\4\0045\0058\0=\5\r\0045\0059\0=\0054\4=\4:\3=\3;\0025\3<\0=\3=\0025\3?\0005\4>\0=\4@\0035\4A\0=\4B\0035\4C\0004\5\0\0=\5\4\4=\4D\0035\4E\0005\5F\0=\5G\0044\5\0\0=\5\4\4=\4H\0035\4I\0004\5\0\0=\5\4\4=\4J\0035\4K\0005\5L\0005\6M\0=\6\19\0055\6N\0=\6O\5=\5\4\4=\4P\3=\3Q\0025\3Y\0005\4T\0006\5R\0009\5S\0059\5\17\5=\5U\0046\5\0\0'\aV\0B\5\2\0029\5W\5=\5X\4=\4D\0035\4Z\0=\4[\3=\3\\\0025\3]\0=\3^\0025\3_\0005\4`\0=\4a\3=\3b\0025\3c\0=\3d\0024\3\0\0=\3e\0024\3\0\0=\3f\0024\3\0\0=\3g\0024\3\0\0=\3\19\2B\0\2\1K\0\1\0\vstatus\vroutes\nviews\fpresets\1\0\5\26long_message_to_split\1\20command_palette\2\18bottom_search\1\19lsp_doc_border\2\15inc_rename\1\15smart_move\23excluded_filetypes\1\4\0\0\rcmp_menu\rcmp_docs\vnotify\1\0\1\fenabled\2\vhealth\1\0\1\fchecker\1\rmarkdown\15highlights\1\0\6\n|%S-|\20@text.reference\18^%s*(Return:)\16@text.title\n{%S-}\15@parameter\20^%s*(See also:)\16@text.title\22^%s*(Parameters:)\16@text.title\t@%S+\15@parameter\1\0\0\20%[.-%]%((%S-)%)\topen\15noice.util\f|(%S-)|\1\0\0\bcmd\bvim\blsp\18documentation\16win_options\1\0\2\18concealcursor\6n\17conceallevel\3\3\1\2\0\0\14{message}\1\0\3\freplace\2\vrender\nplain\tlang\rmarkdown\1\0\1\tview\nhover\fmessage\1\0\2\fenabled\2\tview\vnotify\14signature\14auto_open\1\0\4\rthrottle\0032\fluasnip\2\fenabled\2\ftrigger\2\1\0\1\fenabled\2\nhover\1\0\1\fenabled\1\roverride\1\0\0031vim.lsp.util.convert_input_to_markdown_lines\1 cmp.entry.get_documentation\1\"vim.lsp.util.stylize_markdown\1\rprogress\1\0\0\1\0\5\rthrottle\4´’™’\n™’ÇÇ\4\tview\tmini\vformat\17lsp_progress\16format_done\22lsp_progress_done\fenabled\2\vnotify\1\0\2\fenabled\2\tview\vnotify\rcommands\verrors\1\0\1\freverse\2\1\0\1\nerror\2\1\0\2\vformat\fdetails\nenter\2\1\0\1\tview\npopup\tlast\16filter_opts\1\0\1\ncount\3\1\1\0\0\1\0\2\tkind\fmessage\nevent\blsp\1\2\0\0\5\1\0\1\nevent\rmsg_show\1\0\1\fwarning\2\1\0\1\nerror\2\1\0\1\nevent\vnotify\1\0\2\vformat\fdetails\nenter\2\1\0\1\tview\npopup\fhistory\1\0\0\bany\1\0\0\1\0\2\tkind\fmessage\nevent\blsp\tkind\1\2\0\0\5\1\0\1\nevent\rmsg_show\1\0\1\fwarning\2\1\0\1\nerror\2\1\0\1\nevent\vnotify\1\0\2\vformat\fdetails\nenter\2\1\0\1\tview\nsplit\rredirect\1\0\1\nevent\rmsg_show\1\0\1\tview\npopup\14popupmenu\15kind_icons\1\0\2\fbackend\bnui\fenabled\2\rmessages\1\0\6\16view_search\16virtualtext\17view_history\rmessages\tview\vnotify\fenabled\1\14view_warn\vnotify\15view_error\vnotify\1\0\1\rthrottle\4´’™’\n™’ÇÇ\4\vformat\ninput\thelp\1\0\2\ticon\bÔüï\fpattern\20^:%s*he?l?p?%s+\blua\1\0\3\ticon\bÓò†\fpattern\16^:%s*lua%s+\tlang\blua\vfilter\1\0\3\ticon\6$\fpattern\v^:%s*!\tlang\tbash\14search_up\1\0\4\ticon\fÔÄÇ ÔÑÇ\fpattern\b^%?\tkind\vsearch\tlang\nregex\16search_down\1\0\4\ticon\fÔÄÇ ÔÑÉ\fpattern\a^/\tkind\vsearch\tlang\nregex\fcmdline\1\0\0\1\0\3\ticon\bÔÅî\fpattern\a^:\tlang\bvim\topts\1\0\2\fenabled\2\tview\18cmdline_popup\nsetup\nnoice\frequire\0", "config", "noice.nvim")
time([[Config for noice.nvim]], false)
-- Config for: hi-my-words.nvim
time([[Config for hi-my-words.nvim]], true)
try_loadstring("\27LJ\2\n˚\a\0\0\6\0\25\00016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\v\0005\4\4\0005\5\5\0>\5\2\4>\4\1\0035\4\6\0005\5\a\0>\5\2\4>\4\2\0035\4\b\0005\5\t\0>\5\2\4>\4\3\0035\4\n\0005\5\v\0>\5\2\4>\4\4\0035\4\f\0005\5\r\0>\5\2\4>\4\5\0035\4\14\0005\5\15\0>\5\2\4>\4\6\0035\4\16\0005\5\17\0>\5\2\4>\4\a\0035\4\18\0005\5\19\0>\5\2\4>\4\b\0035\4\20\0005\5\21\0>\5\2\4>\4\t\0035\4\22\0005\5\23\0>\5\2\4>\4\n\3=\3\24\2B\0\2\1K\0\1\0\fhl_grps\1\0\6\afg\f#990011\fctermbg\3\1\vitalic\2\abg\f#fcf6f5\tbold\2\fctermfg\3\15\1\2\0\0\18HiMyWordsHLG9\1\0\6\afg\f#408ec6\fctermbg\3\v\vitalic\2\abg\f#1e2761\tbold\2\fctermfg\3\0\1\2\0\0\18HiMyWordsHLG8\1\0\6\afg\f#2c5f2d\fctermbg\3\v\vitalic\2\abg\f#97bc62\tbold\2\fctermfg\3\0\1\2\0\0\18HiMyWordsHLG7\1\0\6\afg\f#2f3c7e\fctermbg\3\v\vitalic\2\abg\f#fbeaeb\tbold\2\fctermfg\3\0\1\2\0\0\18HiMyWordsHLG6\1\0\6\afg\f#fcf6f5\fctermbg\3\1\vitalic\2\abg\f#990011\tbold\2\fctermfg\3\15\1\2\0\0\18HiMyWordsHLG5\1\0\6\afg\f#ffffff\fctermbg\3\1\vitalic\2\abg\f#8aaae5\tbold\2\fctermfg\3\15\1\2\0\0\18HiMyWordsHLG4\1\0\6\afg\f#e2d1f9\fctermbg\3\v\vitalic\2\abg\f#317773\tbold\2\fctermfg\3\0\1\2\0\0\18HiMyWordsHLG3\1\0\6\afg\f#ccf381\fctermbg\3\v\vitalic\2\abg\f#4831d4\tbold\2\fctermfg\3\0\1\2\0\0\18HiMyWordsHLG2\1\0\6\afg\f#101820\fctermbg\3\v\vitalic\2\abg\f#fee715\tbold\2\fctermfg\3\0\1\2\0\0\18HiMyWordsHLG1\1\0\6\afg\f#eea47f\fctermbg\3\21\vitalic\2\abg\f#00539c\tbold\2\fctermfg\3Ç\1\1\2\0\0\18HiMyWordsHLG0\1\0\1\vsilent\1\nsetup\16hi-my-words\frequire\0", "config", "hi-my-words.nvim")
time([[Config for hi-my-words.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n\1\0\0\5\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\3B\1\2\0016\1\6\0=\0\1\1K\0\1\0\bvim\nicons\1\0\5\nERROR\bÔÅó\tWARN\bÔÅ™\nDEBUG\bÔÜà\tINFO\bÔÅö\nTRACE\b‚úé\1\0\b\ftimeout\3à'\bfps\3\30\vrender\fdefault\nlevel\3\2\rtop_down\2\18minimum_width\0032\vstages\nslide\22background_colour\vNormal\nsetup\vnotify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: neovim-session-manager
time([[Config for neovim-session-manager]], true)
try_loadstring("\27LJ\2\n≤\3\0\0\6\0\f\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0006\3\0\0'\5\4\0B\3\2\0029\3\5\0039\3\6\3=\3\a\0024\3\0\0=\3\b\0025\3\t\0=\3\n\0024\3\0\0=\3\v\2B\0\2\1K\0\1\0\29autosave_ignore_buftypes\30autosave_ignore_filetypes\1\2\0\0\14gitcommit\25autosave_ignore_dirs\18autoload_mode\rDisabled\17AutoloadMode\27session_manager.config\1\0\a\18path_replacer\a__\29autosave_only_in_session\1\19colon_replacer\a++\26autosave_last_session\1\31autosave_ignore_not_normal\2\20max_path_length\3P\17sessions_dir\"/Users/lorentz/.nvimsessions/\nsetup\20session_manager\frequire\0", "config", "neovim-session-manager")
time([[Config for neovim-session-manager]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rsetup_ui\18lvim.core.dap\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20lvim.core.mason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: pretty-fold.nvim
time([[Config for pretty-fold.nvim]], true)
try_loadstring("\27LJ\2\nB\0\0\4\0\6\0\a6\0\0\0009\0\1\0'\2\2\0006\3\3\0009\3\4\0039\3\5\3D\0\3\0\14foldlevel\6v\bvim\b‚Ä¢\brep\vstringB\0\0\4\0\6\0\a6\0\0\0009\0\1\0'\2\2\0006\3\3\0009\3\4\0039\3\5\3D\0\3\0\14foldlevel\6v\bvim\b‚Ä¢\brep\vstringÄ\6\1\0\b\0\"\00096\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\t\0005\4\5\0005\5\3\0003\6\4\0>\6\4\5=\5\6\0045\5\a\0=\5\b\4=\4\n\0034\4\0\0=\4\v\0035\4\f\0=\4\r\0034\4\4\0005\5\14\0>\5\1\0045\5\15\0>\5\2\0045\5\16\0>\5\3\4=\4\17\0035\4\18\0=\4\19\3B\1\2\0019\1\20\0'\3\21\0005\4\29\0004\5\b\0005\6\22\0>\6\1\0055\6\23\0>\6\2\0055\6\24\0>\6\3\0055\6\25\0>\6\4\0055\6\26\0>\6\5\0055\6\27\0>\6\6\0055\6\28\0>\6\a\5=\5\17\0045\5 \0005\6\30\0003\a\31\0>\a\4\6=\6\6\0055\6!\0=\6\b\5=\5\n\4B\1\3\1K\0\1\0\1\6\0\0\t‚î´ \27number_of_folded_lines\a: \15percentage\15 ‚î£‚îÅ‚îÅ\1\0\0\0\1\6\0\0\fcontent\v‚î£‚îÅ\6 \0\6 \1\0\0\1\3\0\0\a%[\6]\1\3\0\0\a%(\6)\1\3\0\0\6{\6}\1\3\0\0\18function%s*%(\bend\1\3\0\0\f^%s*for\bend\1\3\0\0\v^%s*if\bend\1\3\0\0\f^%s*do$\bend\blua\rft_setup\14ft_ignore\1\2\0\0\nneorg\21matchup_patterns\1\3\0\0\a%[\6]\1\3\0\0\a%(\6)\1\3\0\0\6{\6}\15stop_words\1\2\0\0\14@brief%s*\18comment_signs\rsections\1\0\5\14fill_char\b‚îÅ\21keep_indentation\2\26process_comment_signs\vspaces\24remove_fold_markers\2\22add_close_pattern\2\nright\1\6\0\0\t‚î´ \27number_of_folded_lines\a: \15percentage\15 ‚î£‚îÅ‚îÅ\tleft\1\0\0\0\1\6\0\0\fcontent\v‚î£‚îÅ\6 \0\6 \nsetup\16pretty-fold\frequire\0", "config", "pretty-fold.nvim")
time([[Config for pretty-fold.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\nÑ\t\0\0\6\0001\00096\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\4\0005\5\5\0=\5\6\4=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0005\5\14\0=\5\6\4=\4\15\0035\4\16\0005\5\17\0=\5\6\4=\4\18\0035\4\19\0005\5\20\0=\5\6\4=\4\21\0035\4\22\0005\5\23\0=\5\6\4=\4\24\3=\3\25\0025\3\26\0=\3\27\0025\3\28\0004\4\0\0=\4\29\3=\3\30\0025\3 \0005\4\31\0=\4!\0035\4\"\0=\4#\0035\4$\0=\4%\0035\4&\0=\4'\0035\4(\0=\4)\0035\4*\0=\4+\3=\3,\0025\3-\0005\4.\0=\4/\3=\0030\2B\0\2\1K\0\1\0\vsearch\targs\1\6\0\0\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\1\0\2\fcommand\arg\fpattern\18\\b(KEYWORDS):\vcolors\ttest\1\3\0\0\15Identifier\f#FF00FF\fdefault\1\3\0\0\15Identifier\f#7C3AED\thint\1\3\0\0\19DiagnosticHint\f#10B981\tinfo\1\3\0\0\19DiagnosticInfo\f#2563EB\fwarning\1\4\0\0\19DiagnosticWarn\15WarningMsg\f#FBBF24\nerror\1\0\0\1\4\0\0\20DiagnosticError\rErrorMsg\f#DC2626\14highlight\fexclude\1\0\t\nafter\afg\18comments_only\2\14multiline\2\fpattern\22.*<(KEYWORDS)\\s*:\22multiline_pattern\a^.\17max_line_len\3ê\3\22multiline_context\3\n\fkeyword\twide\vbefore\5\14gui_style\1\0\2\afg\tNONE\abg\tBOLD\rkeywords\tTEST\1\4\0\0\fTESTING\vPASSED\vFAILED\1\0\2\ncolor\ttest\ticon\t‚è≤ \tNOTE\1\2\0\0\tINFO\1\0\2\ncolor\thint\ticon\tÔ°ß \tPERF\1\4\0\0\nOPTIM\16PERFORMANCE\rOPTIMIZE\1\0\1\ticon\tÔôë \tWARN\1\3\0\0\fWARNING\bXXX\1\0\2\ncolor\fwarning\ticon\tÔÅ± \tHACK\1\0\2\ncolor\fwarning\ticon\tÔíê \tTODO\1\0\2\ncolor\tinfo\ticon\tÔÄå \bFIX\1\0\0\balt\1\5\0\0\nFIXME\bBUG\nFIXIT\nISSUE\1\0\2\ncolor\nerror\ticon\tÔÜà \1\0\3\nsigns\2\18sign_priority\3\b\19merge_keywords\2\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: treesj
time([[Config for treesj]], true)
try_loadstring("\27LJ\2\nì\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\5\24use_default_keymaps\1\20cursor_behavior\thold\vnotify\2\23check_syntax_error\2\20max_join_length\3x\nsetup\vtreesj\frequire\0", "config", "treesj")
time([[Config for treesj]], false)
-- Config for: dressing.nvim
time([[Config for dressing.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\1\1\0\0\0\1L\0\2\0\v\0\1\1\0\0\0\1L\0\2\0Ø\t\1\0\6\0001\0?6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\19\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0034\4\0\0=\4\b\0035\4\t\0=\4\n\0035\4\f\0005\5\v\0=\5\r\0045\5\14\0=\5\15\4=\4\16\0033\4\17\0=\4\18\3=\3\20\0025\3\21\0005\4\22\0=\4\23\0035\4\25\0005\5\24\0=\5\26\4=\4\27\0035\4\29\0005\5\28\0=\5\30\4=\4\31\0035\4 \0005\5!\0=\5\"\0045\5#\0=\5\b\0045\5$\0=\5\n\4=\4%\0035\4&\0004\5\0\0=\5\b\0045\5'\0=\5\n\0045\5(\0=\5\5\0045\5)\0=\5\a\0045\5*\0=\5+\0045\5,\0=\5\16\0043\5-\0=\5\18\4=\4.\0034\4\0\0=\4/\3=\0030\2B\0\2\1K\0\1\0\vselect\25format_item_override\fbuiltin\0\1\0\3\n<Esc>\nClose\n<C-c>\nClose\t<CR>\fConfirm\15min_height\1\3\0\0\3\n\4ö≥ÊÃ\tô≥¶˛\3\1\3\0\0\3(\4ö≥ÊÃ\tô≥¶˛\3\1\3\0\0\3å\1\4ö≥ÊÃ\tô≥¶ˇ\3\1\0\1\rwinblend\3\n\1\0\4\15max_height\4Õô≥Ê\fÃô≥ˇ\3\rrelative\veditor\vanchor\aNW\vborder\frounded\bnui\1\0\1\rwinblend\3\n\1\0\2\rswapfile\1\rfiletype\19DressingSelect\vborder\1\0\1\nstyle\frounded\1\0\6\15max_height\3(\rrelative\veditor\rposition\b50%\15min_height\3\n\14max_width\3P\14min_width\3(\ffzf_lua\fwinopts\1\0\0\1\0\2\vheight\4ö≥ÊÃ\tô≥Ê˛\3\nwidth\4\0ÄÄÄˇ\3\bfzf\vwindow\1\0\0\1\0\2\vheight\4ö≥ÊÃ\tô≥Ê˛\3\nwidth\4\0ÄÄÄˇ\3\fbackend\1\6\0\0\14telescope\ffzf_lua\bfzf\fbuiltin\bnui\1\0\2\fenabled\2\16trim_prompt\2\ninput\1\0\0\roverride\0\rmappings\6i\1\0\4\t<Up>\16HistoryPrev\n<C-c>\nClose\v<Down>\16HistoryNext\t<CR>\fConfirm\6n\1\0\0\1\0\2\n<Esc>\nClose\t<CR>\fConfirm\16win_options\1\0\2\rwinblend\3\n\twrap\1\16buf_options\14min_width\1\3\0\0\3\20\4ö≥ÊÃ\tô≥¶˛\3\14max_width\1\3\0\0\3å\1\4Õô≥Ê\fÃô≥ˇ\3\1\0\t\20start_in_insert\2\17prompt_align\tleft\19default_prompt\vInput:\fenabled\2\17prefer_width\3(\16insert_only\2\rrelative\vcursor\vanchor\aSW\vborder\frounded\nsetup\rdressing\frequire\0", "config", "dressing.nvim")
time([[Config for dressing.nvim]], false)
-- Config for: rust-tools.nvim
time([[Config for rust-tools.nvim]], true)
try_loadstring("\27LJ\2\nÂ\b\0\0\b\0 \0.6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\24\0005\4\5\0006\5\0\0'\a\3\0B\5\2\0029\5\4\5=\5\6\0045\5\a\0=\5\b\0045\5\17\0004\6\t\0005\a\t\0>\a\1\0065\a\n\0>\a\2\0065\a\v\0>\a\3\0065\a\f\0>\a\4\0065\a\r\0>\a\5\0065\a\14\0>\a\6\0065\a\15\0>\a\a\0065\a\16\0>\a\b\6=\6\18\5=\5\19\0045\5\20\0005\6\21\0=\6\22\5=\5\23\4=\4\25\0035\4\26\0=\4\27\0035\4\29\0005\5\28\0=\5\30\4=\4\31\3B\1\2\1K\0\1\0\bdap\fadapter\1\0\0\1\0\3\fcommand\16lldb-vscode\ttype\15executable\tname\frt_lldb\vserver\1\0\1\15standalone\2\ntools\1\0\0\16crate_graph\30enabled_graphviz_backends\0017\0\0\bbmp\fcgimage\ncanon\bdot\agv\txdot\fxdot1.2\fxdot1.4\beps\bexr\bfig\agd\bgd2\bgif\bgtk\bico\tcmap\nismap\timap\ncmapx\fimap_np\rcmapx_np\bjpg\tjpeg\bjpe\bjp2\tjson\njson0\rdot_json\14xdot_json\bpdf\bpic\bpct\tpict\nplain\14plain-ext\bpng\bpov\aps\bps2\bpsd\bsgi\bsvg\tsvgz\btga\ttiff\btif\atk\bvml\tvmlz\twbmp\twebp\txlib\bx11\1\0\2\tfull\2\fbackend\bx11\18hover_actions\vborder\1\0\1\15auto_focus\1\1\3\0\0\b‚îÇ\16FloatBorder\1\3\0\0\b‚ï∞\16FloatBorder\1\3\0\0\b‚îÄ\16FloatBorder\1\3\0\0\b‚ïØ\16FloatBorder\1\3\0\0\b‚îÇ\16FloatBorder\1\3\0\0\b‚ïÆ\16FloatBorder\1\3\0\0\b‚îÄ\16FloatBorder\1\3\0\0\b‚ï≠\16FloatBorder\16inlay_hints\1\0\n\26max_len_align_padding\3\1\16right_align\1\27parameter_hints_prefix\b<- \tauto\2\23other_hints_prefix\b=> \24right_align_padding\3\a\14highlight\fComment\25show_parameter_hints\2\18max_len_align\1\22only_current_line\1\rexecutor\1\0\1%reload_workspace_from_cargo_toml\2\rtermopen\25rust-tools.executors\nsetup\15rust-tools\frequire\0", "config", "rust-tools.nvim")
time([[Config for rust-tools.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\26lvim.core.indentlines\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: codewindow.nvim
time([[Config for codewindow.nvim]], true)
try_loadstring("\27LJ\2\nq\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0019\1\4\0B\1\1\1K\0\1\0\27apply_default_keybinds\1\0\1\21width_multiplier\3\2\nsetup\15codewindow\frequire\0", "config", "codewindow.nvim")
time([[Config for codewindow.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24lvim.core.autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23lvim.core.nvimtree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24lvim.core.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-navic
time([[Config for nvim-navic]], true)
try_loadstring("\27LJ\2\nC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\26lvim.core.breadcrumbs\frequire\0", "config", "nvim-navic")
time([[Config for nvim-navic]], false)
-- Config for: ts-node-action
time([[Config for ts-node-action]], true)
try_loadstring("\27LJ\2\nÇ\1\0\1\6\0\6\0\0146\1\0\0009\1\1\0019\1\2\1\18\3\0\0006\4\0\0009\4\3\0049\4\4\4B\4\1\0A\1\1\0026\2\0\0009\2\1\0029\2\5\2B\2\1\1L\1\2\0\17inspect_tree\25nvim_get_current_buf\bapi\18get_node_text\15treesitter\bvimm\1\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0003\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\6*\1\0\0\24lexical_declaration\1\0\0\0\nsetup\19ts-node-action\frequire\0", "config", "ts-node-action")
time([[Config for ts-node-action]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22lvim.core.lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-various-textobjs
time([[Config for nvim-various-textobjs]], true)
try_loadstring("\27LJ\2\nî\1\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\20disabledKeymaps\1\0\3\22useDefaultKeymaps\2\19lookForwardBig\3\15\21lookForwardSmall\3\5\nsetup\21various-textobjs\frequire\0", "config", "nvim-various-textobjs")
time([[Config for nvim-various-textobjs]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file RnvimrToggle lua require("packer.load")({'rnvimr'}, { cmd = "RnvimrToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'gitsigns.nvim', 'numb.nvim', 'Comment.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'bufferline.nvim', 'which-key.nvim', 'toggleterm.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPost * ++once lua require("packer.load")({'nvim-ts-context-commentstring'}, { event = "BufReadPost *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'better-escape.vim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
