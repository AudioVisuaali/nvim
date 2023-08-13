-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({ 'rose-pine/neovim', as = 'rose-pine' })

  vim.cmd('colorscheme rose-pine')
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
  use('mbbill/undotree')
  use('github/copilot.vim')
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required

      -- prettier format
      { 'jose-elias-alvarez/null-ls.nvim' },
      { 'MunifTanjim/prettier.nvim' },
    }
  }

  use("eandrju/cellular-automaton.nvim")
  use {
   'nvim-lualine/lualine.nvim',
   requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {
	  "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup() end
  }

  use {
    'windwp/nvim-ts-autotag',
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function() require('nvim-ts-autotag').setup() end
  }

  use('iamcco/markdown-preview.nvim')
  use('AndrewRadev/tagalong.vim')

  use {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  }

  use('nvim-tree/nvim-web-devicons')

  use('alec-gibson/nvim-tetris')
end)
