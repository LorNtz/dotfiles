local Component = require("nui-components.component")
local Line = require("nui.line")
 
local Counter = Component:extend("Counter")
 
function Counter:init(props)
  Counter.super.init(
    self,
    vim.tbl_extend("force", {
      value = 1,
      on_change = function() end,
    }, props)
  )
end
 
function Counter:prop_types()
  return {
    value = "number",
    on_change = "function",
  }
end
 
function Counter:initial_value()
  return self:get_props().value
end
 
function Counter:get_current_value()
  local props = self:get_props()
 
  if props.instance:is_signal("value") then
    return props.value
  end
 
  return Counter.super.get_current_value(self)
end
 
function Counter:mappings()
  local props = self:get_props()
  return {
    {
      mode = { "n" },
      key = "<Up>",
      handler = function()
        local value = self:get_current_value() + 1
        self:set_current_value(value)
        props.on_change(value)
      end,
    },
    {
      mode = { "n" },
      key = "<Down>",
      handler = function()
        local value = self:get_current_value() - 1
        self:set_current_value(value)
        props.on_change(value)
      end,
    },
  }
end
 
function Counter:get_lines()
  local line = Line()
  line:append(tostring(self:get_current_value()))
  return line
end
 
function Counter:on_layout()
  return {
    height = 1,
    width = self:get_lines():width(),
  }
end
 
function Counter:on_update()
  self:modify_buffer_content(function()
    local content = self:get_lines()
    content:render(self.bufnr, -1, 1)
  end)
end
 
return Counter
