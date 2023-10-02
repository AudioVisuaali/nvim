return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
	},
	config = function()
		-- import cmp plugin
		local cmp = require("cmp")

		cmp.setup({
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "buffer" },
			}),
		})

		-- Set up lspconfig.
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		require("lspconfig")["html"].setup({
			capabilities = capabilities,
		})

		require("lspconfig")["tsserver"].setup({
			capabilities = capabilities,
		})

		require("lspconfig")["cssls"].setup({
			capabilities = capabilities,
		})

		require("lspconfig")["tailwindcss"].setup({
			capabilities = capabilities,
		})

		require("lspconfig")["prismals"].setup({
			capabilities = capabilities,
		})

		require("lspconfig")["graphql"].setup({
			capabilities = capabilities,
		})

		require("lspconfig")["eslint"].setup({
			capabilities = capabilities,
		})

		require("lspconfig")["pyright"].setup({
			capabilities = capabilities,
		})

		require("lspconfig")["lua_ls"].setup({
			capabilities = capabilities,
		})
	end,
}
