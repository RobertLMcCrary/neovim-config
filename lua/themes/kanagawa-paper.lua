return {
    "thesimonho/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    init = function()
        -- dark
        vim.cmd.colorscheme("kanagawa-paper-ink")
        --light
        --vim.cmd.colorscheme("kanagawa-paper-canvas")
    end,
    opts = {
        styles = {
            comment = { italic = true },
            functions = { italic = false },
            keyword = { italic = false, bold = true },
            statement = { italic = false, bold = false },
            type = { italic = false },
        }
    },
}
