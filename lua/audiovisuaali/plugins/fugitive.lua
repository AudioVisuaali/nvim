return {
	"tpope/vim-fugitive",
	keys = {
		{
			"<leader>gs",
			function()
				vim.cmd("vert Git")
			end,
			desc = "git fugitive",
		},
		{ "<leader>gv", ":Gvdiffsplit<CR>", desc = "git diff split" },
	},
}
