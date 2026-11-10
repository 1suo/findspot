-- Package the six generated Obsidian palette snippets as one community theme.
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
  " * Palette selection is available in Style Settings (optional plugin).",
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
out[#out + 1] = "*/"
out[#out + 1] = ""

for _, p in ipairs(palettes) do
  local path = "ports/obsidian/" .. p.slug .. ".css"
  local file = assert(io.open(path, "r"), "Missing generated palette CSS: " .. path)
  local css = file:read("*a")
  file:close()

  local selector = "body.theme-" .. p.mode .. " {"
  local scoped = "body.theme-" .. p.mode .. ".findspot-palette-" .. p.slug .. " {"
  local replaced = css:gsub(selector, scoped, 1)
  assert(replaced ~= css, "Expected mode selector not found in " .. path)

  local lines = {}
  local inside_vars = false
  for line in (replaced .. "\n"):gmatch("(.-)\n") do
    if line == "" and #lines == 0 then
      -- Preserve no leading blank lines.
    else
      if line == "}" then inside_vars = true end
      if inside_vars then
        local selectors, rule = line:match("^(.-)(%s*{.*)$")
        if selectors and not selectors:match("^%s*/") then
          local scoped = {}
          for selector in selectors:gmatch("[^,]+") do
            scoped[#scoped + 1] = "body.theme-" .. p.mode .. ".findspot-palette-" .. p.slug
              .. " " .. selector:gsub("^%s+", "")
          end
          line = table.concat(scoped, ", ") .. rule
        end
      end
      lines[#lines + 1] = line
    end
  end
  out[#out + 1] = table.concat(lines, "\n")
  out[#out + 1] = ""
end

local target = assert(io.open("theme.css", "w"))
target:write(table.concat(out, "\n"))
target:close()
print("Generated theme.css with six Style Settings palettes")
