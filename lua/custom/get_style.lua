-- ~/.config/nvim/lua/custom/get_style.lua

local M = {}

-- Function to check macOS system appearance (light or dark mode)
M.get_appearance = function()
  local handle = io.popen 'defaults read -g AppleInterfaceStyle 2>/dev/null'
  local result = handle:read '*a'
  handle:close()

  if result:match 'Dark' then
    return 'moon'
  else
    return 'day'
  end
end

return M
