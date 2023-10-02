return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- local builtin = require("telescope.builtin")
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				sorting_strategy = "ascending",
				path_display = { "truncate " },
				layout_config = {
					prompt_position = "top",
					width = 0.6,
					height = 0.75,
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<esc>"] = require("telescope.actions").close,
						["<C-BS>"] = require("telescope.actions").delete_buffer,
					},
				},
			},
		})

		vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		-- vim.keymap.set(
		-- 	"n",
		-- 	"<leader>ps",
		-- 	"<cmd>Telescope grep_string<cr>",
		-- 	{ desc = "Find string under cursor in cwd" }
		-- )
		-- vim.keymap.set('n', '<leader>ff', function () builtin.find_files(config) end, {})
		-- vim.keymap.set('n', '<C-p>', function () builtin.git_files(config) end, {})
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
	end,
}
