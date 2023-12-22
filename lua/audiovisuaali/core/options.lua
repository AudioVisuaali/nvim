vim.wo.number = false
vim.wo.relativenumber = false
vim.wo.wrap = false

vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.config/nvim/undodir")

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "no"

vim.opt.updatetime = 0

vim.opt.colorcolumn = "80"
vim.opt.fillchars = { eob = " " }

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
vim.api.nvim_set_hl(0, "Foo", { undercurl = true, sp = "#ffff00" })
