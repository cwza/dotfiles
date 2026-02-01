local log = require("log")
vim.api.nvim_create_autocmd('PackChanged', {
    desc = "Build LuaSnip",
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == "LuaSnip" and (kind == "install" or kind == "update") then
            log:write(ev.data.path)
            vim.system({ "make", "install_jsregexp" }, { cwd = ev.data.path }):wait()
        end
    end,
})

vim.pack.add({ "https://github.com/L3MON4D3/LuaSnip" })

local ls = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load({ paths = "./snippets" })

vim.keymap.set({"i"}, "<C-Space>", function() ls.expand() end, {silent = true})
