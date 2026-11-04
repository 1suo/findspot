vim.opt.termguicolors = true
vim.g.colors_name = "findspot-troy"

local c = {
  bg          = "#000000",
  fg          = "#faebd7",

  black       = "#000000",
  brown       = "#8b4513",
  peru        = "#cd853f",
  tomato      = "#ff6347",
  red         = "#ff0000",
  gold        = "#ffd700",
  yellow      = "#ffff00",
  khaki       = "#f0e68c",
  darkkhaki   = "#bdb76b",
  violet      = "#8a2be2",
  orchid      = "#ba55d3",
  spring      = "#00ff7f",

  -- Derived UI colors
  surface     = "#000000",
  surface2    = "#000000",
  border      = "#54300f",
  muted       = "#9b7953",
  subtle      = "#66503b",
  selection   = "#8b4513",
  cursorline  = "#171009",
  search_bg   = "#ffd700",
  search_fg   = "#000000",
}

local function hi(group, spec)
  vim.api.nvim_set_hl(0, group, spec)
end

local function link(group, target)
  hi(group, { link = target })
end

-- Terminal colors
vim.g.terminal_color_0  = c.black
vim.g.terminal_color_1  = c.tomato
vim.g.terminal_color_2  = c.peru
vim.g.terminal_color_3  = c.gold
vim.g.terminal_color_4  = c.darkkhaki
vim.g.terminal_color_5  = c.violet
vim.g.terminal_color_6  = "#daa520"
vim.g.terminal_color_7  = c.fg
vim.g.terminal_color_8  = c.brown
vim.g.terminal_color_9  = c.red
vim.g.terminal_color_10 = c.spring
vim.g.terminal_color_11 = c.yellow
vim.g.terminal_color_12 = c.gold
vim.g.terminal_color_13 = c.orchid
vim.g.terminal_color_14 = c.khaki
vim.g.terminal_color_15 = c.fg

-- Editor
hi("Normal",       { fg = c.fg, bg = c.bg })
hi("NormalNC",     { fg = c.fg, bg = c.bg })
hi("NormalFloat",  { fg = c.fg, bg = c.surface })
hi("FloatBorder",  { fg = c.brown, bg = c.surface })
hi("FloatTitle",   { fg = c.gold, bg = c.surface, bold = true })
hi("EndOfBuffer",  { fg = c.surface2 })
hi("NonText",      { fg = c.subtle })
hi("Whitespace",  { fg = c.subtle })
hi("SpecialKey",  { fg = c.brown })

hi("Cursor",       { fg = c.bg, bg = c.spring })
hi("lCursor",      { fg = c.bg, bg = c.spring })
hi("CursorIM",     { fg = c.bg, bg = c.spring })
hi("CursorLine",   { bg = c.cursorline })
hi("CursorColumn", { bg = c.cursorline })
hi("CursorLineNr", { fg = c.gold, bold = true })
hi("LineNr",       { fg = c.brown })
hi("SignColumn",   { fg = c.peru, bg = c.bg })
hi("ColorColumn",  { bg = c.surface })

hi("Visual",       { fg = c.fg, bg = c.selection })
hi("VisualNOS",    { fg = c.fg, bg = c.selection })
hi("Search",       { fg = c.search_fg, bg = c.search_bg, bold = true })
hi("IncSearch",    { fg = c.bg, bg = c.tomato, bold = true })
hi("CurSearch",    { fg = c.bg, bg = c.yellow, bold = true })
hi("Substitute",   { fg = c.bg, bg = c.tomato, bold = true })

hi("MatchParen",   { fg = c.spring, bold = true, underline = true })
hi("Directory",    { fg = c.gold })
hi("Title",        { fg = c.gold, bold = true })
hi("Question",     { fg = c.spring })
hi("MoreMsg",      { fg = c.spring })
hi("WarningMsg",  { fg = c.tomato })
hi("ErrorMsg",     { fg = c.red, bold = true })
hi("ModeMsg",      { fg = c.gold })
hi("MsgArea",      { fg = c.fg })
hi("MsgSeparator", { fg = c.brown, bg = c.surface })

-- Syntax
hi("Comment",      { fg = c.brown, italic = true })
hi("Constant",     { fg = c.khaki })
hi("String",       { fg = c.peru })
hi("Character",    { fg = c.peru })
hi("Number",       { fg = c.gold })
hi("Boolean",      { fg = c.gold, bold = true })
hi("Float",        { fg = c.gold })

hi("Identifier",   { fg = c.darkkhaki })
hi("Function",     { fg = c.tomato })
hi("Statement",    { fg = c.gold })
hi("Conditional",  { fg = c.gold, bold = true })
hi("Repeat",       { fg = c.gold, bold = true })
hi("Label",        { fg = c.tomato })
hi("Operator",     { fg = c.fg })
hi("Keyword",      { fg = c.gold, bold = true })
hi("Exception",    { fg = c.tomato, bold = true })

hi("PreProc",      { fg = c.violet })
hi("Include",      { fg = c.violet })
hi("Define",       { fg = c.violet })
hi("Macro",        { fg = c.violet })
hi("PreCondit",    { fg = c.violet })

hi("Type",         { fg = c.gold })
hi("StorageClass", { fg = c.gold, italic = true })
hi("Structure",    { fg = c.gold })
hi("Typedef",      { fg = c.gold })

hi("Special",      { fg = c.tomato })
hi("SpecialChar",  { fg = c.tomato })
hi("Tag",          { fg = c.tomato })
hi("Delimiter",    { fg = c.darkkhaki })
hi("SpecialComment", { fg = c.spring })
hi("Underlined",   { fg = c.khaki, underline = true })
hi("Error",        { fg = c.red, undercurl = true })
hi("Todo",         { fg = c.bg, bg = c.gold, bold = true })

-- Treesitter
local treesitter = {
  ["@comment"]              = "Comment",
  ["@string"]               = "String",
  ["@string.escape"]        = "SpecialChar",
  ["@string.special"]       = "Special",
  ["@character"]            = "Character",
  ["@number"]               = "Number",
  ["@number.float"]         = "Float",
  ["@boolean"]              = "Boolean",

  ["@constant"]             = "Constant",
  ["@constant.builtin"]     = "Constant",
  ["@constant.macro"]       = "Macro",

  ["@variable"]             = "Identifier",
  ["@variable.builtin"]     = "Special",
  ["@variable.parameter"]   = "Identifier",
  ["@variable.member"]      = "Identifier",

  ["@function"]             = "Function",
  ["@function.call"]        = "Function",
  ["@function.builtin"]     = "Special",
  ["@function.method"]      = "Function",
  ["@function.macro"]       = "Macro",

  ["@constructor"]          = "Type",
  ["@type"]                 = "Type",
  ["@type.builtin"]         = "Type",
  ["@type.definition"]      = "Typedef",
  ["@attribute"]            = "PreProc",
  ["@property"]             = "Identifier",

  ["@keyword"]              = "Keyword",
  ["@keyword.function"]     = "Keyword",
  ["@keyword.operator"]     = "Operator",
  ["@keyword.return"]       = "Keyword",
  ["@conditional"]          = "Conditional",
  ["@repeat"]               = "Repeat",
  ["@exception"]            = "Exception",
  ["@operator"]             = "Operator",

  ["@punctuation"]          = "Delimiter",
  ["@punctuation.bracket"]  = "Delimiter",
  ["@punctuation.delimiter"] = "Delimiter",
  ["@punctuation.special"]  = "Special",

  ["@tag"]                  = "Tag",
  ["@tag.attribute"]        = "Identifier",
  ["@tag.delimiter"]        = "Delimiter",

  ["@markup.heading"]       = "Title",
  ["@markup.strong"]        = { fg = c.gold, bold = true },
  ["@markup.italic"]        = { fg = c.fg, italic = true },
  ["@markup.link"]          = { fg = c.tomato, underline = true },
  ["@markup.link.url"]      = { fg = c.peru, underline = true },
  ["@markup.raw"]           = "String",
  ["@markup.list"]          = "Keyword",
  ["@markup.quote"]         = "Comment",

  ["@diff.plus"]            = { fg = c.spring },
  ["@diff.minus"]           = { fg = c.tomato },
  ["@diff.delta"]           = { fg = c.gold },
}

for group, target in pairs(treesitter) do
  if type(target) == "string" then
    link(group, target)
  else
    hi(group, target)
  end
end

-- LSP semantic tokens
local semantic = {
  ["@lsp.type.class"]       = "Type",
  ["@lsp.type.enum"]        = "Type",
  ["@lsp.type.interface"]   = "Type",
  ["@lsp.type.struct"]      = "Structure",
  ["@lsp.type.type"]        = "Type",
  ["@lsp.type.parameter"]   = "Identifier",
  ["@lsp.type.property"]    = "Identifier",
  ["@lsp.type.variable"]    = "Identifier",
  ["@lsp.type.function"]    = "Function",
  ["@lsp.type.method"]      = "Function",
  ["@lsp.type.keyword"]     = "Keyword",
  ["@lsp.type.namespace"]   = "Type",
  ["@lsp.type.macro"]       = "Macro",
}

for group, target in pairs(semantic) do
  link(group, target)
end

-- Diagnostics
hi("DiagnosticError",          { fg = c.red })
hi("DiagnosticWarn",           { fg = c.gold })
hi("DiagnosticInfo",           { fg = c.darkkhaki })
hi("DiagnosticHint",           { fg = c.spring })
hi("DiagnosticOk",             { fg = c.spring })

hi("DiagnosticVirtualTextError", { fg = c.tomato, bg = c.surface })
hi("DiagnosticVirtualTextWarn",  { fg = c.gold, bg = c.surface })
hi("DiagnosticVirtualTextInfo",  { fg = c.darkkhaki, bg = c.surface })
hi("DiagnosticVirtualTextHint",  { fg = c.spring, bg = c.surface })

hi("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.gold })
hi("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.darkkhaki })
hi("DiagnosticUnderlineHint",  { undercurl = true, sp = c.spring })

hi("LspReferenceText",  { bg = c.surface2 })
hi("LspReferenceRead",  { bg = c.surface2 })
hi("LspReferenceWrite", { bg = c.surface2, underline = true })
hi("LspInlayHint",      { fg = c.muted, italic = true })
hi("LspCodeLens",       { fg = c.muted, italic = true })

-- Completion / popup menu
hi("Pmenu",       { fg = c.fg, bg = c.surface })
hi("PmenuSel",    { fg = c.bg, bg = c.gold, bold = true })
hi("PmenuSbar",   { bg = c.surface2 })
hi("PmenuThumb",  { bg = c.peru })
hi("PmenuKind",   { fg = c.darkkhaki, bg = c.surface })
hi("PmenuKindSel",{ fg = c.bg, bg = c.gold })
hi("PmenuExtra",  { fg = c.muted, bg = c.surface })
hi("PmenuExtraSel", { fg = c.bg, bg = c.gold })

-- Folding / diff
hi("Folded",      { fg = c.peru, bg = c.surface })
hi("FoldColumn",  { fg = c.brown })
hi("DiffAdd",     { fg = c.spring, bg = "#07140b" })
hi("DiffChange",  { fg = c.gold, bg = "#171204" })
hi("DiffDelete",  { fg = c.tomato, bg = "#1b0804" })
hi("DiffText",    { fg = c.yellow, bg = "#302000", bold = true })

-- Git signs
hi("GitSignsAdd",    { fg = c.spring })
hi("GitSignsChange", { fg = c.gold })
hi("GitSignsDelete", { fg = c.tomato })

-- Tabs / windows
hi("WinSeparator", { fg = c.border })
hi("VertSplit",    { fg = c.border })
hi("TabLine",      { fg = c.muted, bg = c.surface })
hi("TabLineFill",  { bg = c.bg })
hi("TabLineSel",   { fg = c.gold, bg = c.bg, bold = true })
hi("WinBar",       { fg = c.muted, bg = c.bg })
hi("WinBarNC",    { fg = c.subtle, bg = c.bg })

-- Statusline defaults
hi("StatusLine",   { fg = c.bg, bg = c.brown })
hi("StatusLineNC", { fg = c.muted, bg = c.surface })
hi("StatusLineTerm",   { fg = c.bg, bg = c.gold })
hi("StatusLineTermNC", { fg = c.muted, bg = c.surface })

-- Telescope
hi("TelescopeNormal",       { fg = c.fg, bg = c.surface })
hi("TelescopeBorder",       { fg = c.brown, bg = c.surface })
hi("TelescopePromptNormal", { fg = c.fg, bg = c.surface2 })
hi("TelescopePromptBorder", { fg = c.gold, bg = c.surface2 })
hi("TelescopePromptTitle",  { fg = c.bg, bg = c.gold, bold = true })
hi("TelescopePreviewTitle", { fg = c.bg, bg = c.peru, bold = true })
hi("TelescopeResultsTitle", { fg = c.bg, bg = c.tomato, bold = true })
hi("TelescopeSelection",   { fg = c.gold, bg = c.surface2, bold = true })
hi("TelescopeMatching",    { fg = c.tomato, bold = true })

-- Neo-tree / NvimTree
hi("NeoTreeNormal",       { fg = c.fg, bg = c.surface })
hi("NeoTreeDirectoryName",{ fg = c.gold })
hi("NeoTreeDirectoryIcon",{ fg = c.peru })
hi("NeoTreeGitAdded",     { fg = c.spring })
hi("NeoTreeGitModified",  { fg = c.gold })
hi("NeoTreeGitDeleted",   { fg = c.tomato })
hi("NvimTreeNormal",      { fg = c.fg, bg = c.surface })
hi("NvimTreeFolderName",  { fg = c.gold })
hi("NvimTreeFolderIcon",  { fg = c.peru })

-- Which-key
hi("WhichKey",          { fg = c.gold })
hi("WhichKeyGroup",     { fg = c.tomato })
hi("WhichKeyDesc",      { fg = c.fg })
hi("WhichKeySeparator", { fg = c.brown })
hi("WhichKeyFloat",     { bg = c.surface })
hi("WhichKeyBorder",    { fg = c.brown, bg = c.surface })

-- Indent guides
hi("IblIndent",      { fg = c.surface2 })
hi("IblScope",       { fg = c.brown })
hi("IndentBlanklineChar",      { fg = c.surface2 })
hi("IndentBlanklineContextChar",{ fg = c.brown })

-- Mini.nvim
hi("MiniStatuslineFilename", { fg = c.fg, bg = c.surface2 })
hi("MiniStatuslineDevinfo",  { fg = c.darkkhaki, bg = c.surface2 })
hi("MiniStatuslineFileinfo", { fg = c.peru, bg = c.surface2 })
hi("MiniStatuslineModeNormal", { fg = c.bg, bg = c.gold, bold = true })
hi("MiniStatuslineModeInsert", { fg = c.bg, bg = c.spring, bold = true })
hi("MiniStatuslineModeVisual", { fg = c.bg, bg = c.violet, bold = true })
hi("MiniStatuslineModeCommand", { fg = c.bg, bg = c.tomato, bold = true })
