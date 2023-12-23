return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"<leader>gf",
			function()
				vim.cmd("Gitsigns toggle_linehl")
				vim.cmd("Gitsigns toggle_signs")
			end,
			desc = "git toggle linehl",
		},
	},
	config = function()
		require("gitsigns").setup({
			signcolumn = false,
			current_line_blame = true,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol",
				delay = 2000,
				ignore_whitespace = false,
				virt_text_priority = 100,
			},
		})
	end,
}
