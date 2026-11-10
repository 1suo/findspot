-- Package the six generated Obsidian palettes with an independent surface-order toggle.
-- Run after scripts/generate.lua: lua scripts/package-obsidian.lua

local palettes = {
  { name = "Alexandria", slug = "alexandria", mode = "light" },
  { name = "Babylon", slug = "babylon", mode = "dark" },
  { name = "Knossos", slug = "knossos", mode = "light" },
  { name = "Petra", slug = "petra", mode = "dark" },
  { name = "Tikal", slug = "tikal", mode = "dark" },
  { name = "Troy", slug = "troy", mode = "dark" },
}

local out = {
  "/* Findspot — six palettes, one Obsidian theme.",
  " * Palette selection and surface order are available in Style Settings (optional plugin).",
  " * Choose a light palette with Obsidian's Light mode, and a dark palette with Dark mode.",
  " */",
  "",
  "/* @settings",
  "",
  "name: Findspot",
  "id: findspot",
  "settings:",
  "    -",
  "        id: findspot-palette",
  "        title: Palette",
  "        description: Choose a palette. Match Obsidian's base color scheme to the palette mode.",
  "        type: class-select",
  "        allowEmpty: false",
  "        default: findspot-palette-alexandria",
  "        options:",
}
for _, p in ipairs(palettes) do
  out[#out + 1] = "            -"
  out[#out + 1] = "                label: " .. p.name .. " (" .. p.mode .. ")"
  out[#out + 1] = "                value: findspot-palette-" .. p.slug
end
out[#out + 1] = "    -"
out[#out + 1] = "        id: findspot-surfaces-swapped"
out[#out + 1] = "        title: Swap background and surface"
out[#out + 1] = "        description: Reverse the palette's background and surface roles without changing its colors."
out[#out + 1] = "        type: class-toggle"
out[#out + 1] = "        default: false"
out[#out + 1] = "*/"
out[#out + 1] = ""

local function scoped_css(p, source_suffix, class_suffix)
  local path = "ports/obsidian/" .. p.slug .. source_suffix .. ".css"
  local file = assert(io.open(path, "r"), "Missing generated palette CSS: " .. path)
  local css = file:read("*a")
  file:close()

  local selector = "body.theme-" .. p.mode .. " {"
  local class_name = "findspot-palette-" .. p.slug .. class_suffix
  local scope = "body.theme-" .. p.mode .. "." .. class_name
  local scoped = scope .. " {"
  local selector_start = css:find(selector, 1, true)
  assert(selector_start, "Expected mode selector not found in " .. path)
  local replaced = css:sub(1, selector_start - 1)
    .. scoped .. css:sub(selector_start + #selector)

  local lines = {}
  local inside_vars = false
  for line in (replaced .. "\\n"):gmatch("(.-)\\n") do
    if line == "" and #lines == 0 then
      -- Preserve no leading blank lines.
    else
      if line == "}" then inside_vars = true end
      if inside_vars then
        local selectors, rule = line:match("^(.-)(%\\s*{.*)$")
        if selectors and not selectors:match("^%\\s*/") then
          local scoped_selectors = {}
          for selector_part in selectors:gmatch("[^,]+") do
            scoped_selectors[#scoped_selectors + 1] = scope
              .. " " .. selector_part:gsub("^%\\s+", "")
          end
          line = table.concat(scoped_selectors, ", ") .. rule
        end
      end
      lines[#lines + 1] = line
    end
  end
  return table.concat(lines, "\\n")
end

for _, p in ipairs(palettes) do
  out[#out + 1] = scoped_css(p, "", "")
  out[#out + 1] = ""
  out[#out + 1] = scoped_css(p, "-swapped", ".findspot-surfaces-swapped")
  out[#out + 1] = ""
end

local target = assert(io.open("theme.css", "w"))
target:write(table.concat(out, "\\n"))
target:close()
print("Generated theme.css with six palettes and a background/surface toggle")
