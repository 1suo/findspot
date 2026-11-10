-- A small syntax sample used for automated colorscheme screenshots.
local M = {}

local function greet(name)
  local message = "Hello, " .. name
  local count = 6
  local enabled = true

  if enabled and count > 0 then
    print(message)
  end

  return {
    name = name,
    count = count,
    ready = enabled,
  }
end

---@param palette string
---@return table
function M.preview(palette)
  -- Comments, strings, numbers, functions, keywords, and types.
  local colors = { "red", "green", "blue" }
  for index, color in ipairs(colors) do
    greet(palette .. ":" .. color .. tostring(index))
  end

  return greet(palette)
end

return M
