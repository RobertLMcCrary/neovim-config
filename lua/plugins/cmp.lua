return {
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({

                    -- Tab confirms/pastes the currently selected item
                    ["<Tab>"] = cmp.mapping.confirm({ select = true }),

                    -- Select prev/next item
                    ["<S-j>"] = cmp.mapping.select_next_item(),
                    ["<S-k>"] = cmp.mapping.select_prev_item(),

                    -- Abort/close the menu
                    ["<S-e>"] = cmp.mapping.abort(),

                    -- Scroll docs
                    ["<S-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<S-f>"] = cmp.mapping.scroll_docs(4),

                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                },
            })
        end,
    },
}
