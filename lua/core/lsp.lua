local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("*", { capabilities = capabilities })

-- Only enable servers whose binary is present in PATH
local servers = {
    { name = "gopls",         cmd = "gopls" },
    { name = "lua_ls",        cmd = "lua-language-server" },
    { name = "rust-analyzer", cmd = "rust-analyzer" },
    { name = "ts_ls",         cmd = "typescript-language-server" },
    { name = "svelte",        cmd = "svelteserver" },
    { name = "html",          cmd = "vscode-html-language-server" },
    { name = "cssls",         cmd = "vscode-css-language-server" },
    { name = "nil_ls",        cmd = "nil" },
    { name = "elixirls",      cmd = "elixir-ls" },
    { name = "sourcekit-lsp", cmd = "sourcekit-lsp" },
    { name = "pyright",       cmd = "pyright-langserver" },
    { name = "jdtls",         cmd = "jdtls" },
}

for _, server in ipairs(servers) do
    if vim.fn.executable(server.cmd) == 1 then
        vim.lsp.enable(server.name)
    end
end
