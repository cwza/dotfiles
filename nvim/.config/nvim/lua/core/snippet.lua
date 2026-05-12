local snippets_dir = vim.fn.stdpath("config") .. "/snippets/"

-- example of snippet
-- "for ${1:key}, ${2:value} in pairs(${3:table}) do\n\t$0\nend"

function AddSnippet()
    local trigger = vim.fn.expand("<cWORD>")
    local extend = vim.fn.expand("%:e")
    local status, content = pcall(function() return vim.fn.readblob(snippets_dir .. trigger .. "." .. extend) end)
    if status then
        vim.cmd([[normal diW]])
        vim.snippet.expand(content)
    end
end

vim.keymap.set("i", "<C-s>", "<esc>:lua AddSnippet()<cr>")

vim.keymap.set({ "i", "s" }, "<Tab>", function()
    if vim.snippet.active({ direction = 1 }) then
        return "<cmd>lua vim.snippet.jump(1)<cr>"
    else
        return "<Tab>"
    end
end, { expr = true })


