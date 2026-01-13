vim.g.mapleader = " "

--
vim.keymap.set("n", "<leader>rr", "<cmd>source $MYVIMRC<CR>", { desc = "Reload nvim config" })
vim.keymap.set("n", "<leader>xx", "<cmd>:.lua<CR>", { desc = "Execute the current lua line" })

-- buffer management
vim.keymap.set("n", "<leader>bd", "<cmd>%bd<CR>", { desc = "Close all buffer" })
-- vim.keymap.set("n", "<leader>bd", "<cmd>%bd|e#|bd#<CR>", { desc = "Close all buffer but current" })
vim.keymap.set("n", "[b", "<cmd>bprevious<CR>", { desc = "Go to previous buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<leader>bo", "<cmd>enew<CR>", { desc = "Create a new buffer" })
vim.keymap.set("n", "<leader>br", "<cmd>b#<CR>", { desc = "Go to previously edited buffer" })

-- window management (move, resize and swap are configured by smart-splits plugin)
vim.keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>wH", "<C-w>H", { desc = "Move window to left most" })
vim.keymap.set("n", "<leader>wJ", "<C-w>J", { desc = "Move window to bottom most" })
vim.keymap.set("n", "<leader>wK", "<C-w>K", { desc = "Move window to top most" })
vim.keymap.set("n", "<leader>wL", "<C-w>L", { desc = "Move window to right most" })

-- tab management
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
vim.keymap.set("n", "<leader>tc", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- use U to redo
vim.keymap.set("n", "U", "<C-r>")

-- move block by J, K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- remain cursor while J
vim.keymap.set("n", "J", "mzJ`z")

-- centor after page up down or search up down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- avoid yank when paste or delete
vim.keymap.set("n", "x", [["_x]])
vim.keymap.set("x", "p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- yank and paste to system clipboard
vim.keymap.set("v", "<leader>y", [["+y]], { desc = "Copy selected contents to system keyboard" })
vim.keymap.set("n", "<leader>y", "<cmd>%y+<CR>", { desc = "Copy all file contents to system keyboard" })

-- quickfix list
vim.keymap.set("n", "[q", "<cmd>cprev<CR>", { desc = "Previous quick fix list entry" })
vim.keymap.set("n", "]q", "<cmd>cnext<CR>", { desc = "Next quick fix list entry" })

-- simple replace template
vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "simple replace template" })

-- toggle relative line number
vim.keymap.set("n", "<leader>ul", "<Cmd>set number <bar> setlocal relativenumber!<CR>", { desc = "toggle relative number" })

-- use C-j and C-j to navigate menu
vim.keymap.set('i', '<C-j>', function() return vim.fn.pumvisible() == 1 and '<C-n>' or '<C-j>' end, { expr = true })
vim.keymap.set('i', '<C-k>', function() return vim.fn.pumvisible() == 1 and '<C-p>' or '<C-k>' end, { expr = true })

-- gx to open selected string by system
function GetVisualSelection()
    vim.cmd('silent noau normal "vy')
    local text = vim.fn.getreg("v")
    text = string.gsub(text, "\n", "")
    vim.fn.setreg("v", {})
    return text
end
function OpenBySystem()
    local str = GetVisualSelection()
    if #str >= 1 and str:sub(1, 1) == "~" then
        str = "~" .. vim.fn.shellescape(str:sub(2))
    else
        str = vim.fn.shellescape(str)
    end
    local cmd1 = "cd " .. vim.fn.expand("%:h")
    local cmd2 = "open " .. str
    vim.fn.system(cmd1 .. " && " .. cmd2)
end
vim.keymap.set("v", "gx", OpenBySystem, { desc = "Open selected string by system" })
