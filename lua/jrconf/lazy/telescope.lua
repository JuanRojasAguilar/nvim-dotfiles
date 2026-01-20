return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    module = "telescope",
    config = function()
        require("telescope").setup({})

        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>fg", builtin.git_files, {}) -- Find Git
        vim.keymap.set("n", "<leader>fr", builtin.live_grep, {}) -- Find Recursive
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {}) -- Find Files
        vim.keymap.set("n", "<leader>fb", builtin.buffers, {}) -- Find Buffers
        vim.keymap.set("n", "<leader>fh", ":Telescope find_files hidden=true <CR>") -- Find Hidden

        vim.keymap.set("n", "<leader>pws", function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end) -- Cursor word grep (?
        vim.keymap.set("n", "<leader>pWs", function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end) -- Cursor word-line grep (?
    end
}
