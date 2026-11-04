vim.opt.termguicolors = true
vim.g.colors_name = "findspot-knossos"

local c = {
  bg       = "#FAEBD7",
  fg       = "#8B4513",

  brown    = "#8B4513",
  sienna   = "#A0522D",
  peru     = "#CD853F",
  tan      = "#D2B48C",

  tomato   = "#FF6347",
  red      = "#E34234",
  pure_red = "#FF0000",

  gold     = "#DAA520",
  yellow   = "#FFD700",

  purple   = "#800080",
  indigo   = "#4B0082",
  magenta  = "#C71585",
  coral    = "#FF7F50",
  indianred = "#CD5C5C",

  surface  = "#FAEBD7",
  border   = "#D2B48C",
  muted    = "#A0522D",
  selection = "#8B4513",
}

local function hi(group, spec)
  vim.api.nvim_set_hl(0, group, spec)
end

local function link(group, target)
  hi(group, { link = target })
end

-- Terminal
vim.g.terminal_color_0  = c.brown
vim.g.terminal_color_1  = c.red
vim.g.terminal_color_2  = c.indianred
vim.g.terminal_color_3  = c.gold
vim.g.terminal_color_4  = c.purple
vim.g.terminal_color_5  = c.magenta
vim.g.terminal_color_6  = c.coral
vim.g.terminal_color_7  = c.bg
vim.g.terminal_color_8  = c.sienna
vim.g.terminal_color_9  = c.pure_red
vim.g.terminal_color_10 = c.tomato
vim.g.terminal_color_11 = c.yellow
vim.g.terminal_color_12 = c.indigo
vim.g.terminal_color_13 = "#FF00FF"
vim.g.terminal_color_14 = "#FF4500"
vim.g.terminal_color_15 = "#FFFFFF"

-- Editor
hi("Normal",       { fg = c.fg, bg = c.bg })
hi("NormalNC",     { fg = c.fg, bg = c.bg })
hi("NormalFloat",  { fg = c.fg, bg = c.bg })
hi("FloatBorder",  { fg = c.brown, bg = c.bg })
hi("FloatTitle",   { fg = c.gold, bg = c.bg, bold = true })
hi("EndOfBuffer",  { fg = c.bg })
hi("NonText",      { fg = c.sienna })
hi("Whitespace",   { fg = c.sienna })
hi("SpecialKey",   { fg = c.peru })

hi("Cursor",       { fg = c.bg, bg = c.pure_red })
hi("lCursor",      { fg = c.bg, bg = c.pure_red })
hi("CursorIM",     { fg = c.bg, bg = c.pure_red })
hi("CursorLine",   { bg = c.bg })
hi("CursorColumn", { bg = c.bg })
hi("CursorLineNr", { fg = c.tomato, bold = true })
hi("LineNr",       { fg = c.sienna })
hi("SignColumn",   { fg = c.peru, bg = c.bg })
hi("ColorColumn",  { bg = c.bg })

hi("Visual",       { fg = c.bg, bg = c.brown })
hi("VisualNOS",    { fg = c.bg, bg = c.brown })
hi("Search",       { fg = c.brown, bg = c.gold, bold = true })
hi("IncSearch",    { fg = c.bg, bg = c.tomato, bold = true })
hi("CurSearch",    { fg = c.bg, bg = c.red, bold = true })
hi("Substitute",   { fg = c.bg, bg = c.tomato, bold = true })

hi("MatchParen",   { fg = c.pure_red, bold = true, underline = true })
hi("Directory",    { fg = c.peru })
hi("Title",        { fg = c.peru, bold = true })
hi("Question",     { fg = c.tomato })
hi("MoreMsg",      { fg = c.tomato })
hi("WarningMsg",   { fg = c.gold })
hi("ErrorMsg",     { fg = c.red, bold = true })
hi("ModeMsg",      { fg = c.gold })
hi("MsgArea",      { fg = c.fg })
hi("MsgSeparator", { fg = c.sienna, bg = c.bg })

-- Syntax
hi("Comment",      { fg = c.sienna, italic = true })

hi("Constant",     { fg = c.magenta })
hi("String",       { fg = c.peru })
hi("Character",    { fg = c.peru })
hi("Number",       { fg = c.red })
hi("Boolean",      { fg = c.red })
hi("Float",        { fg = c.red })

hi("Identifier",   { fg = c.brown })
hi("Function",     { fg = c.tomato })

hi("Statement",    { fg = c.purple })
hi("Conditional",  { fg = c.purple })
hi("Repeat",       { fg = c.purple })
hi("Label",        { fg = c.magenta })
hi("Operator",     { fg = c.brown })
hi("Keyword",      { fg = c.purple, bold = true })
hi("Exception",    { fg = c.red })

hi("PreProc",      { fg = c.indigo })
hi("Include",      { fg = c.indigo })
hi("Define",       { fg = c.indigo })
hi("Macro",        { fg = c.indigo })
hi("PreCondit",    { fg = c.indigo })

hi("Type",         { fg = c.gold })
hi("StorageClass", { fg = c.gold })
hi("Structure",    { fg = c.gold })
hi("Typedef",      { fg = c.gold })

hi("Special",      { fg = c.tomato })
hi("SpecialChar",  { fg = c.tomato })
hi("Tag",          { fg = c.tomato })
hi("Delimiter",    { fg = c.brown })
hi("SpecialComment", { fg = c.tomato })
hi("Underlined",   { fg = c.tomato, underline = true })
hi("Error",        { fg = c.red, undercurl = true })
hi("Todo",         { fg = c.bg, bg = c.brown, bold = true })

-- Treesitter
local treesitter = {
  ["@comment"] = "Comment",
  ["@string"] = "String",
  ["@string.escape"] = "SpecialChar",
  ["@string.special"] = "Special",
  ["@character"] = "Character",
  ["@number"] = "Number",
  ["@number.float"] = "Float",
  ["@boolean"] = "Boolean",

  ["@constant"] = "Constant",
  ["@constant.builtin"] = "Constant",
  ["@constant.macro"] = "Macro",

  ["@variable"] = "Identifier",
  ["@variable.builtin"] = "Special",
  ["@variable.parameter"] = "Identifier",
  ["@variable.member"] = "Identifier",

  ["@function"] = "Function",
  ["@function.call"] = "Function",
  ["@function.builtin"] = "Special",
  ["@function.method"] = "Function",
  ["@function.macro"] = "Macro",

  ["@constructor"] = "Type",
  ["@type"] = "Type",
  ["@type.builtin"] = "Type",
  ["@type.definition"] = "Typedef",
  ["@attribute"] = "PreProc",
  ["@property"] = "Identifier",

  ["@keyword"] = "Keyword",
  ["@keyword.function"] = "Keyword",
  ["@keyword.operator"] = "Operator",
  ["@keyword.return"] = "Keyword",
  ["@conditional"] = "Conditional",
  ["@repeat"] = "Repeat",
  ["@exception"] = "Exception",
  ["@operator"] = "Operator",

  ["@punctuation"] = "Delimiter",
  ["@punctuation.bracket"] = "Delimiter",
  ["@punctuation.delimiter"] = "Delimiter",
  ["@punctuation.special"] = "Special",

  ["@tag"] = "Tag",
  ["@tag.attribute"] = "Identifier",
  ["@tag.delimiter"] = "Delimiter",

  ["@markup.heading"] = { fg = c.peru, bold = true },
  ["@markup.strong"] = { fg = c.gold, bold = true },
  ["@markup.italic"] = { fg = c.purple, italic = true },
  ["@markup.link"] = { fg = c.tomato, underline = true },
  ["@markup.link.url"] = { fg = c.tomato, underline = true },
  ["@markup.raw"] = "String",
  ["@markup.list"] = { fg = c.purple },
  ["@markup.quote"] = "Comment",

  ["@diff.plus"] = { fg = c.indianred },
  ["@diff.minus"] = { fg = c.tomato },
  ["@diff.delta"] = { fg = c.gold },
}

for group, target in pairs(treesitter) do
  if type(target) == "string" then
    link(group, target)
  else
    hi(group, target)
  end
end

-- LSP
local semantic = {
  ["@lsp.type.class"] = "Type",
  ["@lsp.type.enum"] = "Type",
  ["@lsp.type.interface"] = "Type",
  ["@lsp.type.struct"] = "Structure",
  ["@lsp.type.type"] = "Type",
  ["@lsp.type.parameter"] = "Identifier",
  ["@lsp.type.property"] = "Identifier",
  ["@lsp.type.variable"] = "Identifier",
  ["@lsp.type.function"] = "Function",
  ["@lsp.type.method"] = "Function",
  ["@lsp.type.keyword"] = "Keyword",
  ["@lsp.type.namespace"] = "Type",
  ["@lsp.type.macro"] = "Macro",
}

for group, target in pairs(semantic) do
  link(group, target)
end

-- Diagnostics
hi("DiagnosticError", { fg = c.red })
hi("DiagnosticWarn",  { fg = c.gold })
hi("DiagnosticInfo",  { fg = c.purple })
hi("DiagnosticHint",  { fg = c.peru })
hi("DiagnosticOk",    { fg = c.tomato })

hi("DiagnosticVirtualTextError", { fg = c.red })
hi("DiagnosticVirtualTextWarn",  { fg = c.gold })
hi("DiagnosticVirtualTextInfo",  { fg = c.purple })
hi("DiagnosticVirtualTextHint",  { fg = c.peru })

hi("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.gold })
hi("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.purple })
hi("DiagnosticUnderlineHint",  { undercurl = true, sp = c.peru })

hi("LspReferenceText",  { bg = c.selection })
hi("LspReferenceRead",  { bg = c.selection })
hi("LspReferenceWrite", { bg = c.selection, underline = true })
hi("LspInlayHint",      { fg = c.sienna, italic = true })
hi("LspCodeLens",       { fg = c.sienna, italic = true })

-- Completion
hi("Pmenu",        { fg = c.fg, bg = c.bg })
hi("PmenuSel",     { fg = c.bg, bg = c.brown, bold = true })
hi("PmenuSbar",    { bg = c.bg })
hi("PmenuThumb",   { bg = c.peru })
hi("PmenuKind",    { fg = c.gold, bg = c.bg })
hi("PmenuKindSel", { fg = c.bg, bg = c.brown })
hi("PmenuExtra",   { fg = c.sienna, bg = c.bg })
hi("PmenuExtraSel",{ fg = c.bg, bg = c.brown })

-- Folding / diff
hi("Folded",      { fg = c.sienna, bg = c.bg })
hi("FoldColumn",  { fg = c.sienna })
hi("DiffAdd",     { fg = c.indianred })
hi("DiffChange",  { fg = c.gold })
hi("DiffDelete",  { fg = c.tomato })
hi("DiffText",    { fg = c.red, bold = true })

-- Git signs
hi("GitSignsAdd",    { fg = c.indianred })
hi("GitSignsChange", { fg = c.gold })
hi("GitSignsDelete", { fg = c.tomato })

-- Windows / tabs
hi("WinSeparator", { fg = c.tan })
hi("VertSplit",    { fg = c.tan })
hi("TabLine",      { fg = c.sienna, bg = c.bg })
hi("TabLineFill",  { bg = c.bg })
hi("TabLineSel",   { fg = c.brown, bg = c.bg, bold = true })
hi("WinBar",       { fg = c.sienna, bg = c.bg })
hi("WinBarNC",     { fg = c.sienna, bg = c.bg })

-- Statusline
hi("StatusLine",   { fg = c.bg, bg = c.brown })
hi("StatusLineNC", { fg = c.sienna, bg = c.bg })
hi("StatusLineTerm",   { fg = c.bg, bg = c.tomato })
hi("StatusLineTermNC", { fg = c.sienna, bg = c.bg })

-- Telescope
hi("TelescopeNormal",       { fg = c.fg, bg = c.bg })
hi("TelescopeBorder",       { fg = c.brown, bg = c.bg })
hi("TelescopePromptNormal", { fg = c.fg, bg = c.bg })
hi("TelescopePromptBorder", { fg = c.brown, bg = c.bg })
hi("TelescopePromptTitle",  { fg = c.bg, bg = c.brown, bold = true })
hi("TelescopePreviewTitle", { fg = c.bg, bg = c.peru, bold = true })
hi("TelescopeResultsTitle", { fg = c.bg, bg = c.tomato, bold = true })
hi("TelescopeSelection",    { fg = c.bg, bg = c.brown })
hi("TelescopeMatching",     { fg = c.tomato, bold = true })

-- File explorers
hi("NeoTreeNormal",        { fg = c.fg, bg = c.bg })
hi("NeoTreeDirectoryName", { fg = c.peru })
hi("NeoTreeDirectoryIcon", { fg = c.sienna })
hi("NeoTreeGitAdded",      { fg = c.indianred })
hi("NeoTreeGitModified",   { fg = c.gold })
hi("NeoTreeGitDeleted",    { fg = c.tomato })

hi("NvimTreeNormal",       { fg = c.fg, bg = c.bg })
hi("NvimTreeFolderName",   { fg = c.peru })
hi("NvimTreeFolderIcon",   { fg = c.sienna })

-- Which-key
hi("WhichKey",          { fg = c.gold })
hi("WhichKeyGroup",     { fg = c.tomato })
hi("WhichKeyDesc",      { fg = c.fg })
hi("WhichKeySeparator", { fg = c.sienna })
hi("WhichKeyFloat",     { bg = c.bg })
hi("WhichKeyBorder",    { fg = c.brown, bg = c.bg })

-- Indent guides
hi("IblIndent",                 { fg = c.bg })
hi("IblScope",                  { fg = c.peru })
hi("IndentBlanklineChar",       { fg = c.bg })
hi("IndentBlanklineContextChar",{ fg = c.peru })

-- Mini.nvim
hi("MiniStatuslineFilename",   { fg = c.fg, bg = c.bg })
hi("MiniStatuslineDevinfo",    { fg = c.sienna, bg = c.bg })
hi("MiniStatuslineFileinfo",   { fg = c.peru, bg = c.bg })
hi("MiniStatuslineModeNormal", { fg = c.bg, bg = c.brown, bold = true })
hi("MiniStatuslineModeInsert", { fg = c.bg, bg = c.tomato, bold = true })
hi("MiniStatuslineModeVisual", { fg = c.bg, bg = c.purple, bold = true })
hi("MiniStatuslineModeCommand",{ fg = c.bg, bg = c.gold, bold = true })
