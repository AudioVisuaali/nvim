-- Function to check if a file exists in the current directory
local function file_exists_in_current_directory(filename)
	local current_directory = vim.fn.getcwd()
	local file_path = current_directory .. "/" .. filename

	local f = io.open(file_path, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

return {
	"stevearc/conform.nvim",
	event = { "BufRead", "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		local js_formatter = file_exists_in_current_directory("biome.json") and { "biome" } or { "eslint_d" }

		conform.setup({
			formatters_by_ft = {
				javascript = js_formatter,
				typescript = js_formatter,
				javascriptreact = js_formatter,
				typescriptreact = js_formatter,
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				terraform = { "tflint" },
				python = { "isort", "black" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 2000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 0,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
