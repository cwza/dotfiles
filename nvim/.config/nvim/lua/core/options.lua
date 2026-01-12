-- line
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = false

-- intendention
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- window
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.winborder = "rounded"

-- appearance
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.hlsearch = false

-- fold
vim.opt.foldenable = true
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

-- others
vim.opt.mouse = "a"
vim.opt.clipboard = ""
vim.opt.swapfile = false
vim.opt.backspace = "indent,eol,start"
vim.opt.nrformats:append("alpha")
vim.opt.autoread = true