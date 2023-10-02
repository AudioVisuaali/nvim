return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set(
			"n",
			"<leader>hm",
			':lua require("harpoon.ui").toggle_quick_menu()<cr>',
			{ desc = "Mark file with harpoon" }
		)
		keymap.set(
			"n",
			"<leader>ha",
			"<cmd>lua require('harpoon.mark').add_file()<cr>",
			{ desc = "Mark file with harpoon" }
		)
		keymap.set("n", "<leader>h1", ':lua require("harpoon.ui").nav_file(1)<cr>', { desc = "Mark file with harpoon" })
		keymap.set("n", "<leader>h2", ':lua require("harpoon.ui").nav_file(2)<cr>', { desc = "Mark file with harpoon" })
		keymap.set("n", "<leader>h3", ':lua require("harpoon.ui").nav_file(3)<cr>', { desc = "Mark file with harpoon" })
		keymap.set("n", "<leader>h4", ':lua require("harpoon.ui").nav_file(4)<cr>', { desc = "Mark file with harpoon" })
		keymap.set("n", "<leader>h5", ':lua require("harpoon.ui").nav_file(5)<cr>', { desc = "Mark file with harpoon" })
		keymap.set("n", "<leader>h6", ':lua require("harpoon.ui").nav_file(6)<cr>', { desc = "Mark file with harpoon" })
		keymap.set("n", "<leader>h7", ':lua require("harpoon.ui").nav_file(7)<cr>', { desc = "Mark file with harpoon" })
		keymap.set("n", "<leader>h8", ':lua require("harpoon.ui").nav_file(8)<cr>', { desc = "Mark file with harpoon" })
		keymap.set("n", "<leader>h9", ':lua require("harpoon.ui").nav_file(9)<cr>', { desc = "Mark file with harpoon" })
	end,
}
