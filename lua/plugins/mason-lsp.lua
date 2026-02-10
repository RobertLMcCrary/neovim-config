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


--[[
return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = { 
            "lua_ls",
            "rust_analyzer",
            "gopls",
            "ts_ls"
        },
        automatic_enable = {
            "lua_ls",
            "gopls",
            "ts_ls"
        }
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
--]]


