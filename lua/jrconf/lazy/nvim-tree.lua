return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = {
        "NvimTreeToggle",
        "NvimTreeRefresh",
        "NvimTreeFindFileToggle"
    },
    opts = {
        filters = {
            dotfiles = false,
        },
        view = {
            number = true,
            relativenumber = true,
        },
        renderer = {
            indent_markers = {
                enable = true
            }
        }
    }
}
