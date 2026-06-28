return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                nix = { "nixpkgs_fmt" },
                --elixir = { "mix" },
                --heex = { "mix" },
                --eex = { "mix" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = false,
            },
        })
    end,
}
