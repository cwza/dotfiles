vim.pack.add({ "https://github.com/lukas-reineke/headlines.nvim" })

vim.cmd([[highlight Headline1 guifg=#f1fc79 guibg=#606430]])
vim.cmd([[highlight Headline2 guifg=#37f499 guibg=#16613d]])
vim.cmd([[highlight Headline3 guifg=#04d1f9 guibg=#015363]])
vim.cmd([[highlight Headline4 guifg=#f16c75 guibg=#602b2e]])
vim.cmd([[highlight Headline5 guifg=#7081d0 guibg=#2c3353]])
vim.cmd([[highlight Headline6 guifg=#f265b5 guibg=#602848]])
vim.cmd([[highlight CodeBlock guibg=#09090d]])
require("headlines").setup({
    markdown = {
        fat_headlines = false,
        fat_headline_upper_string = "▄",
        fat_headline_lower_string = "▀",
        headline_highlights = {
            "Headline1",
            "Headline2",
            "Headline3",
            "Headline4",
            "Headline5",
            "Headline6",
        },
        bullets = { "󰎤", "󰎧", "󰎪", "󰎭", "󰎱", "󰎳" },
    },
})