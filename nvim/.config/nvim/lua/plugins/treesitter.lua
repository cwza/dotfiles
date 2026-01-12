vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
    "https://github.com/nvim-treesitter/nvim-treesitter-context",
    {src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
})


------------------------------------------------------------- nvim-treesitter
local ts = require("nvim-treesitter")
ts.install({
    "lua",
    "bash",
    "c",
    "cpp",
    "markdown",
    "markdown_inline",
})
vim.api.nvim_create_autocmd('PackChanged', {
    desc = 'Handle nvim-treesitter updates',
    callback = function(event)
        if event.data.kind == 'update' and event.data.spec.name == 'nvim-treesitter' then
            ts.update()
        end
    end,
})
vim.api.nvim_create_autocmd("FileType", {
    desc = 'Enable Treesitter features',
    callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if not lang then return end
        if vim.treesitter.query.get(lang, "highlights") then
            vim.treesitter.start(args.buf)
        end
        if vim.treesitter.query.get(lang, "indents") then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
        if vim.treesitter.query.get(lang, "folds") then
            vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            vim.wo[0][0].foldmethod = 'expr'
        end
    end,
})


---------------------------------------------------------- nvim-treesitter-context
require("treesitter-context").setup({
    max_lines = 3,
    multiline_threshold = 1,
    separator = '-',
    min_window_height = 20,
    line_numbers = true,
})


---------------------------------------------------------- nvim-treesitter-textobjects
---- select
require("nvim-treesitter-textobjects").setup({ select = {lookahead = true} })
local tscs = require("nvim-treesitter-textobjects.select")
vim.keymap.set({ "x", "o" }, "a=", function() tscs.select_textobject("@assignment.outer", "textobjects") end, { desc = "Select outer part of an assignment" })
vim.keymap.set({ "x", "o" }, "i=", function() tscs.select_textobject("@assignment.inner", "textobjects") end, { desc = "Select inner part of an assignment" })
vim.keymap.set({ "x", "o" }, "l=", function() tscs.select_textobject("@assignment.lhs", "textobjects") end, { desc = "Select left hand side of an assignment" })
vim.keymap.set({ "x", "o" }, "r=", function() tscs.select_textobject("@assignment.rhs", "textobjects") end, { desc = "Select right hand side of an assignment" })
vim.keymap.set({ "x", "o" }, "aa", function() tscs.select_textobject("@parameter.outer", "textobjects") end, { desc = "Select outer part of a parameter/argument" })
vim.keymap.set({ "x", "o" }, "ia", function() tscs.select_textobject("@parameter.inner", "textobjects") end, { desc = "Select inner part of a parameter/argument" })
vim.keymap.set({ "x", "o" }, "ai", function() tscs.select_textobject("@conditional.outer", "textobjects") end, { desc = "Select outer part of a conditional" })
vim.keymap.set({ "x", "o" }, "ii", function() tscs.select_textobject("@conditional.inner", "textobjects") end, { desc = "Select inner part of a conditional" })
vim.keymap.set({ "x", "o" }, "al", function() tscs.select_textobject("@loop.outer", "textobjects") end, { desc = "Select outer part of a loop" })
vim.keymap.set({ "x", "o" }, "il", function() tscs.select_textobject("@loop.inner", "textobjects") end, { desc = "Select inner part of a loop" })
vim.keymap.set({ "x", "o" }, "af", function() tscs.select_textobject("@call.outer", "textobjects") end, { desc = "Select outer part of a function call" })
vim.keymap.set({ "x", "o" }, "if", function() tscs.select_textobject("@call.inner", "textobjects") end, { desc = "Select inner part of a function call" })
vim.keymap.set({ "x", "o" }, "am", function() tscs.select_textobject("@function.outer", "textobjects") end, { desc = "Select outer part of a method/function definition" })
vim.keymap.set({ "x", "o" }, "im", function() tscs.select_textobject("@function.inner", "textobjects") end, { desc = "Select inner part of a method/function definition" })
vim.keymap.set({ "x", "o" }, "ac", function() tscs.select_textobject("@class.outer", "textobjects") end, { desc = "Select outer part of a class" })
vim.keymap.set({ "x", "o" }, "ic", function() tscs.select_textobject("@class.inner", "textobjects") end, { desc = "Select inner part of a class" })
vim.keymap.set({ "x", "o" }, "iB", function() tscs.select_textobject("@block.inner", "textobjects") end, { desc = "Select inner part of a block" })
vim.keymap.set({ "x", "o" }, "aB", function() tscs.select_textobject("@block.outer", "textobjects") end, { desc = "Select outer part of a block" })

---- move
require("nvim-treesitter-textobjects").setup({ move = {set_jumps = true} })
local tscm = require("nvim-treesitter-textobjects.move")
-- goto next start
vim.keymap.set({ "n", "x", "o" }, "]f", function() tscm.goto_next_start("@call.outer", "textobjects") end, { desc = "Next function call start" })
vim.keymap.set({ "n", "x", "o" }, "]m", function() tscm.goto_next_start("@function.outer", "textobjects") end, { desc = "Next method/function def start" })
vim.keymap.set({ "n", "x", "o" }, "]c", function() tscm.goto_next_start("@class.outer", "textobjects") end, { desc = "Next class start" })
vim.keymap.set({ "n", "x", "o" }, "]i", function() tscm.goto_next_start("@conditional.outer", "textobjects") end, { desc = "Next conditional start" })
vim.keymap.set({ "n", "x", "o" }, "]l", function() tscm.goto_next_start("@loop.outer", "textobjects") end, { desc = "Next loop start" })
vim.keymap.set({ "n", "x", "o" }, "]s", function() tscm.goto_next_start("@local.scope", "locals") end, { desc = "Next scope" })
vim.keymap.set({ "n", "x", "o" }, "]z", function() tscm.goto_next_start("@fold", "folds") end, { desc = "Next fold" })
-- goto next end
vim.keymap.set({ "n", "x", "o" }, "]F", function() tscm.goto_next_end("@call.outer", "textobjects") end, { desc = "Next function call end" })
vim.keymap.set({ "n", "x", "o" }, "]M", function() tscm.goto_next_end("@function.outer", "textobjects") end, { desc = "Next method/function def end" })
vim.keymap.set({ "n", "x", "o" }, "]C", function() tscm.goto_next_end("@class.outer", "textobjects") end, { desc = "Next class end" })
vim.keymap.set({ "n", "x", "o" }, "]I", function() tscm.goto_next_end("@conditional.outer", "textobjects") end, { desc = "Next conditional end" })
vim.keymap.set({ "n", "x", "o" }, "]L", function() tscm.goto_next_end("@loop.outer", "textobjects") end, { desc = "Next loop end" })
-- goto previous start
vim.keymap.set({ "n", "x", "o" }, "[f", function() tscm.goto_previous_start("@call.outer", "textobjects") end, { desc = "Prev function call start" })
vim.keymap.set({ "n", "x", "o" }, "[m", function() tscm.goto_previous_start("@function.outer", "textobjects") end, { desc = "Prev method/function def start" })
vim.keymap.set({ "n", "x", "o" }, "[c", function() tscm.goto_previous_start("@class.outer", "textobjects") end, { desc = "Prev class start" })
vim.keymap.set({ "n", "x", "o" }, "[i", function() tscm.goto_previous_start("@conditional.outer", "textobjects") end, { desc = "Prev conditional start" })
vim.keymap.set({ "n", "x", "o" }, "[l", function() tscm.goto_previous_start("@loop.outer", "textobjects") end, { desc = "Prev loop start" })
-- goto previous end
vim.keymap.set({ "n", "x", "o" }, "[F", function() tscm.goto_previous_end("@call.outer", "textobjects") end, { desc = "Prev function call end" })
vim.keymap.set({ "n", "x", "o" }, "[M", function() tscm.goto_previous_end("@function.outer", "textobjects") end, { desc = "Prev method/function def end" })
vim.keymap.set({ "n", "x", "o" }, "[C", function() tscm.goto_previous_end("@class.outer", "textobjects") end, { desc = "Prev class end" })
vim.keymap.set({ "n", "x", "o" }, "[I", function() tscm.goto_previous_end("@conditional.outer", "textobjects") end, { desc = "Prev conditional end" })
vim.keymap.set({ "n", "x", "o" }, "[L", function() tscm.goto_previous_end("@loop.outer", "textobjects") end, { desc = "Prev loop end" })

---- repeatable move
local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")
-- vim way: ; goes to the direction you were moving.
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
