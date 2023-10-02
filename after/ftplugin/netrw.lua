-- https://github.com/christoomey/vim-tmux-navigator/issues/251
vim.api.nvim_buf_set_keymap(0, "n", "<C-l>", ":TmuxNavigateRight<cr>", { noremap = true, silent = true })
