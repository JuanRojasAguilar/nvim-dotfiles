-- Exit insert with kj combo
vim.keymap.set("i", "kj", "<Esc>", { noremap = true, silent = true })

-- Standarize nN search behavior
vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true })

-- Resize Windows shift + <arrow>
vim.keymap.set("n", "<S-Up>", "<CMD>resize +2<CR>")
vim.keymap.set("n", "<S-Down>", "<CMD>resize -2<CR>")
vim.keymap.set("n", "<S-Left>", "<CMD>vertical resize -2<CR>")
vim.keymap.set("n", "<S-Right>", "<CMD>vertical resize +2<CR>")

-- Switch buffers with tab
vim.keymap.set("n", "<S-TAB>", "<CMD>bprevious<CR>")
vim.keymap.set("n", "<TAB>", "<CMD>bnext<CR>")

-- Open filetree
vim.keymap.set("n", "<C-n>", "<CMD>NvimTreeToggle<CR>")

-- Highlight lo que copio
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlights text when yanking",
    group = vim.api.nvim_create_augroup(
        "kickstart-highlight-yank", 
        {clear = true}
    ),
    callback = function ()
        vim.highlight.on_yank()
    end,

})
