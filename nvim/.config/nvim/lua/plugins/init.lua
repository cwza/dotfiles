vim.pack.add({
    "https://github.com/bluz71/vim-nightfly-colors",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/folke/which-key.nvim",
    "https://github.com/szw/vim-maximizer",
    "https://github.com/kylechui/nvim-surround",
    "https://github.com/lukas-reineke/indent-blankline.nvim",
    "https://github.com/lewis6991/gitsigns.nvim"
})
vim.cmd([[colorscheme nightfly]])
vim.keymap.set('n', '<leader>wm', "<cmd>MaximizerToggle<CR>", { desc = "Maximize/minimize a split" })
require("nvim-surround").setup({})
require("ibl").setup({})

require("plugins.treesitter")
require("plugins.smart-splits")
require("plugins.telescope")
require("plugins.headlines")
require("plugins.luasnip")
require("plugins.markdown-preview")
