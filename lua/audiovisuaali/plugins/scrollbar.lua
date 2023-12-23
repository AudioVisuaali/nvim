return {
	"petertriho/nvim-scrollbar",
	config = function()
		local colors = require("rose-pine.palette")

		require("scrollbar").setup({
			handle = {
				color = colors.highlight_high,
			},
			handlers = {
				cursor = false,
				gitsigns = true,
			},
		})
	end,
}
