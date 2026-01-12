vim.api.nvim_create_autocmd('PackChanged', {
    desc = "Build markdown-preview.nvim",
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == "markdown-preview.nvim" and (kind == "install" or kind == "update") then
            vim.pack.add({ "https://github.com/iamcco/markdown-preview.nvim" })
            vim.fn["mkdp#util#install"]()
        end
    end,
})

vim.pack.add({ "https://github.com/iamcco/markdown-preview.nvim" })

vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle markdown preview" })
