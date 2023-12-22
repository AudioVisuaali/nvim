local function is_in_forbidden_directoyry()
	local current_directory = vim.fn.getcwd()

	if string.find(current_directory, "oma") then
		return true
	else
		return false
	end
end

return {
	"github/copilot.vim",
	enabled = not is_in_forbidden_directoyry(),
}
