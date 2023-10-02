return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		-- configure lualine with modified theme
		lualine.setup({
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { { "filename", path = 1, file_status = true } },
				lualine_x = {
					{ "filetype" },
				},
				lualine_y = {},
				lualine_z = { "location" },
			},
		})
	end,
}
