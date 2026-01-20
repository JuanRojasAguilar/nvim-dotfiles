return {
	"akinsho/bufferline.nvim",
	event = "BufReadPost",
	opts = {
		options = {
            buffer_close_icon = "❌",
			numbers = "ordinal",
			offsets = { { filetype = "alpha", text = "", padding = 1 } },
			max_name_length = 22,
			max_prefix_length = 15,
			show_tab_indicators = true,
			enforce_regular_tabs = false,
			view = "multiwindow",
			show_bugger_close_icons = true,
			separator_style = "thin",
			always_show_bufferline = true,
			diagnostics = "nvim_lsp"
		}
	},
	init = function()
		vim.opt.termguicolors = true
	end
}
