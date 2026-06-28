return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.install").compilers = { "clang", "gcc" }

        -- The new nvim-treesitter removed ensure_installed and highlight.enable from setup().
        -- Install parsers explicitly; this is a no-op for already-installed parsers.
        local parsers = {
            "elixir", "heex", "eex",
            "lua", "rust", "go",
            "typescript", "javascript", "css", "html", "svelte",
        }
        require("nvim-treesitter.install").install(parsers, { summary = false })

        -- Enable treesitter highlighting for any filetype that has an installed parser.
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(ev)
                local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
                if lang then
                    pcall(vim.treesitter.start, ev.buf, lang)
                end
            end,
        })
    end,
}
