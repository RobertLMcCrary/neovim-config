-- LSP Format on Save
--[[
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})
--]]

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function(args)
        local ok, conform = pcall(require, "conform")
        if ok then
            conform.format({ bufnr = args.buf, async = true, lsp_fallback = true })
        else
            vim.lsp.buf.format({ bufnr = args.buf, async = true })
        end
    end,
})
