return {
    "Mofiqul/vscode.nvim",
    priority = 1000,
    config = function()
        require("vscode").setup({
            --style = "dark",
            style = "light" -- use light mode if bright outside
            -- transparent = true
        })
        vim.cmd.colorscheme("vscode")
    end,
}
