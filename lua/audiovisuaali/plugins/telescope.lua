return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{
			";;",

			function()
				local builtin = require("telescope.builtin")
				builtin.resume()
			end,
			desc = "Resume the previous telescope picker",
		},
		{
			";e",
			function()
				local builtin = require("telescope.builtin")
				builtin.diagnostics()
			end,
			desc = "Lists Diagnostics for all open buffers or a specific buffer",
		},
		{
			";s",
			function()
				local builtin = require("telescope.builtin")
				builtin.treesitter()
			end,
			desc = "Lists Function names, variables, from Treesitter",
		},
		{
			";r",
			function()
				local builtin = require("telescope.builtin")
				builtin.live_grep()
			end,
			desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
		},
		{
			";b",
			function()
				local builtin = require("telescope.builtin")
				builtin.buffers()
			end,
			desc = "Lists open buffers",
		},
		{
			"<C-p>",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Find File",
		},
	},
	config = function()
		-- local builtin = require("telescope.builtin")
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local colors = require("rose-pine.palette")

		local highlights = {
			-- https://github.com/nvim-telescope/telescope.nvim/blob/39b12d84e86f5054e2ed98829b367598ae53ab41/plugin/telescope.lua#L11-L91
			-- https://github.com/rose-pine/neovim/blob/main/lua/rose-pine/palette.lua
			TelescopePromptNormal = { bg = colors.overlay },
			TelescopePromptBorder = { fg = colors.overlay, bg = colors.overlay },

			TelescopeBorder = { fg = colors.surface, bg = colors.surface },
			TelescopeResultsBorder = { default = true, link = "TelescopeBorder" },
			TelescopePreviewBorder = { default = true, link = "TelescopeBorder" },

			TelescopePromptTitle = { fg = colors.base, bg = colors.rose },
			TelescopeResultsTitle = { fg = colors.surface, bg = colors.surface },
			TelescopePreviewTitle = { fg = colors.text, bg = colors.pine },
		}
		for k, v in pairs(highlights) do
			vim.api.nvim_set_hl(0, k, v)
		end

		telescope.setup({
			pickers = {
				find_files = {
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
			},
			defaults = {
				file_ignore_patterns = { ".next", ".git/", "node_modules/" },
				hidden = true,
				respect_gitignore = false,
				sorting_strategy = "ascending",
				path_display = { "truncate " },
				border = {},
				pickers = {
					find_files = {
						find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
						-- hidden = true,
					},
				},
				layout_config = {
					prompt_position = "top",
					width = 0.72,
					height = 0.8,
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<esc>"] = require("telescope.actions").close,
						["<C-c>"] = require("telescope.actions").close,

						["<Shift-u>"] = actions.preview_scrolling_up,
						["<Shift-d>"] = actions.preview_scrolling_down,

						["<C-d>"] = actions.results_scrolling_up,
						["<C-u>"] = actions.results_scrolling_down,
					},
				},
			},
		})
	end,
}
