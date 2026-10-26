-- Utility to capture highlight groups under cursor
-- Usage: :lua require('test_highlights').show()

local M = {}

function M.show()
    local line = vim.fn.line('.')
    local col = vim.fn.col('.')
    
    -- Get all highlight groups at cursor position
    local result = vim.treesitter.get_captures_at_cursor(0)
    
    print("=== Tree-sitter Highlight Groups at Cursor ===")
    for _, capture in ipairs(result) do
        print(capture)
    end
    
    -- Also show syntax stack (for non-treesitter highlights)
    print("\n=== Syntax Stack ===")
    for _, syn_id in ipairs(vim.fn.synstack(line, col)) do
        local syn_name = vim.fn.synIDattr(syn_id, "name")
        print(syn_name)
    end
end

function M.dump_all_ts_highlights()
    -- Get all available TypeScript/TypeScriptReact highlight groups
    local highlights = {}
    
    -- Common TypeScript tree-sitter highlight groups
    local ts_groups = {
        "@type.typescript",
        "@type.builtin.typescript",
        "@type.definition.typescript",
        "@type.qualifier.typescript",
        "@constructor.typescript",
        "@parameter.typescript",
        "@variable.typescript",
        "@variable.builtin.typescript",
        "@variable.member.typescript",
        "@constant.typescript",
        "@constant.builtin.typescript",
        "@function.typescript",
        "@function.call.typescript",
        "@function.method.typescript",
        "@function.method.call.typescript",
        "@method.typescript",
        "@method.call.typescript",
        "@keyword.typescript",
        "@keyword.function.typescript",
        "@keyword.operator.typescript",
        "@keyword.return.typescript",
        "@keyword.import.typescript",
        "@keyword.export.typescript",
        "@conditional.typescript",
        "@repeat.typescript",
        "@label.typescript",
        "@operator.typescript",
        "@exception.typescript",
        "@include.typescript",
        "@punctuation.delimiter.typescript",
        "@punctuation.bracket.typescript",
        "@punctuation.special.typescript",
        "@string.typescript",
        "@string.regex.typescript",
        "@string.escape.typescript",
        "@string.special.typescript",
        "@character.typescript",
        "@character.special.typescript",
        "@number.typescript",
        "@boolean.typescript",
        "@float.typescript",
        "@namespace.typescript",
        "@symbol.typescript",
        "@property.typescript",
        "@field.typescript",
        "@comment.typescript",
        "@comment.documentation.typescript",
        "@tag.typescript",
        "@tag.attribute.typescript",
        "@tag.delimiter.typescript",
        "@tag.tsx",
        "@tag.attribute.tsx",
        "@tag.delimiter.tsx",
        "@constructor.tsx",
        "@keyword.tsx",
    }
    
    print("=== Available TypeScript Highlight Groups ===")
    for _, group in ipairs(ts_groups) do
        local hl = vim.api.nvim_get_hl_by_name(group, true)
        if next(hl) then
            print(string.format("%s: %s", group, vim.inspect(hl)))
        end
    end
end

return M