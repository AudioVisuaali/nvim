return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		-- configure lualine with modified theme
		lualine.setup({
			sections = {
				lualine_a = { "mode" },
				lualine_b = {},
				lualine_c = { { "filename", path = 1, file_status = true } },
				lualine_x = {
					{ "filetype" },
				},
				lualine_y = {},
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1, file_status = true } },
				lualine_x = { "filetype" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
