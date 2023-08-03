local prettier = require("prettier")

prettier.setup({
    bin = "prettier",
    filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
    },
})

vim.keymap.set({ "n", "x" }, "<leader>F", function()
    prettier.format()
end, { desc = "format with prettier" })
