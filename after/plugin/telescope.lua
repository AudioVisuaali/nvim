local builtin = require('telescope.builtin')
local telescope = require('telescope')

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close,
        ["<C-BS>"] = require('telescope.actions').delete_buffer
      },
    },
  },
}


local config = {
  sorting_strategy = "ascending",
  layout_config={
    width=0.6,
    height=0.75,
    prompt_position = "top",
  }
}

local function combine(t1, t2)
  for k, v in pairs(t2) do
    t1[k] = v
  end
  return t1
end

vim.keymap.set('n', '<leader>ff', function () builtin.find_files(config) end, {})
vim.keymap.set('n', '<C-p>', function () builtin.git_files(config) end, {})
vim.keymap.set('n', '<leader>ps', function ()
	builtin.grep_string(combine(config, { search = vim.fn.input("Grep > ") }));
end)

