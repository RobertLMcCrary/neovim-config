local opts = { noremap = true, silent = true }

--Using harpoon for main buffer system
-- NAVIGATION (Switch buffers)
--vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)
--vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)

-- SPLIT WINDOWS
--vim.keymap.set("n", "<leader>v", ":vsplit<CR>", opts)
--vim.keymap.set("n", "<leader>s", ":split<CR>", opts)

-- WINDOW/PANE NAVIGATION
--vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
--vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
--vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
--vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- EXIT INSERT MODE WITH 'jk'
vim.keymap.set("i", "jk", "<Esc>", opts)
-- OPEN NETRW WITH "leader E"
--vim.keymap.set("n", "<leader>E", ":Ex<CR>")

-- TELESCOPE
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- HARPOON
local ok, harpoon = pcall(require, "harpoon")
-- REQUIRED
harpoon:setup()
-- REQUIRED
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<S-h>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<S-l>", function() harpoon:list():next() end)

-- NEOTREE
vim.keymap.set("n", "<leader>E", ":Neotree filesystem reveal toggle<CR>", { desc = "Toggle Neotree" })

-- LSP Keymaps
-- LSP Keymaps (put this AFTER your plugin specs)
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
    callback = function(ev)
        local opts = { buffer = ev.buf, noremap = true, silent = true }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
        end, opts)
    end,
})
