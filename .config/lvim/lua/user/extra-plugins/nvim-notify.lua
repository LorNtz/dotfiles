return {
  "rcarriga/nvim-notify",
  config = function ()
    local notify = require("notify")
    notify.setup(
      {
        background_colour = "Normal",
        fps = 30,
        icons = {
          DEBUG = "",
          ERROR = "",
          INFO = "",
          TRACE = "✎",
          WARN = ""
        },
        level = 2,
        minimum_width = 50,
        render = "default",
        stages = "slide",
        timeout = 5000,
        top_down = true
      }
    )
    vim.notify = notify
  end
}
