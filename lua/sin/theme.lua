local colors = require("sin.colors")

local util = require("sin.util")

local M = {}
function M.setup()
    local config = require("sin.config")
    local opts = config.options

    local theme = {}
    local t = colors.default


    -- Override colors with user defined colors
    t = vim.tbl_deep_extend("force", t, opts.theme.colors)

    if opts.transparent then
        t.bg = "NONE"
    end

    if opts.hide_fillchars then
        vim.opt.fillchars:append({
            horiz = " ",
            horizup = " ",
            horizdown = " ",
            vert = " ",
            vertleft = " ",
            vertright = " ",
            verthoriz = " ",
            eob = " ",
        })
    else
        vim.opt.fillchars:append({
            eob = " ",
        })
    end

    theme.highlights = {

        ["@variable"] = { fg = t.attention},
        Comment = { fg = t.attention, italic = opts.italic_comments },
        ColorColumn = { bg = t.bgHighlight }, -- used for dimming inactive buffers
        Conceal = { fg = t.syntax },
        Cursor = { fg = t.attention, bg = t.fg },
        ICursor = { fg = t.attention, bg = t.fg },
        CursorIM = { fg = t.attention, bg = t.fg },
        CursorColumn = { fg = t.significant, bg = t.bg },
        CursorLine = { bg = (util.blend(t.bgAlt, t.bgHighlight)) },
        Directory = { fg = t.notable },
        DiffAdd = { fg = t.add },
        DiffChange = { fg = t.cyan },
        DiffDelete = { fg = t.attention },
        DiffText = { fg = t.highlight },
        EndOfBuffer = { fg = t.bg },
        ErrorMsg = { fg = t.attention },
        VertSplit = { fg = t.important, bg = t.bg },
        WinSeparator = { fg = t.notable, bg = t.bg },
        Folded = { fg = t.syntax, bg = t.bgHighlight },
        FoldColumn = { fg = t.syntax, bg = t.bgHighlight },
        SignColumn = { fg = t.syntax, bg = t.bg },
        SignColumnSB = { fg = t.syntax, bg = t.bg },
        Substitute = { fg = t.attention, bg = t.bgHighlight },
        LineNr = { fg = util.blend(t.bgHighlight, t.fg, 0.9) },
        CursorLineNr = { fg = t.syntax },
        MatchParen = { fg = t.attention, bg = t.bgHighlight },
        ModeMsg = { fg = t.fg },
        MsgArea = { fg = t.fg },
        MoreMsg = { fg = t.highlight },
        NonText = { fg = t.bg },
        Normal = { fg = t.fg, bg = t.bg },
        NormalNC = { fg = t.fg, bg = t.bg },
        NormalFloat = { fg = t.fg, bg = t.bg },
        FloatTitle = { fg = t.bg, bg = t.notable },
        FloatFooter = { fg = t.bg, bg = t.notable },
        FloatBorder = { fg = t.fg, bg = t.bg },
        Pmenu = { fg = t.fg, bg = t.bg },
        PmenuSel = { fg = t.fg, bg = t.bgHighlight },
        PmenuSbar = { fg = t.bg, bg = t.bgHighlight },
        PmenuThumb = { fg = t.bg, bg = t.bgHighlight },
        Question = { fg = t.search },
        QuickFixLine = { bg = t.bgHighlight },
        Search = { fg = t.bgAlt, bg = t.search },
        IncSearch = { fg = t.bgAlt, bg = t.search },
        CurSearch = { fg = t.bgAlt, bg = t.search },
        SpecialKey = { fg = t.syntax },
        SpellBad = { fg = t.attention, style = "undercurl" },
        SpellCap = { fg = t.search, style = "undercurl" },
        SpellLocal = { fg = t.highlight, style = "undercurl" },
        SpellRare = { fg = t.syntax, style = "undercurl" },
        StatusLine = { fg = t.fg, bg = t.bg },
        StatusLineNC = { fg = t.syntax, bg = t.bg },
        TabLine = { fg = t.syntax, bg = t.bg },
        TabLineFill = { fg = t.syntax, bg = t.bgHighlight },
        TabLineSel = { fg = t.fg, bg = t.bgHighlight },
        WinBar = { fg = t.syntax, bg = t.bg },
        WinBarNC = { fg = t.syntax, bg = t.bg },
        Title = { fg = t.fg },
        Visual = { fg = t.bg, bg = t.highlight },
        VisualNOS = { fg = t.bg, bg = t.highlight },
        WarningMsg = { fg = t.attention },
        Whitespace = { fg = t.syntax },
        WildMenu = { fg = t.bg, bg = t.highlight },

        Constant = { fg = t.fg },
        String = { fg = t.significant },
        Character = { fg = t.notable },

        Identifier = { fg = t.fg },
        Function = { fg = t.syntax },
        Statement = { fg = t.syntax },
        Operator = { fg = t.syntax },
        Keyword = { fg = t.syntax },
        PreProc = { fg = t.syntax },

        Type = { fg = t.syntax },

        Special = { fg = t.syntax },
        Delimiter = { fg = t.syntax },

        Debug = { fg = t.attention },

        Underlined = { style = "underline" },
        Bold = { style = "bold" },
        Italic = { style = "italic" },

        Error = { fg = t.attention },
        Todo = { fg = t.syntax, style = "bold" },

        qfLineNr = { fg = t.syntax },
        qfFileName = { fg = t.highlight },

        htmlH1 = { fg = t.fg, bold = true },
        htmlH2 = { fg = t.fg, bold = true },

        mkdCodeDelimiter = { fg = t.syntax },
        mkdCodeStart = { fg = t.highlight },
        mkdCodeEnd = { fg = t.highlight },

        markdownHeadingDelimiter = { fg = t.syntax },
        markdownCode = { fg = t.significant },
        markdownCodeBlock = { fg = t.significant },
        markdownH1 = { fg = t.attention, bold = true },
        markdownH2 = { fg = t.significant, bold = true },
        markdownH3 = { fg = t.significant, bold = true },
        markdownH4 = { fg = t.syntax, bold = true },
        markdownH5 = { fg = t.syntax, bold = true },
        markdownLinkText = { fg = t.highlight, underline = true },

        LspReferenceText = { bg = t.bgHighlight },
        LspReferenceRead = { bg = t.bgHighlight },
        LspReferenceWrite = { bg = t.bgHighlight },

        -- EasyMotion

        EasyMotionTarget = { fg = t.attention, bg = t.bg },
        EasyMotionShade = { fg = t.syntax, bg = t.bg },
        EasyMotionTarget2First = { fg = t.bg, bg = t.search },
        EasyMotionTarget2Second = { fg = t.bg, bg = t.highlight },
        EasyMotionMoveHL = { fg = t.fg, bg = t.bgHighlight },
        EasyMotionIncSearch = { fg = t.bg, bg = t.search },


        -- LspDiagnostics
        DiagnosticError = { fg = t.attention },
        DiagnosticWarn = { fg = t.search },
        DiagnosticInfo = { fg = t.highlight },
        DiagnosticHint = { fg = t.cyan },
        DiagnosticUnnecessary = { fg = t.syntax },

        DiagnosiiucVirtualTextError = { fg = t.attention },
        DiagnosticVirtualTextWarn = { fg = t.search },
        DiagnosticVirtualTextInfo = { fg = t.highlight },
        DiagnosticVirtualTextHint = { fg = t.cyan },

        DiagnosticUnderlineError = { undercurl = true, sp = t.attention },
        DiagnosticUnderlineWarn = { undercurl = true, sp = t.search },
        DiagnosticUnderlineInfo = { undercurl = true, sp = t.highlight },
        DiagnosticUnderlineHint = { undercurl = true, sp = t.cyan },

        LspSignatureActiveParameter = { fg = t.attention },
        LspCodeLens = { fg = t.syntax },
        LspInlayHint = { fg = t.syntax },

        LspInfoBorder = { fg = t.notable },

        -- WhichKey
        WhichKey = { fg = t.cyan },
        WhichKeyGroup = { fg = t.highlight },
        WhichKeyDesc = { fg = t.syntax },
        WhichKeySeperator = { fg = t.notable },
        WhichKeyFloat = { bg = t.bg },
        WhichKeyValue = { fg = t.highlight },

        -- Alpha
        AlphaShortcut = { fg = t.attention },
        AlphaHeader = { fg = t.syntax },
        AlphaHeaderLabel = { fg = t.attention },
        AlphaFooter = { fg = t.cyan },
        AlphaButtons = { fg = t.highlight },

        -- dashboard-nvim
        DashboardHeader = { fg = t.syntax },
        DashboardFooter = { fg = t.cyan },
        -- dashboard-nvim: doom theme
        DashboardShortCut = { fg = t.attention },
        DashboardDesc = { fg = t.attention },
        DashboardKey = { fg = t.notable },
        DashboardIcon = { fg = t.highlight },
        -- dashboard-nvim: hyper theme
        DashboardProjectTitle = { fg = t.highlight },
        DashboardProjectTitleIcon = { fg = t.attention },
        DashboardProjectIcon = { fg = t.attention },
        DashboardMruTitle = { fg = t.highlight },
        DashboardMruIcon = { fg = t.attention },
        DashboardFiles = { fg = t.cyan },
        DashboardShortCutIcon = { fg = t.syntax },

        -- Telescope
        TelescopeBorder = { fg = t.notable, bg = t.attention },
        TelescopePromptTitle = { fg = t.attention },
        TelescopeResultsTitle = { fg = t.attention },
        TelescopePromptPrefix = { fg = t.syntax },
        TelescopePreviewTitle = { fg = t.syntax },
        TelescopeSelection = { fg = t.bgAlt, bg = t.notable },
        TelescopePromptCounter = { fg = t.syntax },

        -- Cmp
        CmpDocumentation = { fg = t.syntax, bg = t.bg },
        CmpDocumentationBorder = { fg = t.syntax, bg = t.notable },
        CmpGhostText = { fg = t.syntax, bg = t.bg },

        CmpItemAbbr = { fg = t.fg, bg = t.bg },
        CmpItemAbbrDeprecated = { fg = t.syntax, bg = t.bg, strikethrough = true },
        CmpItemAbbrMatch = { fg = t.syntax, bg = t.bg },
        CmpItemAbbrMatchFuzzy = { fg = t.syntax, bg = t.bg },

        CmpItemKindVariable = { fg = t.cyan, bg = t.bg },
        CmpItemKindInterface = { fg = t.cyan, bg = t.bg },
        CmpItemKindText = { fg = t.cyan, bg = t.bg },

        CmpItemKindFunction = { fg = t.syntax, bg = t.bg },
        CmpItemKindMethod = { fg = t.syntax, bg = t.bg },

        CmpItemKindKeyword = { fg = t.fg, bg = t.bg },
        CmpItemKindProperty = { fg = t.fg, bg = t.bg },
        CmpItemKindUnit = { fg = t.fg, bg = t.bg },

        CmpItemMenu = { fg = t.syntax, bg = t.bg },
        CmpItemKindDefault = { fg = t.syntax, bg = t.bg },

        -- Leap
        LeapMatch = { fg = t.fg, bg = t.syntax },
        LeapLabelPrimary = { fg = t.highlight, bg = t.bg, bold = true },
        LeapLabelSecondary = { fg = t.notable, bg = t.bg },
        LeapBackdrop = { fg = t.bgHighlight },

        -- Lazy
        LazyProgressDone = { bold = true, fg = t.syntax },
        LazyProgressTodo = { bold = true, fg = t.syntax },

        -- Noice
        NoiceFormatProgressDone = { fg = t.bgAlt, bg = t.cyan },
        NoiceFormatProgressTodo = { fg = t.syntax, bg = t.bgHighlight },

        NoiceLspProgressClient = { fg = t.highlight },
        NoiceLspProgressSpinner = { fg = t.attention },
        NoiceLspProgressTitle = { fg = t.cyan },

        -- GitSigns
        GitSignsAdd = { fg = t.notable },
        GitSignsChange = { fg = t.attention },
        GitSignsDelete = { fg = t.attention },

        -- Rainbow Delimiters
        RainbowDelimiterattention = { fg = t.attention },
        RainbowDelimiterOrange = { fg = t.orange },
        RainbowDelimitersearch = { fg = t.search },
        RainbowDelimiternotable = { fg = t.notable },
        RainbowDelimiterhighlight = { fg = t.highlight },
        RainbowDelimiterViolet = { fg = t.syntax },
        RainbowDelimiterCyan = { fg = t.cyan },

        -- Heirline
        HeirlineInactive = { bg = t.syntax },
        HeirlineNormal = { bg = t.highlight },
        HeirlineVisual = { bg = t.syntax },
        HeirlineReplace = { bg = t.attention },
        HeirlineCommand = { bg = t.search },
        HeirlineInsert = { bg = t.notable },
        HeirlineTerminal = { bg = t.cyan },

        -- Nvim Notify
        NotifyDEBUGBody = { fg = t.fg },
        NotifyDEBUGBorder = { fg = t.bgHighlight },
        NotifyDEBUGIcon = { fg = t.syntax },
        NotifyDEBUGTitle = { fg = t.syntax },
        NotifyERRORBody = { fg = t.fg },
        NotifyERRORBorder = { fg = t.bgHighlight },
        NotifyERRORIcon = { fg = t.attention },
        NotifyERRORTitle = { fg = t.syntax },
        NotifyINFOBody = { fg = t.fg },
        NotifyINFOBorder = { fg = t.bgHighlight },
        NotifyINFOIcon = { fg = t.notable },
        NotifyINFOTitle = { fg = t.cyan },
        NotifyTRACEBorder = { fg = t.bgHighlight },
        NotifyTRACEIcon = { fg = t.syntax },
        NotifyTRACETitle = { fg = t.syntax },
        NotifyWARNBody = { fg = t.fg },
        NotifyWARNBorder = { fg = t.bgHighlight },
        NotifyWARNIcon = { fg = t.attention },
        NotifyWARNTitle = { fg = t.search },
        NotifyBackground = { bg = t.bg },

        -- Indent Blankline
        IblIndent = { fg = util.blend(t.bgHighlight, t.bgAlt, 0.3) },
        IblScope = { fg = t.bgHighlight },

        -- TreeSitter Context
        TreeSitterContext = { bg = util.blend(t.bgAlt, t.cyan, 0.9) },
        TreeSitterContextLineNumber = { fg = util.blend(t.bgHighlight, t.fg) },

        -- Mini Files
        MiniFilesBorder = { fg = t.bgHighlight },
        MiniFilesBorderModified = { fg = t.syntax },
        MiniFilesCursorLine = { bg = util.blend(t.bgHighlight, t.bgAlt, 0.3) },
        MiniFilesDirectory = { fg = t.highlight },
        MiniFilesTitle = { fg = util.blend(t.bgHighlight, t.cyan, 0.7) },
        MiniFilesTitleFocused = { fg = t.cyan },

        -- Grapple
        GrappleTitle = { fg = t.syntax },
        GrappleFooter = { fg = t.syntax },
        GrappleBorder = { fg = t.cyan },

        -- TreeSitter Specific
        
        -- Functions (dark for definitions, light for calls)
        ["@function"] = { fg = t.syntax },
        ["@function.call"] = { fg = t.fg },
        ["@function.method"] = { fg = t.syntax },
        ["@function.method.call"] = { fg = t.significant },
        ["@function.builtin"] = { fg = t.syntax },
        ["@constructor"] = { fg = t.syntax },
        
        -- Keywords and control flow (dark syntax)
        ["@keyword"] = { fg = t.syntax },
        ["@keyword.function"] = { fg = t.syntax },
        ["@keyword.return"] = { fg = t.syntax },
        ["@keyword.conditional"] = { fg = t.syntax },
        ["@keyword.repeat"] = { fg = t.syntax },
        ["@keyword.import"] = { fg = t.syntax },
        ["@keyword.export"] = { fg = t.syntax },
        ["@keyword.operator"] = { fg = t.syntax },
        
        -- Data types and literals (lighter - data emphasis)
        ["@type"] = { fg = t.syntax },
        ["@type.builtin"] = { fg = t.syntax },
        ["@type.object.dark"] = { fg = t.bgHighlight },
        ["@type.annotation.dark"] = { fg = t.bgHighlight },
        ["@keyword.type"] = { fg = t.syntax },
        ["TSKeywordType"] = { fg = t.syntax },
        
        -- Variables (grayscale hierarchy) - placed after @type for priority
        ["@variable"] = { fg = t.fg },
        ["@variable.member"] = { fg = t.fg },
        ["@variable.parameter"] = { fg = t.fg },
        ["@variable.builtin"] = { fg = t.notable },
        ["@string"] = { fg = t.significant },
        ["@string.escape"] = { fg = t.fg },
        ["@number"] = { fg = t.significant },
        ["@boolean"] = { fg = t.significant },
        ["@constant"] = { fg = t.significant },
        ["@constant.builtin"] = { fg = t.notable },
        
        -- Operators and punctuation (dark syntax)
        ["@operator"] = { fg = t.syntax },
        ["@punctuation.delimiter"] = { fg = t.syntax },
        ["@punctuation.bracket"] = { fg = t.syntax },
        ["@punctuation.special"] = { fg = t.syntax },
        
        -- Properties and fields (lighter than variables)
        ["@property"] = { fg = t.notable },
        ["@field"] = { fg = t.notable },
        
        -- Comments (attention color)
        ["@comment"] = { fg = t.attention, italic = opts.italic_comments },
        ["@comment.documentation"] = { fg = t.attention, italic = opts.italic_comments },
        
        -- Special constructs
        ["@tag"] = { fg = t.syntax },
        ["@tag.attribute"] = { fg = t.fg },
        ["@tag.delimiter"] = { fg = t.syntax },
        ["@namespace"] = { fg = t.fg },
        ["@module"] = { fg = t.fg },
        ["@label"] = { fg = t.fg },
        
        -- Markup
        ["@markup.strong"] = { fg = t.syntax, bold = true },
        ["@markup.italic"] = { fg = t.highlight, italic = true },
        ["@markup.heading"] = { fg = t.fg, bold = true },
        ["@markup.link"] = { fg = t.highlight },
        ["@markup.list"] = { fg = t.syntax },
        
        -- TypeScript specific highlights
        -- Type-related (darker - structural)
        ["@type.typescript"] = { fg = t.syntax },
        ["@type.builtin.typescript"] = { fg = t.syntax },
        ["@type.definition.typescript"] = { fg = t.syntax },
        ["@type.qualifier.typescript"] = { fg = t.syntax },
        ["@keyword.type.typescript"] = { fg = t.syntax },
        
        -- Interfaces and type constructs
        ["@interface.typescript"] = { fg = t.syntax },
        ["@type.interface.typescript"] = { fg = t.syntax },
        ["@type.enum.typescript"] = { fg = t.syntax },
        
        -- Functions and methods
        ["@function.typescript"] = { fg = t.syntax },
        ["@function.call.typescript"] = { fg = t.fg },
        ["@function.method.typescript"] = { fg = t.syntax },
        ["@function.method.call.typescript"] = { fg = t.fg },
        ["@method.typescript"] = { fg = t.syntax },
        ["@method.call.typescript"] = { fg = t.fg },
        
        -- Variables and parameters (lighter - data)
        ["@variable.typescript"] = { fg = t.fg },
        ["@variable.builtin.typescript"] = { fg = t.notable },
        ["@variable.member.typescript"] = { fg = t.notable },
        ["@parameter.typescript"] = { fg = t.fg },
        ["@property.typescript"] = { fg = t.notable },
        ["@field.typescript"] = { fg = t.notable },
        
        -- Keywords and control flow (darker - syntax)
        ["@keyword.typescript"] = { fg = t.syntax },
        ["@keyword.function.typescript"] = { fg = t.syntax },
        ["@keyword.operator.typescript"] = { fg = t.syntax },
        ["@keyword.return.typescript"] = { fg = t.syntax },
        ["@keyword.import.typescript"] = { fg = t.syntax },
        ["@keyword.export.typescript"] = { fg = t.syntax },
        ["@conditional.typescript"] = { fg = t.syntax },
        ["@repeat.typescript"] = { fg = t.syntax },
        ["@exception.typescript"] = { fg = t.syntax },
        
        -- Literals and values (lighter - data)
        ["@string.typescript"] = { fg = t.significant },
        ["@string.regex.typescript"] = { fg = t.significant },
        ["@string.escape.typescript"] = { fg = t.fg },
        ["@string.special.typescript"] = { fg = t.significant },
        ["@number.typescript"] = { fg = t.significant },
        ["@boolean.typescript"] = { fg = t.significant },
        ["@constant.typescript"] = { fg = t.significant },
        ["@constant.builtin.typescript"] = { fg = t.notable },
        
        -- Constructors and special functions
        ["@constructor.typescript"] = { fg = t.syntax },
        
        -- Operators and punctuation (darker - syntax)
        ["@operator.typescript"] = { fg = t.syntax },
        ["@punctuation.delimiter.typescript"] = { fg = t.syntax },
        ["@punctuation.bracket.typescript"] = { fg = t.syntax },
        ["@punctuation.special.typescript"] = { fg = t.syntax },
        
        -- Comments and documentation
        ["@comment.typescript"] = { fg = t.attention, italic = opts.italic_comments },
        ["@comment.documentation.typescript"] = { fg = t.attention, italic = opts.italic_comments },
        
        -- Namespaces and modules
        ["@namespace.typescript"] = { fg = t.fg },
        ["@module.typescript"] = { fg = t.fg },
        
        -- Decorators (TypeScript specific feature)
        ["@decorator.typescript"] = { fg = t.highlight },
        ["@punctuation.decorator.typescript"] = { fg = t.highlight },
        
        -- TSX/React specific highlights
        ["@tag.tsx"] = { fg = t.syntax },
        ["@tag.builtin.tsx"] = { fg = t.syntax },
        ["@tag.attribute.tsx"] = { fg = t.fg },
        ["@tag.delimiter.tsx"] = { fg = t.syntax },
        ["@constructor.tsx"] = { fg = t.syntax },
        ["@keyword.tsx"] = { fg = t.syntax },
        
        -- JSX/React components
        ["@tag.javascript"] = { fg = t.syntax },
        ["@tag.attribute.javascript"] = { fg = t.fg },
        ["@tag.delimiter.javascript"] = { fg = t.syntax },
        ["@constructor.javascript"] = { fg = t.syntax },
        
        -- TypeScript-specific type annotations
        ["@type.annotation.typescript"] = { fg = t.syntax },
        ["@type.arguments.typescript"] = { fg = t.syntax },
        ["@type.parameters.typescript"] = { fg = t.syntax },
        
        -- TypeScript generics
        ["@type.generic.typescript"] = { fg = t.syntax },
        ["@punctuation.bracket.typescript"] = { fg = t.syntax },
        
        -- Async/await
        ["@keyword.async.typescript"] = { fg = t.syntax },
        ["@keyword.await.typescript"] = { fg = t.syntax },
        
        -- TypeScript-specific literals
        ["@string.template.typescript"] = { fg = t.significant },
        ["@embedded.typescript"] = { fg = t.fg },
    }

    if opts.borderless_telescope then
        theme.highlights.TelescopeBorder = { fg = t.important, bg = t.bgAlt }
        theme.highlights.TelescopeNormal = { bg = t.attention }
        theme.highlights.TelescopePreviewBorder = { fg = t.fg, bg = t.bgAlt }
        theme.highlights.TelescopePreviewNormal = { bg = t.bgAlt }
        theme.highlights.TelescopePreviewTitle = { fg = t.fg, bg = t.bgAlt }
        theme.highlights.TelescopePromptBorder = { fg = t.fg, bg = t.bgAlt }
        theme.highlights.TelescopePromptNormal = { fg = t.fg, bg = t.bgAlt }
        theme.highlights.TelescopePromptPrefix = { fg = t.attention, bg = t.bgAlt }
        theme.highlights.TelescopePromptTitle = { fg = t.fg, bg = t.bgAlt }
        theme.highlights.TelescopeResultsBorder = { fg = t.fg, bg = t.bgAlt }
        theme.highlights.TelescopeResultsNormal = { bg = t.bgAlt }
        theme.highlights.TelescopeResultsTitle = { fg = t.fg, bg = t.bgAlt }

        -- Mimic styling in Grapple
        theme.highlights.GrappleNormal = { bg = t.bgAlt }
        theme.highlights.GrappleBorder = { fg = t.bgAlt, bg = t.bgAlt }
        theme.highlights.GrappleTitle = { fg = t.bgAlt, bg = t.cyan }
    end

    if opts.terminal_colors then
        vim.g.terminal_color_0 = t.bg
        vim.g.terminal_color_8 = t.bgAlt

        vim.g.terminal_color_7 = t.fg
        vim.g.terminal_color_15 = t.syntax

        vim.g.terminal_color_1 = t.attention
        vim.g.terminal_color_9 = t.attention

        vim.g.terminal_color_2 = t.notable
        vim.g.terminal_color_10 = t.notable

        vim.g.terminal_color_3 = t.search
        vim.g.terminal_color_11 = t.search

        vim.g.terminal_color_4 = t.highlight
        vim.g.terminal_color_12 = t.highlight

        vim.g.terminal_color_5 = t.syntax
        vim.g.terminal_color_13 = t.syntax

        vim.g.terminal_color_6 = t.cyan
        vim.g.terminal_color_14 = t.cyan
    end

    -- Use #000000 for full transparency
    if opts.transparent then
        theme.highlights.NotifyBackground = { bg = "#000000" }
    end

    -- Override highlights with user defined highlights
    theme.highlights = vim.tbl_deep_extend("force", theme.highlights, opts.theme.highlights or {})

    return theme
end

return M
