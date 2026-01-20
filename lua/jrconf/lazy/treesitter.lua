return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "javascript",
            "css",
            "go",
            "bash",
            "jsdoc",
            "html",
            "json",
            "markdown",
            "markdown_inline",
            "yaml",
            "tsx",
            "graphql",
            -- Below parsers are a MUST
            "lua",
            "vim",
            "vimdoc",
            "c",
            "query"
        }
    },
    config = function(_, opts)
        -- Install opts.ensure_installed
        if opts.ensure_installed and #opts.ensure_installed > 0 then
            treesitter_handler = require("nvim-treesitter")

            treesitter_handler.install(opts.ensure_installed)
            treesitter_handler.setup({
                    sync_install = false,
                    auto_install = true,
                    highlight = {
                        enable = true,
                        additional_vim_regex_highlighting = false,
                    },
                    indent = {
                        enable = true,
                        disable = { "python", "c" }
                    }
                })

            for _, parser in ipairs(opts.ensure_installed) do
                local filetypes = parser
                vim.treesitter.language.register(parser, filetypes)

                vim.api.nvim_create_autocmd({ "FileType" }, {
                    pattern = filetypes,
                    callback = function(event)
                        vim.treesitter.start(event.buf, parser)
                    end,
                })
            end
        end
    end
}
