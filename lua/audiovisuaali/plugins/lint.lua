-- Function to check if a file exists in the current directory
local function file_exists_in_current_directory(filename)
	local current_directory = vim.fn.getcwd()
	local file_path = current_directory .. "/" .. filename
	print(current_directory)

	local f = io.open(file_path, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

return {
	"mfussenegger/nvim-lint",
	event = { "BufRead", "BufReadPre", "BufNewFile", "TextChanged" },
	config = function()
		local lint = require("lint")

		local is_biome = file_exists_in_current_directory("biome.json")

		local js_formatter = is_biome and { "biomejs" } or { "eslint_d" }

		lint.linters_by_ft = {
			graphql = { "eslint_d" },
			javascript = js_formatter,
			typescript = js_formatter,
			javascriptreact = js_formatter,
			typescriptreact = js_formatter,
			python = { "pylint" },
		}

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
