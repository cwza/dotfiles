vim.api.nvim_create_autocmd('PackChanged', {
    desc = "Build telescope-fzf-narive.nvim",
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
            vim.system({ "make" }, { cwd = ev.data.path }):wait()
        end
    end,
})

vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
})


local telescope = require("telescope")
local actions = require("telescope.actions")
telescope.setup({
    defaults = {
        initial_mode = "normal",
        path_display = { "smart" },
        mappings = {
            i = {
                ["<c-k>"] = actions.move_selection_previous, -- move to prev result
                ["<c-j>"] = actions.move_selection_next, -- move to next result
                ["<c-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
            n = {
                ["d"] = actions.delete_buffer, -- delete buffer
            },
        },
    },
})
telescope.load_extension('fzf')

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "fuzzy find files" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "fuzzy find buffers" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "fuzzy find recent files" })
vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "find string" })
vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "find string under cursor" })
