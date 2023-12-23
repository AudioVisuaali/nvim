return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		vim.keymap.set("n", "<leader>ll", function()
			if vim.o.ls == 2 then
				vim.opt.ruler = false
				vim.o.ls = 0
			else
				vim.opt.ruler = true
				vim.o.ls = 2
			end
		end, { noremap = true, silent = true })

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				disabled_filetypes = { "", "NvimTree" },
			},
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
