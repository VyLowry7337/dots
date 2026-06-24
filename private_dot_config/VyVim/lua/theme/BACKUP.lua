local M = {}

local config = require('vyrc')
local colors = require('theme.palettes.' .. config.theme.palette)
local transparent = config.theme.transparent
local bg = transparent and colors.none or colors.bg

M.base = {
  -- Editor
  Normal = { fg = colors.white, bg = bg },
  NormalFloat = { fg = colors.white, bg = bg },
  FloatBorder = { fg = colors.blue, bg = bg },
  WinSeparator = { fg = colors.bg2 },
  VertSplit = { fg = colors.border },
  SignColumn = { bg = bg },
  EndOfBuffer = { fg = colors.bg },
  Cursor = { bg = colors.rosewater, fg = colors.bg },
  CursorLine = { bg = bg },
  CursorColumn = { bg = bg },
  ColorColumn = { bg = bg },
  LineNr = { fg = colors.obsidian },
  CursorLineNr = { fg = colors.lavender },
  Visual = { bg = colors.charcoal },
  VisualNOS = { bg = colors.charcoal },

  -- Popup menu
  Pmenu = { fg = colors.white, bg = bg },
  PmenuSel = { fg = colors.bg, bg = colors.green },
  PmenuSbar = { bg = bg },
  PmenuThumb = { bg = colors.charcoal },

  -- Search
  Search = { bg = colors.mauve, fg = colors.black, bold = true, italic = true },
  IncSearch = { bg = colors.plum, fg = colors.black, bold = true, italic = true },
  Substitute = { bg = colors.blue, fg = colors.black, bold = true },
  MatchParen = { bg = colors.none, fg = colors.grape, bold = true, link = '' },

  -- Folds
  Folded = { fg = colors.comment, bg = bg },
  FoldColumn = { fg = colors.comment },

  -- Diff
  DiffAdd = { bg = '#2A304B' },
  DiffChange = { bg = '#384268' },
  DiffDelete = { bg = '#34232C' },
  DiffText = { bg = '#484466' },

  -- Messages
  ErrorMsg = { fg = colors.red },
  WarningMsg = { fg = colors.yellow },
  ModeMsg = { fg = colors.white, bold = true },
  MoreMsg = { fg = colors.green },
  Question = { fg = colors.green },

  -- Spelling
  SpellBad = { sp = colors.red, undercurl = true },
  SpellCap = { sp = colors.yellow, undercurl = true },
  SpellLocal = { sp = colors.blue, undercurl = true },
  SpellRare = { sp = colors.mauve, undercurl = true },

  -- Tabline (built-in)
  TabLine = { fg = colors.comment, bg = bg },
  TabLineFill = { bg = bg },
  TabLineSel = { fg = colors.white, bg = bg },

  -- Bufline (Gn*)
  GnTabFill = { bg = bg },
  GnBufOn = { fg = colors.white, bg = bg },
  GnBufOff = { fg = colors.comment, bg = bg },
  GnBufOnMod = { fg = colors.green, bg = bg },
  GnBufOffMod = { fg = colors.green, bg = bg },
  GnTabOn = { fg = colors.blue, bg = colors.blue, bold = true },
  GnTabOff = { fg = colors.comment, bg = bg },
  GnWinOn = { fg = colors.white, bg = bg },
  GnWinOff = { fg = colors.comment, bg = bg },

  -- Statusline
  StatusLine = { bg = bg, fg = colors.none },
  StatusLineNC = { bg = bg, fg = colors.none },

  -- Window
  WinBar = { bg = bg },
  WinBarNC = { bg = bg },

  -- Misc
  Directory = { fg = colors.blue },
  Title = { fg = colors.blue, bold = true },
  NonText = { fg = colors.charcoal },
  SpecialKey = { fg = colors.charcoal },
  Conceal = { fg = colors.comment },
}

-- Syntax highlights
M.syntax = {
  Comment = { fg = colors.comment, italic = true },
  Constant = { fg = colors.peach },
  String = { fg = colors.green },
  Character = { fg = colors.teal },
  Number = { fg = colors.peach },
  Boolean = { fg = colors.peach, italic = true },
  Float = { fg = colors.peach },

  Identifier = { fg = colors.flamingo },
  Function = { fg = colors.blue },

  Statement = { fg = colors.mauve },
  Conditional = { fg = colors.mauve },
  Repeat = { fg = colors.mauve },
  Label = { fg = colors.sapphire },
  Operator = { fg = colors.cyan },
  Keyword = { fg = colors.mauve, italic = true },
  Exception = { fg = colors.mauve },

  PreProc = { fg = colors.pink },
  Include = { fg = colors.mauve, italic = true },
  Define = { link = 'PreProc' },
  Macro = { fg = colors.mauve },
  PreCondit = { link = 'PreProc' },

  Type = { fg = colors.lemon, italic = true },
  StorageClass = { fg = colors.yellow, italic = true },
  Structure = { fg = colors.yellow, italic = true },
  Typedef = { link = 'Type' },

  Special = { fg = colors.pink },
  SpecialChar = { link = 'Special' },
  Tag = { fg = colors.lavender, bold = true },
  Delimiter = { fg = colors.overlay2 },
  SpecialComment = { link = 'Special' },
  Debug = { link = 'Special' },

  Underlined = { underline = false },
  Bold = { bold = true },
  Italic = { italic = true },
  Ignore = {},
  Error = { fg = colors.red },
  Todo = { fg = colors.flaminga, bold = true },
}

M.treesitter = {
  ['@variable'] = { fg = colors.white },
  ['@variable.builtin'] = { fg = colors.red },
  ['@variable.parameter'] = { fg = colors.maroon },
  ['@variable.member'] = { fg = colors.grape },
  -- ['@variable.member.key'] = { fg = colors.sky },

  ['@module'] = { fg = colors.yellow, italic = true },
  ['@label'] = { link = 'Label' },

  ['@constant'] = { link = 'Constant' },
  ['@constant.builtin'] = { fg = colors.peach },
  ['@constant.macro'] = { link = 'Macro' },

  ['@string'] = { link = 'String' },
  ['@string.documentation'] = { fg = colors.teal, italic = true },
  ['@string.regex'] = { fg = colors.pink },
  ['@string.escape'] = { fg = colors.pink },
  ['@string.special'] = { link = 'Special' },
  ['@string.special.path'] = { link = 'Special' },
  ['@string.special.symbol'] = { fg = colors.flamingo },
  ['@string.special.url'] = { fg = colors.blue },
  ['@punctuation.delimiter.regex'] = { link = '@string.regexp' },

  ['@character'] = { link = 'Character' },
  ['@character.special'] = { link = 'SpecialChar' },

  ['@boolean'] = { link = 'Boolean' },
  ['@number'] = { link = 'Number' },
  ['@number.float'] = { link = 'Float' },

  ['@type'] = { link = 'Type' },
  ['@type.builtin'] = { fg = colors.mauve, italic = true },
  ['@type.definition'] = { link = 'Type' },

  ['@annotation'] = { fg = colors.yellow },
  ['@attribute'] = { link = 'Constant' },
  ['@property'] = { fg = colors.peach },
  ['@error'] = { fg = colors.red },

  ['@keyword'] = { link = 'Keyword' },
  ['@keyword.function'] = { link = 'Keyword' },
  ['@keyword.return'] = { link = 'Keyword' },
  ['@keyword.operator'] = { link = 'Keyword' },
  ['@keyword.import'] = { link = 'Keyword' },
  ['@keyword.conditional'] = { link = 'Conditional' },
  ['@keyword.conditional.ternary'] = { link = 'Operator' },
  ['@keyword.repeat'] = { link = 'Repeat' },
  ['@keyword.storage'] = { link = 'Keyword' },
  ['@keyword.directive'] = { link = 'PreProc' },
  ['@keyword.directive.define'] = { link = 'Define' },
  ['@keyword.exception'] = { link = 'Exception' },

  ['@function'] = { link = 'Function' },
  ['@function.builtin'] = { fg = colors.peach },
  ['@function.macro'] = { fg = colors.pink },
  ['@function.call'] = { link = 'Function' },
  ['@function.method'] = { link = 'Function' },
  ['@function.method.call'] = { link = 'Function' },

  ['@constructor'] = { fg = colors.yellow },
  ['@operator'] = { link = 'Operator' },

  ['@reference'] = { fg = colors.white },
  ['@punctuation.bracket'] = { fg = colors.overlay2 },
  ['@punctuation.delimiter'] = { link = 'Delimiter' },
  ['@punctuation.special'] = { link = 'Special' },
  ['@symbol'] = { fg = colors.green },
  ['@tag'] = { fg = colors.blue },
  ['@tag.attribute'] = { fg = colors.yellow, italic = true },
  ['@tag.delimiter'] = { fg = colors.teal },
  ['@tag.builtin'] = { fg = colors.blue },
  ['@text'] = { fg = colors.white },
  ['@text.emphasis'] = { fg = colors.mauve, italic = true },
  ['@text.strike'] = { fg = colors.comment, strikethrough = true },
  ['@definition'] = { sp = colors.comment, underline = false },
  ['@scope'] = { bold = true },

  RenderMarkdownCode = { bg = colors.overlay1 },
  RenderMarkdownCodeBorder = { bg = colors.bg_tab_off },
  RenderMarkdownCodeInline = { bg = colors.code_block },
  RenderMarkdownH1 = { fg = colors.red },
  RenderMarkdownH2 = { fg = colors.peach },
  RenderMarkdownH3 = { fg = colors.yellow },
  RenderMarkdownH4 = { fg = colors.green },
  RenderMarkdownH5 = { fg = colors.sapphire },
  RenderMarkdownH6 = { fg = colors.lavender },
  RenderMarkdownH1Bg = { fg = colors.bg, bg = colors.red },
  RenderMarkdownH2Bg = { fg = colors.bg, bg = colors.peach },
  RenderMarkdownH3Bg = { fg = colors.bg, bg = colors.yellow },
  RenderMarkdownH4Bg = { fg = colors.bg, bg = colors.green },
  RenderMarkdownH5Bg = { fg = colors.bg, bg = colors.sapphire },
  RenderMarkdownH6Bg = { fg = colors.bg, bg = colors.lavender },
  RenderMarkdownBullet = { fg = colors.sky },
  RenderMarkdownTableHead = { fg = colors.navy },
  RenderMarkdownTableRow = { fg = colors.lavender },
  RenderMarkdownSuccess = { fg = colors.green },
  RenderMarkdownInfo = { fg = colors.sky },
  RenderMarkdownHint = { fg = colors.teal },
  RenderMarkdownWarn = { fg = colors.yellow },
  RenderMarkdownError = { fg = colors.red },
  ['@markup.heading'] = { fg = colors.peach, bold = true },
  ['@markup.heading.1'] = { fg = colors.red, bold = true },
  ['@markup.heading.2'] = { fg = colors.peach, bold = true },
  ['@markup.heading.3'] = { fg = colors.yellow, bold = true },
  ['@markup.heading.4'] = { fg = colors.green, bold = true },
  ['@markup.heading.5'] = { fg = colors.sapphire, bold = true },
  ['@markup.heading.6'] = { fg = colors.lavender, bold = true },
  ['@markup.strong'] = { fg = colors.red, bold = true },
  ['@markup.italic'] = { fg = colors.red, italic = true },
  ['@markup.list'] = { fg = colors.teal },
  ['@markup.list.checked'] = { fg = colors.green },
  ['@markup.list.unchecked'] = { fg = colors.overlay1 },
  ['@markup.raw'] = { fg = colors.green },
  ['@markup.quote'] = { fg = colors.pink },
  ['@markup'] = { fg = colors.white },
  ['@markup.math'] = { fg = colors.blue },
  ['@markup.environment'] = { fg = colors.pink },
  ['@markup.environment.name'] = { fg = colors.blue },
  ['@markup.link'] = { fg = colors.lavender },
  ['@markup.link.label'] = { fg = colors.lavender },
  ['@markup.link.url'] = { fg = colors.blue, italic = true, underline = true },

  ['@comment'] = { fg = colors.comment, italic = true },
  ['@comment.todo'] = { fg = colors.bg, bg = colors.yellow, bold = true },
  ['@comment.warning'] = { fg = colors.bg, bg = colors.peach, italic = true },
  ['@comment.note'] = { fg = colors.bg, bg = colors.sapphire, italic = true },
  ['@comment.danger'] = { fg = colors.bg, bg = colors.red, italic = true },

  ['@diff.plus'] = { fg = colors.green },
  ['@diff.minus'] = { fg = colors.red },
  ['@diff.delta'] = { fg = colors.peach },

  -- Python
  ['@constructor.python'] = { fg = colors.sky },
  ['@type.python'] = { link = 'Type' },
  ['@module.python'] = { link = '@module' },
  ['@function.call.python'] = { link = 'Function' },
  ['@attribute.python'] = { link = 'Constant' },
  ['@operator.python'] = { link = 'Operator' },
  ['@string.python'] = { link = 'String' },
  ['@string.documentation.python'] = { link = '@string.documentation' },

  -- CSS
  ['@property.css'] = { fg = colors.blue },
  ['@property.scss'] = { fg = colors.blue },
  ['@property.id.css'] = { fg = colors.yellow },
  ['@property.class.css'] = { fg = colors.yellow },
  ['@type.css'] = { fg = colors.lavender },
  ['@type.tag.css'] = { fg = colors.blue },
  ['@string.plain.css'] = { fg = colors.text },
  ['@number.css'] = { fg = colors.peach },
  ['@keyword.directive.css'] = { link = 'Keyword' },
}

M.lazy = {
  LazyH1 = { bg = colors.green, fg = colors.black },
  LazyH2 = { fg = colors.red, bold = true, underline = false },
  LazyButton = { bg = colors.border, fg = colors.charcoal },
  LazyReasonPlugin = { fg = colors.red },
  LazyValue = { fg = colors.teal },
  LazyDir = { fg = colors.white },
  LazyUrl = { fg = colors.white },
  LazyCommit = { fg = colors.green },
  LazyNoCond = { fg = colors.red },
  LazySpecial = { fg = colors.blue },
  LazyReasonFt = { fg = colors.fuchsia },
  LazyOperator = { fg = colors.white },
  LazyReasonKeys = { fg = colors.teal },
  LazyTaskOutput = { fg = colors.white },
  LazyCommitIssue = { fg = colors.peach },
  LazyReasonEvent = { fg = colors.yellow },
  LazyReasonStart = { fg = colors.white },
  LazyReasonRuntime = { fg = colors.navy },
  LazyReasonCmd = { fg = colors.yellow },
  LazyReasonSource = { fg = colors.cyan },
  LazyReasonImport = { fg = colors.white },
  LazyProgressDone = { fg = colors.green },
}

M.mason = {
  MasonNormal = { fg = colors.white, bg = bg },
  MasonHeader = { bg = colors.green, fg = colors.black, bold = true },
  MasonHeaderSecondary = { bg = colors.blue, fg = colors.black, bold = true },
  MasonHighlight = { fg = colors.blue },
  MasonHighlightBlock = { bg = colors.blue, fg = colors.black },
  MasonHighlightBlockBold = { bg = colors.blue, fg = colors.black, bold = true },
  MasonHighlightSecondary = { fg = colors.yellow },
  MasonHighlightBlockSecondary = { bg = colors.yellow, fg = colors.black },
  MasonHighlightBlockBoldSecondary = { bg = colors.yellow, fg = colors.black, bold = true },
  MasonMuted = { fg = colors.comment },
  MasonMutedBlock = { bg = colors.charcoal, fg = colors.white },
  MasonMutedBlockBold = { bg = colors.charcoal, fg = colors.white, bold = true },
  MasonError = { fg = colors.red },
  MasonWarning = { fg = colors.yellow },
  MasonHeading = { bold = true },
}

M.misc = {
  Added = { fg = colors.green },
  Removed = { fg = colors.red },
  Changed = { fg = colors.yellow },
  MatchWord = { bg = colors.charcoal, fg = colors.white },
  QuickFixLine = { bg = bg },
  healthSuccess = { bg = colors.green, fg = colors.black },
  NvimInternalError = { fg = colors.red },
  DevIconDefault = { fg = colors.red },
  FloatTitle = { fg = colors.white, bg = colors.charcoal },
}

local stl_style = config.style or 'compact'

local stl_compact = {
  GnNormalMode = { fg = colors.green, bold = true },
  GnVisualMode = { fg = colors.blue, bold = true },
  GnInsertMode = { fg = colors.lavender, bold = true },
  GnTerminalMode = { fg = colors.green, bold = true },
  GnNTerminalMode = { fg = colors.yellow, bold = true },
  GnReplaceMode = { fg = colors.orange, bold = true },
  GnConfirmMode = { fg = colors.teal, bold = true },
  GnCommandMode = { fg = colors.orange, bold = true },
  GnSelectMode = { fg = colors.blue, bold = true },

  GnTelescopeMode = { fg = colors.yellow, bold = true },
  GnExplorerMode = { fg = colors.cyan, bold = true },
  GnLazyGitMode = { fg = colors.cyan, bold = true },
  GnLazyNvimMode = { fg = colors.mauve, bold = true },

  GnFile = { fg = colors.white },
  GnFileIcon = { fg = colors.white },

  GnGitIcon = { fg = colors.plum },
  GnGitText = { fg = colors.white },
  GnLsp = { fg = colors.navy },
  GnLspMsg = { fg = colors.green },

  GnLspIcon = { fg = colors.navy },
  GnLspText = { fg = colors.white },
  GnCwdIcon = { fg = colors.peach },
  GnCwdText = { fg = colors.white },
  GnCursorIcon = { fg = colors.orange },
  GnCursorText = { fg = colors.white },
  GnFolderIcon = { fg = colors.red },
  GnFolderText = { fg = colors.white },
  GnQfIcon = { fg = colors.mauve },
  GnQfText = { fg = colors.gray },

  GnLspError = { fg = colors.red },
  GnLspWarning = { fg = colors.yellow },
  GnLspHints = { fg = colors.fuchsia },
  GnLspInfo = { fg = colors.green },
  GnLspProgress = { fg = colors.charcoal },

  SnacksPickerTitle = { fg = colors.red, bold = true },
  SnacksPickerInputTitle = { fg = colors.red, bold = true },
  SnacksPickerPreviewTitle = { fg = colors.green, bold = true },
}

local stl_block = {
  GnNormalMode = { bg = colors.green, fg = colors.black, bold = true },
  GnVisualMode = { bg = colors.blue, fg = colors.black, bold = true },
  GnInsertMode = { bg = colors.lavender, fg = colors.black, bold = true },
  GnTerminalMode = { bg = colors.green, fg = colors.black, bold = true },
  GnNTerminalMode = { bg = colors.yellow, fg = colors.black, bold = true },
  GnReplaceMode = { bg = colors.orange, fg = colors.black, bold = true },
  GnConfirmMode = { bg = colors.teal, fg = colors.black, bold = true },
  GnCommandMode = { bg = colors.orange, fg = colors.black, bold = true },
  GnSelectMode = { bg = colors.blue, fg = colors.black, bold = true },

  GnTelescopeMode = { bg = colors.yellow, fg = colors.black, bold = true },
  GnExplorerMode = { bg = colors.cyan, fg = colors.black, bold = true },
  GnLazyGitMode = { bg = colors.cyan, fg = colors.black, bold = true },
  GnLazyNvimMode = { bg = colors.mauve, fg = colors.black, bold = true },

  GnFileIcon = { bg = colors.stl_bg, fg = colors.white },
  GnFile = { bg = colors.stl_bg, fg = colors.white },

  GnGitIcon = { fg = colors.plum },
  GnGitText = { fg = colors.white },
  GnLsp = { bg = colors.stl_bg, fg = colors.white },
  GnLspMsg = { bg = colors.green, fg = colors.black },

  GnLspIcon = { bg = colors.sapphire, fg = colors.black },
  GnLspText = { bg = colors.stl_bg, fg = colors.white },
  GnCwdIcon = { bg = colors.peach, fg = colors.black },
  GnCwdText = { bg = colors.stl_bg, fg = colors.white },
  GnCursorIcon = { bg = colors.orange, fg = colors.black },
  GnCursorText = { bg = colors.stl_bg, fg = colors.white },
  GnFolderIcon = { bg = colors.red, fg = colors.black },
  GnFolderText = { bg = colors.stl_bg, fg = colors.white },
  GnQfIcon = { bg = colors.mauve, fg = colors.black },
  GnQfText = { bg = colors.stl_bg, fg = colors.white },

  GnLspError = { fg = colors.red },
  GnLspWarning = { fg = colors.yellow },
  GnLspHints = { fg = colors.fuchsia },
  GnLspInfo = { fg = colors.green },
  GnLspProgress = { fg = colors.charcoal },

  SnacksPickerTitle = { bg = colors.red, fg = colors.black, bold = true },
  SnacksPickerInputTitle = { bg = colors.red, fg = colors.black, bold = true },
  SnacksPickerPreviewTitle = { bg = colors.green, fg = colors.black, bold = true },
  SnacksIndentScope = { link = 'Keyword' },
  SnacksIndentChunk = { link = 'Keyword' },
}

M.statusline = stl_style == 'block' and stl_block or stl_compact

M.navic = {
  NavicIconsConstant = { fg = colors.orange, bg = colors.none },
  NavicIconsFunction = { fg = colors.blue, bg = colors.none },
  NavicIconsIdentifier = { fg = colors.red, bg = colors.none },
  NavicIconsField = { fg = colors.red, bg = colors.none },
  NavicIconsVariable = { fg = colors.mauve, bg = colors.none },
  NavicIconsSnippet = { fg = colors.red, bg = colors.none },
  NavicIconsText = { fg = colors.green, bg = colors.none },
  NavicIconsStructure = { fg = colors.mauve, bg = colors.none },
  NavicIconsType = { fg = colors.yellow, bg = colors.none },
  NavicIconsKeyword = { fg = colors.ivory, bg = colors.none },
  NavicIconsMethod = { fg = colors.blue, bg = colors.none },
  NavicIconsConstructor = { fg = colors.blue, bg = colors.none },
  NavicIconsFolder = { fg = colors.ivory, bg = colors.none },
  NavicIconsModule = { fg = colors.yellow, bg = colors.none },
  NavicIconsProperty = { fg = colors.peach, bg = colors.none },
  NavicIconsEnum = { fg = colors.blue, bg = colors.none },
  NavicIconsUnit = { fg = colors.mauve, bg = colors.none },
  NavicIconsClass = { fg = colors.teal, bg = colors.none },
  NavicIconsFile = { fg = colors.ivory, bg = colors.none },
  NavicIconsInterface = { fg = colors.green, bg = colors.none },
  NavicIconsColor = { fg = colors.white, bg = colors.none },
  NavicIconsReference = { fg = colors.white, bg = colors.none },
  NavicIconsEnumMember = { fg = colors.fuchsia, bg = colors.none },
  NavicIconsStruct = { fg = colors.mauve, bg = colors.none },
  NavicIconsValue = { fg = colors.cyan, bg = colors.none },
  NavicIconsEvent = { fg = colors.yellow, bg = colors.none },
  NavicIconsOperator = { fg = colors.mauve, bg = colors.none },
  NavicIconsTypeParameter = { fg = colors.red, bg = colors.none },
  NavicIconsNamespace = { fg = colors.teal, bg = colors.none },
  NavicIconsPackage = { fg = colors.green, bg = colors.none },
  NavicIconsString = { fg = colors.green, bg = colors.none },
  NavicIconsNumber = { fg = colors.peach, bg = colors.none },
  NavicIconsBoolean = { fg = colors.orange, bg = colors.none },
  NavicIconsArray = { fg = colors.blue, bg = colors.none },
  NavicIconsObject = { fg = colors.mauve, bg = colors.none },
  NavicIconsKey = { fg = colors.red, bg = colors.none },
  NavicIconsNull = { fg = colors.cyan, bg = colors.none },
  NavicText = { fg = colors.charcoal, bg = colors.none },
  NavicSeparator = { fg = colors.red, bg = colors.none },
}

M.diagnostics = {
  DiagnosticError = { fg = colors.red },
  DiagnosticWarn = { fg = colors.yellow },
  DiagnosticInfo = { fg = colors.white },
  DiagnosticHint = { fg = colors.mauve },
  DiagnosticOk = { fg = colors.green },

  -- DiagnosticVirtualTextError = { fg = colors.peach, link = "" },
  -- DiagnosticVirtualTextWarn = { fg = colors.sunshine, link = "" },
  -- DiagnosticVirtualTextInfo = { fg = colors.aqua, link = "" },
  -- DiagnosticVirtualTextHint = { fg = colors.lavender, link = "" },
  -- DiagnosticVirtualTextOk = { fg = colors.lime, link = "" },
  --
  -- DiagnosticUnderlineError = { sp = colors.red, undercurl = true, italic = true },
  -- DiagnosticUnderlineWarn = { sp = colors.yellow, undercurl = true, italic = true },
  -- DiagnosticUnderlineInfo = { sp = colors.white, undercurl = true, italic = true },
  -- DiagnosticUnderlineHint = { sp = colors.mauve, undercurl = true, italic = true },
  -- DiagnosticUnderlineOk = { sp = colors.green, undercurl = true, italic = true },
}

-- LSP
M.lsp = {
  LspReferenceText = { bg = bg },
  LspReferenceRead = { bg = bg },
  LspReferenceWrite = { bg = bg },
  LspSignatureActiveParameter = { fg = colors.orange, bold = true },
  LspInlayHint = { fg = colors.comment },
}

M.dashboard = {
  GnDashAscii = { bg = colors.none, fg = colors.grape },
  GnDashIcon = { bg = colors.none, fg = colors.blue },
  GnDashLabel = { bg = colors.none, fg = colors.white, bold = true, italic = true },
  GnDashKey = { bg = colors.none, fg = colors.orange, italic = true },
  GnDashDesc = { bg = colors.none, fg = colors.comment, italic = true },
  GnDashFooter = { bg = colors.none, fg = colors.comment, italic = true },
  GnDashSep = { bg = colors.none, fg = colors.bg },
  GnDashIconProject = { bg = colors.none, fg = colors.green },
  GnDashIconHistory = { bg = colors.none, fg = colors.blue },
  GnDashIconTools = { bg = colors.none, fg = colors.lemon },
  GnDashIconGit = { bg = colors.none, fg = colors.mauve },
  GnDashIconSystem = { bg = colors.none, fg = colors.red },
  GnDashFocusLabel = { bg = bg, fg = colors.white, bold = true },
  GnDashFocusIcon = { bg = bg, fg = colors.white, bold = true },
  GnDashFocusKey = { bg = bg, fg = colors.orange, bold = true },
  GnDashFocusDesc = { bg = bg, fg = colors.comment },
  GnDashFocusCell = { bg = bg },
}

M.explorer = {
  GnExplorerNormal = { bg = bg },
  GnExplorerTitle = { link = 'SnacksPickerInputTitle' },
  GnExplorerSep = { fg = colors.bg, bg = bg },
}

M.plugins = {
  ['@parameter'] = { link = '@variable.parameter' },
  ['@namespace.builtin'] = { link = '@module' },
  ['@comment'] = { fg = colors.comment, italic = true },

  LuaDocumentTag = { fg = colors.plum },
  LuaDocumentParam = { fg = colors.orange },
  LuaGlobalVim = { fg = colors.yellow },
  ['@variable.member.lua'] = { link = '@variable.member' },

  ['@type.qualifier.tsx'] = { fg = colors.mauve, link = '' },
  ['@type.qualifier.vue'] = { fg = colors.mauve, link = '' },
  ['@type.qualifier.typescript'] = { fg = colors.mauve, link = '' },
  ['@type.qualifier.javascript'] = { fg = colors.mauve, link = '' },
  ['@type.qualifier.astro'] = { fg = colors.mauve, link = '' },

  ['@parameter.tsx'] = { fg = colors.orange, link = '' },
  ['@parameter.vue'] = { fg = colors.orange, link = '' },
  ['@parameter.javascript'] = { fg = colors.orange, link = '' },
  ['@parameter.typescript'] = { fg = colors.orange, link = '' },

  ['@variable.parameter.tsx'] = { fg = colors.orange, link = '' },
  ['@variable.parameter.vue'] = { fg = colors.orange, link = '' },
  ['@variable.parameter.javascript'] = { fg = colors.orange, link = '' },
  ['@variable.parameter.typescript'] = { fg = colors.orange, link = '' },
  ['@variable.parameter.lua'] = { fg = colors.orange, link = '' },
  ['@variable.parameter.java'] = { fg = colors.orange, link = '' },

  ['@property.tsx'] = { fg = colors.peach },
  ['@property.vue'] = { fg = colors.peach },
  ['@property.javascript'] = { fg = colors.peach },
  ['@property.typescript'] = { fg = colors.peach },
  ['@property.html'] = { fg = colors.peach },

  ['@tag.tsx'] = { fg = colors.red },
  ['@tag.vue'] = { fg = colors.red },
  ['@tag.javascript'] = { fg = colors.red },
  ['@tag.typescript'] = { fg = colors.red },
  ['@tag.html'] = { fg = colors.red },
  ['@tag.astro'] = { fg = colors.red },
  ['@type.astro'] = { link = '@tag.astro' },

  ['@tag.builtin.tsx'] = { fg = colors.red },
  ['@tag.builtin.javascript'] = { fg = colors.red },
  ['@tag.builtin.astro'] = { fg = colors.red },

  ['@constructor.tsx'] = { fg = colors.red, link = '' },
  ['@constructor.vue'] = { fg = colors.red, link = '' },
  ['@constructor.javascript'] = { fg = colors.red, link = '' },
  ['@constructor.typescript'] = { fg = colors.red, link = '' },
  ['@constructor.astro'] = { fg = colors.red, link = '' },

  ['@operator.tsx'] = { fg = colors.mauve },
  ['@operator.vue'] = { fg = colors.mauve },
  ['@operator.javascript'] = { fg = colors.mauve },
  ['@operator.typescript'] = { fg = colors.mauve },
  ['@operator.html'] = { fg = colors.mauve },
  ['@operator.astro'] = { fg = colors.mauve },

  ['@punctuation.special.tsx'] = { fg = colors.mauve },
  ['@punctuation.special.vue'] = { fg = colors.mauve },
  ['@punctuation.special.javascript'] = { fg = colors.mauve },
  ['@punctuation.special.typescript'] = { fg = colors.mauve },
  ['@punctuation.special.astro'] = { fg = colors.mauve },

  ['@tag.attribute.tsx'] = { fg = colors.orange },
  ['@tag.attribute.vue'] = { fg = colors.orange },
  ['@tag.attribute.javascript'] = { fg = colors.orange },
  ['@tag.attribute.typescript'] = { fg = colors.orange },
  ['@tag.attribute.html'] = { fg = colors.orange },
  ['@tag.attribute.astro'] = { fg = colors.orange },

  ['@tag.delimiter.tsx'] = { fg = colors.cyan },
  ['@tag.delimiter.vue'] = { fg = colors.cyan },
  ['@tag.delimiter.javascript'] = { fg = colors.cyan },
  ['@tag.delimiter.typescript'] = { fg = colors.cyan },
  ['@tag.delimiter.html'] = { fg = colors.cyan },
  ['@tag.delimiter.astro'] = { fg = colors.cyan },

  ['@punctuation.delimiter.tsx'] = { fg = colors.cyan },
  ['@punctuation.delimiter.vue'] = { fg = colors.cyan },
  ['@punctuation.delimiter.javascript'] = { fg = colors.cyan },
  ['@punctuation.delimiter.typescript'] = { fg = colors.cyan },
  ['@punctuation.delimiter.html'] = { fg = colors.cyan },
  ['@punctuation.delimiter.astro'] = { fg = colors.cyan },

  ['@punctuation.bracket.tsx'] = { fg = colors.cyan },
  ['@punctuation.bracket.vue'] = { fg = colors.cyan },
  ['@punctuation.bracket.javascript'] = { fg = colors.cyan },
  ['@punctuation.bracket.typescript'] = { fg = colors.cyan },
  ['@punctuation.bracket.astro'] = { fg = colors.cyan },
  ['@punctuation.bracket.lua'] = { fg = colors.cyan },
  ['@punctuation.bracket.java'] = { fg = colors.cyan },

  ['@text.uri.tsx'] = { fg = colors.none },
  ['@text.uri.vue'] = { fg = colors.none },
  ['@text.uri.javascript'] = { fg = colors.none },
  ['@text.uri.typescript'] = { fg = colors.none },
  ['@text.uri.html'] = { fg = colors.none },
  ['@variable.member.typescript'] = { fg = colors.red, link = '' },
  ['@variable.member.javascript'] = { fg = colors.red, link = '' },
  ['@variable.member.tsx'] = { fg = colors.red, link = '' },

  ['@variable.rust'] = { fg = colors.red },
  ['@function.macro.rust'] = { fg = colors.blue },
  ['@namespace.rust'] = { fg = colors.orange },
  ['@variable.member.rust'] = { fg = colors.red, link = '' },
  ['@module.rust'] = { fg = colors.mauve },
  ['@punctuation.bracket.rust'] = { fg = colors.cyan },

  ['@include.java'] = { fg = colors.mauve },
  ['@type.qualifier.java'] = { fg = colors.mauve },
  ['@repeat.java'] = { fg = colors.mauve },
  ['@attribute.java'] = { fg = colors.orange },
  ['@variable.member.java'] = { fg = colors.red, link = '' },

  htmlTag = { fg = colors.cyan },
  htmlEndTag = { fg = colors.cyan },
  htmlArg = { fg = colors.orange, link = '' },

  ['@variable.css'] = { fg = colors.red },
  ['@constant.bash'] = { fg = colors.red },

  zshVariable = { fg = colors.red },
  zshFunction = { fg = colors.blue },
  zshBrackets = { fg = colors.cyan },
  zshParentheses = { fg = colors.cyan },
  zshOperator = { fg = colors.mauve },
  zshDeref = { fg = colors.red },
  zshShortDeref = { fg = colors.red },
  zshSubst = { fg = colors.red },
  zshOldSubst = { fg = colors.red },
  zshDelimiter = { fg = colors.cyan },
  ['@variable.zsh'] = { fg = colors.red },
  ['@punctuation.bracket.zsh'] = { fg = colors.cyan },
  ['@punctuation.delimiter.zsh'] = { fg = colors.cyan },
  ['@operator.zsh'] = { fg = colors.mauve },

  ['@spell.gitcommit'] = { fg = colors.blue },
  ['@text.gitcommit'] = { fg = colors.cyan },

  LazyGitBorder = { fg = colors.blue },
  TabLine = { bg = colors.none, fg = colors.none },

  TextGreen = { fg = colors.green },
  TextRed = { fg = colors.red },
  TextBlue = { fg = colors.blue },
  TextMagenta = { fg = colors.mauve },
  TextYellow = { fg = colors.yellow },
  TextOrange = { fg = colors.orange },
  TextCyan = { fg = colors.cyan },

  WinbarEmpty = { bg = bg },
  CodeActionText = { fg = colors.white },

  SkActive = { bg = colors.red, fg = colors.mode_fg },

  NavicIconsFolder = { fg = colors.yellow, bg = colors.none },
  NavicText = { fg = colors.white, bg = colors.none },
  NavicDepthLimitIndicator = { bg = colors.none, fg = 'yellow' },
  NavicFolderSeparator = { bg = colors.yellow, fg = colors.black },
  NavicFolderBlock = { bg = colors.red, fg = colors.black },

  WhichKeyDesc = { fg = colors.maroon },
  WhichKeyTitle = { fg = colors.mauve },
  WhichKey = { link = 'NormalFloat' },
  WhichKeyBorder = { fg = colors.grape, bg = bg },
  WhichKeyGroup = { fg = colors.navy },
  WhichKeySeparator = { fg = colors.comment },
  WhichKeyValue = { fg = colors.comment },

  SnacksPickerListNormal = { bg = colors.none },
  SnacksPickerListNormalFloat = { bg = colors.none },
  SnacksPickerInputNormal = { bg = colors.none },
  SnacksPickerInputNormalFloat = { bg = colors.none },
  SnacksPickerDirectory = { fg = colors.white },
  SnacksPickerRoot = { fg = colors.red },
  Directory = { fg = colors.yellow },
  SnacksPickerTree = { fg = colors.border },

  VM_Extend = { bg = colors.blue, fg = colors.black },
  VM_Cursor = { bg = colors.mauve, fg = colors.black },

  GitSignsChange = { fg = colors.orange },
  GitSignsAdd = { fg = colors.green },
  GitSignsDelete = { fg = colors.red },

  LazyCommitIssue = { fg = colors.mustard },

  DiffviewFilePanelTitle = { fg = colors.blue },
  DiffviewDiffAdd = { bg = '#2A304B', fg = colors.none },
  DiffviewDiffChange = { bg = '#2A304B' },
  DiffviewDiffDelete = { bg = '#4F3A4F' },
  DiffviewDiffAddAsDelete = { bg = '#4F3A4F', fg = colors.none },
  DiffAdd = { bg = '#2A304B', fg = colors.none },
  DiffDelete = { bg = '#34232C' },
  DiffChange = { bg = '#384268' },
  DiffviewDiffText = { bg = '#484466', fg = colors.none, link = '' },
  DiffviewStatusModified = { fg = colors.yellow },
  DiffviewStatusAdded = { fg = colors.green },
  DiffviewFilePanelSelected = { fg = colors.white },
  DiffviewFilePanelFileName = { fg = colors.comment },

  FlashBackdrop = { fg = colors.comment },
  FlashMatch = { fg = colors.lavender, bg = bg },
  FlashCurrent = { fg = colors.peach, bg = bg },
  FlashLabel = { fg = colors.green, bg = bg, bold = true },
  FlashPrompt = { link = 'NormalFloat' },

  NoiceCmdlinePopupBorder = { fg = colors.lime },
  NoiceCmdLinePopupTitle = { fg = colors.lime },
  NoiceCmdlineIcon = { fg = colors.green },
  NoiceCmdlineBashIcon = { fg = colors.red },
  NoiceCmdlineHelpIcon = { fg = colors.blue },
  NoiceCmdlineHlIcon = { fg = colors.red },
  NoiceCmdlineReplaceIcon = { fg = colors.orange },
  NoiceCmdlineMapIcon = { fg = colors.white },
  NoiceCmdlineCalculatorIcon = { fg = colors.white },
  NoiceCmdlineLuaIcon = { link = 'DevIconLua' },
  NoiceConfirmBorder = { fg = colors.green },
  NoicePopupmenuSelected = { bg = colors.blue, fg = colors.black },

  GitGraphHash = { fg = colors.yellow },
  GitGraphTimestamp = { fg = colors.green },
  GitGraphAuthor = { fg = colors.blue },
  GitGraphBranchName = { fg = colors.red },
  GitGraphBranchTag = { fg = colors.mauve },
  GitGraphBranchMsg = { fg = colors.white },
  GitGraphBranch1 = { fg = colors.red },
  GitGraphBranch2 = { fg = colors.orange },
  GitGraphBranch3 = { fg = colors.yellow },
  GitGraphBranch4 = { fg = colors.green },
  GitGraphBranch5 = { fg = colors.blue },

  BqfPreviewFloat = { bg = bg },
  BqfPreviewBorder = { bg = bg, fg = colors.bg },
  BqfPreviewTitle = { bg = colors.orange, fg = colors.black },
  qfLineNr = { fg = colors.yellow },

  HelpviewCode = { bg = bg },
  HelpviewPalette0 = { bg = colors.cyan, fg = colors.black },
  HelpviewPalette1 = { bg = colors.red, fg = colors.black },
  HelpviewPalette2 = { bg = colors.orange, fg = colors.black },
  HelpviewPalette3 = { bg = colors.yellow, fg = colors.black },
  HelpviewPalette4 = { bg = colors.green, fg = colors.black },
  HelpviewPalette6 = { bg = colors.mauve, fg = colors.black },
  HelpviewPalette0Sign = { fg = colors.cyan },
  HelpviewPalette1Sign = { fg = colors.red },
  HelpviewPalette2Sign = { fg = colors.orange },
  HelpviewPalette3Sign = { fg = colors.yellow },
  HelpviewPalette4Sign = { fg = colors.green },
  HelpviewPalette5Sign = { fg = colors.blue },
  HelpviewPalette6Sign = { fg = colors.mauve },
  HelpviewPalette7Sign = { fg = colors.tangerine },
  HelpviewIcon0 = { fg = colors.cyan },
  HelpviewIcon1 = { fg = colors.red },
  HelpviewIcon2 = { fg = colors.orange },
  HelpviewIcon3 = { fg = colors.yellow },
  HelpviewIcon4 = { fg = colors.green },
  HelpviewIcon5 = { fg = colors.blue },
  HelpviewIcon6 = { fg = colors.mauve },

  NotifyERRORBorder = { fg = colors.maroon },
  NotifyWARNBorder = { fg = colors.lemon },
  NotifyINFOBorder = { fg = colors.emerald },
  NotifyDEBUGBorder = { fg = colors.navy },
  NotifyTRACEBorder = { fg = colors.mauve },
  NotifyERRORIcon = { fg = colors.red },
  NotifyWARNIcon = { fg = colors.sunshine },
  NotifyINFOIcon = { fg = colors.green },
  NotifyDEBUGIcon = { fg = colors.blue },
  NotifyTRACEIcon = { fg = colors.plum },
  NotifyERRORTitle = { fg = colors.red },
  NotifyWARNTitle = { fg = colors.sunshine },
  NotifyINFOTitle = { fg = colors.green },
  NotifyDEBUGTitle = { fg = colors.blue },
  NotifyTRACETitle = { fg = colors.plum },

  SnacksNotifierFooterInfo = { fg = colors.green },
  SnacksNotifierBorderInfo = { fg = colors.green },
  SnacksNotifierTitleInfo = { fg = colors.green },
  SnacksNotifierIconInfo = { fg = colors.green },

  SnacksPickerInput = { bg = bg },
  SnacksPickerList = { bg = bg },
  SnacksPickerPreview = { bg = bg },
  SnacksPickerBox = { bg = bg },
  SnacksPickerBorder = { fg = colors.obsidian, bg = bg },
  SnacksPickerInputBorder = { fg = colors.obsidian, bg = bg },
  SnacksPickerListBorder = { fg = colors.obsidian, bg = bg },
  SnacksPickerPreviewBorder = { fg = colors.obsidian, bg = bg },
  SnacksPickerBoxBorder = { fg = colors.obsidian, bg = bg },
  SnacksPickerMatch = { fg = colors.plum },
  SnacksPickerDir = { fg = colors.comment },
  SnacksPickerFile = { fg = colors.white },
  SnacksPickerPathHidden = { fg = colors.comment },
  SnacksPickerGitStatusAdded = { fg = colors.green },
  SnacksPickerGitStatusModified = { fg = colors.yellow },
  SnacksPickerGitStatusDeleted = { fg = colors.red },
  SnacksPickerGitStatusUntracked = { fg = colors.orange },
  SnacksPickerPrompt = { fg = colors.blue },

  LemonNormal = { bg = bg },
  LemonBorder = { fg = colors.float_border, bg = bg },
  LemonTitle = stl_style == 'block' and { bg = colors.blue, fg = colors.black, bold = true }
    or { fg = colors.blue, bg = bg, bold = true },

  KulalaText = { bg = colors.green, fg = colors.black },

  LemonBeacon = { bg = colors.blue },
}

M.markview = {
  MarkviewPalette0 = { fg = colors.cyan, bold = true },
  MarkviewPalette1 = { fg = colors.red, bold = true },
  MarkviewPalette2 = { fg = colors.orange, bold = true },
  MarkviewPalette3 = { fg = colors.yellow, bold = true },
  MarkviewPalette4 = { fg = colors.green, bold = true },
  MarkviewPalette5 = { fg = colors.blue, bold = true },
  MarkviewPalette6 = { fg = colors.mauve, bold = true },

  MarkviewPalette0Fg = { fg = colors.cyan },
  MarkviewPalette1Fg = { fg = colors.red },
  MarkviewPalette2Fg = { fg = colors.orange },
  MarkviewPalette3Fg = { fg = colors.yellow },
  MarkviewPalette4Fg = { fg = colors.green },
  MarkviewPalette5Fg = { fg = colors.blue },
  MarkviewPalette6Fg = { fg = colors.mauve },

  MarkviewPalette0Sign = { fg = colors.cyan },
  MarkviewPalette1Sign = { fg = colors.red },
  MarkviewPalette2Sign = { fg = colors.orange },
  MarkviewPalette3Sign = { fg = colors.yellow },
  MarkviewPalette4Sign = { fg = colors.green },
  MarkviewPalette5Sign = { fg = colors.blue },
  MarkviewPalette6Sign = { fg = colors.mauve },
  MarkviewPalette7Sign = { fg = colors.tangerine },

  MarkviewIcon0 = { fg = colors.cyan },
  MarkviewIcon1 = { fg = colors.red },
  MarkviewIcon2 = { fg = colors.orange },
  MarkviewIcon3 = { fg = colors.yellow },
  MarkviewIcon4 = { fg = colors.green },
  MarkviewIcon5 = { fg = colors.blue },
  MarkviewIcon6 = { fg = colors.mauve },

  MarkviewCode = { bg = '#181825' },
  MarkviewCodeInfo = { fg = colors.charcoal, bg = '#181825' },
  MarkviewCodeFg = { fg = colors.bg },
  MarkviewInlineCode = { fg = colors.orange },

  MarkviewBlockQuoteDefault = { fg = colors.cyan },
  MarkviewBlockQuoteError = { fg = colors.red },
  MarkviewBlockQuoteNote = { fg = colors.blue },
  MarkviewBlockQuoteOk = { fg = colors.green },
  MarkviewBlockQuoteSpecial = { fg = colors.mauve },
  MarkviewBlockQuoteWarn = { fg = colors.orange },

  MarkviewCheckboxCancelled = { fg = colors.red },
  MarkviewCheckboxChecked = { fg = colors.green },
  MarkviewCheckboxPending = { fg = colors.orange },
  MarkviewCheckboxProgress = { fg = colors.blue },
  MarkviewCheckboxUnchecked = { fg = colors.white },
  MarkviewCheckboxStriked = { fg = colors.cyan, strikethrough = true },

  MarkviewTableHeader = { fg = colors.cyan },
  MarkviewTableBorder = { fg = colors.charcoal },
  MarkviewTableAlignCenter = { fg = colors.charcoal },
  MarkviewTableAlignLeft = { fg = colors.charcoal },
  MarkviewTableAlignRight = { fg = colors.charcoal },

  MarkviewListItemMinus = { fg = colors.orange },
  MarkviewListItemPlus = { fg = colors.blue },
  MarkviewListItemStar = { fg = colors.mauve },
  MarkviewListItemDot = { fg = colors.orange },

  MarkviewHeading1 = { fg = colors.red, bold = true },
  MarkviewHeading2 = { fg = colors.orange, bold = true },
  MarkviewHeading3 = { fg = colors.yellow, bold = true },
  MarkviewHeading4 = { fg = colors.green, bold = true },
  MarkviewHeading5 = { fg = colors.blue, bold = true },
  MarkviewHeading6 = { fg = colors.mauve, bold = true },

  MarkviewHeading1Sign = { fg = colors.red },
  MarkviewHeading2Sign = { fg = colors.orange },
  MarkviewHeading3Sign = { fg = colors.yellow },
  MarkviewHeading4Sign = { fg = colors.green },
  MarkviewHeading5Sign = { fg = colors.blue },
  MarkviewHeading6Sign = { fg = colors.mauve },
}

-- Apply highlights
function M.apply(highlights)
  for name, opts in pairs(highlights) do
    -- Handle link = "" (clear link)
    if opts.link == '' then
      opts = vim.tbl_extend('force', opts, { link = nil })
    end
    vim.api.nvim_set_hl(0, name, opts)
  end
end

local function apply_all()
  M.apply(M.base)
  M.apply(M.syntax)
  M.apply(M.treesitter)
  M.apply(M.statusline)
  M.apply(M.navic)
  M.apply(M.diagnostics)
  M.apply(M.lsp)
  M.apply(M.lazy)
  M.apply(M.mason)
  M.apply(M.misc)
  M.apply(M.dashboard)
  M.apply(M.explorer)
  M.apply(M.markview)

  local ok_cmp, cmp_ui = pcall(require, 'ui.cmp')
  if ok_cmp then
    if cmp_ui.override then
      M.apply(cmp_ui.override)
    end
    if cmp_ui.add then
      M.apply(cmp_ui.add)
    end
  end

  M.apply(M.plugins)
end

function M.setup()
  apply_all()
  M.set_terminal_colors()
end

-- Terminal colors
function M.set_terminal_colors()
  vim.g.terminal_color_0 = colors.black
  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_2 = colors.green
  vim.g.terminal_color_3 = colors.yellow
  vim.g.terminal_color_4 = colors.blue
  vim.g.terminal_color_5 = colors.mauve
  vim.g.terminal_color_6 = colors.cyan
  vim.g.terminal_color_7 = colors.white
  vim.g.terminal_color_8 = colors.charcoal
  vim.g.terminal_color_9 = colors.peach
  vim.g.terminal_color_10 = colors.lime
  vim.g.terminal_color_11 = colors.lemon
  vim.g.terminal_color_12 = colors.sky
  vim.g.terminal_color_13 = colors.lavender
  vim.g.terminal_color_14 = colors.aqua
  vim.g.terminal_color_15 = colors.ivory
end

return M
