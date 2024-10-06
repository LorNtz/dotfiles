local n = require("nui-components")
local counter = require('ui-components.counter')

local M = {}

function M.toggle()
  if M.renderer then
    return M.renderer:focus()
  end

  local renderer = n.create_renderer({
    width = 40,
    height = 8,
    relative = 'editor',
    keymap = {
      close = { '<Esc>', 'q' },
      focus_next = '<Tab>',
      focus_prev = '<S-Tab>',
    }
  })

  renderer:add_mappings({
    {
      mode = { 'n' },
      key = '<CR>',
      handler = function()
        renderer:close()
      end,
    },
    {
      mode = { 'n' },
      key = 'j',
      handler = function ()
        local component_below = renderer:get_component_by_direction('down')
        if component_below ~= nil then
          component_below:focus()
        end
      end
    }
  })

  local signal = n.create_signal({
    is_loading = false,
    search = '',
    glob_pattern = '*',
    search_paths = 'src',
    is_case_insensitive_checked = false,
    results = {}
  })
  
  local subscription = signal:observe(function(prev, curr)
    
  end)
  
  renderer:on_unmount(function()
    subscription:unsubscribe()
    M.renderer = nil
  end)

  local comp = function ()
    return
    n.rows(
      n.columns(
        { size = 3 },
        n.text_input({
          autofocus = true,
          flex = 1,
          max_lines = 1,
          border_label = "Search",
          on_change = function ()
            
          end,
        }),
        n.checkbox({
          label = " Aa ",
          default_sign = "",
          checked_sign = "",
          border_style = "rounded",
          value = signal.is_case_insensitive_checked,
          on_change = function(is_checked)
            signal.is_case_insensitive_checked = is_checked
          end,
        })
      ),
      n.text_input({
        size = 1,
        max_lines = 1,
        border_label = "Glob pattern (optional)",
        value = signal.glob_pattern,
        on_change = function (value)
          signal.glob_pattern = value
        end,
      }),
      n.text_input({
        size = 1,
        max_lines = 1,
        border_label = "Paths to include",
        value = signal.search_paths,
        on_change = function (value)
          signal.search_paths = value
        end,
      })
    )
  end

  renderer:render(comp)
  M.renderer = renderer

end

M.toggle()

return M
