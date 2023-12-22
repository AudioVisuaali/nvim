return {
	"ms-jpq/coq_nvim",
	dependencies = {
		{ "ms-jpq/coq.artifacts", branch = "artifacts" },
		{ "ms-jpq/coq.thirdparty", branch = "3p" },
	},
	branch = "coq",
	config = function()
		vim.g.coq_settings = {
			match = {
				fuzzy_cutoff = 0.8,
				max_results = 16,
				exact_matches = 5,
			},
			weights = {
				proximity = 0.3,
				recency = 2,
			},
			keymap = {
				jump_to_mark = "",
			},
		}

		vim.cmd("COQnow -s")
	end,
}
