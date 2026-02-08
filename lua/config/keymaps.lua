local opts = { noremap = true, silent = true }

--Using Ghostty for navigation
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

-- TELESCOPE
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>e', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

