return {
  "gorbit99/codewindow.nvim",
  config = function()
    local codewindow = require("codewindow")
    codewindow.setup {
      width_multiplier = 2,
    }
    codewindow.apply_default_keybinds()
  end
}
