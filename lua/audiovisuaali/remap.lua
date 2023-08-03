vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.api.nvim_set_keymap('n', '<C-d>', '10jzz', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-u>', '10kzz', {noremap = true})

-- Next Definition
vim.api.nvim_set_keymap('n', 'ö', '[m', { noremap = true, silent = true })

-- Previous Definition
vim.api.nvim_set_keymap('n', 'ä', ']m', { noremap = true, silent = true })

