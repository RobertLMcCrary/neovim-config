vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.guicursor = "a:block"
--vim.opt.number = false
--vim.opt.relativenumber = false
vim.g.lazyvim_rust_diagnostics = false
vim.lsp.inlay_hint.enable(false)

--line numbers
vim.opt.number = true
vim.opt.relativenumber = true

--line wrapping
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.sidescroll = 1
vim.opt.list = false

--showing error and warning icons and text
local signs = {
    Error = "󰅚",
    Warn  = "󰀪",
    Hint  = "󰌶",
    Info  = "󰄬",
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    prefix = "●",
  },
})

