return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        require("mason").setup()

        require("mason-lspconfig").setup({
            ensure_installed = { "gopls", "lua_ls", "rust_analyzer", "ts_ls" },
            automatic_installation = true,
        })

        local lspconfig = require("lspconfig")
        local caps = require("cmp_nvim_lsp").default_capabilities()

        lspconfig.gopls.setup({ capabilities = caps })
        lspconfig.lua_ls.setup({ capabilities = caps })
        -- add others if desired
    end,
}

