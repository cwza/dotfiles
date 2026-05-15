require("core.keymaps")
require("core.options")
require("core.lsp")
require("core.snippet")

vim.api.nvim_create_autocmd("FileType", {
    desc = "Enable Treesitter features",
    callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if not lang then return end
        if vim.treesitter.query.get(lang, "highlights") then
            vim.treesitter.start(args.buf)
        end
        -- if vim.treesitter.query.get(lang, "indents") then
        --     vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        -- end
        if vim.treesitter.query.get(lang, "folds") then
            vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.wo[0][0].foldmethod = "expr"
        end
    end,
})
