return {
    cmd = { "jdtls" },
    filetypes = { "java" },
    -- Standalone snippet folders (no pom.xml/build.gradle) have no real
    -- project root, so fall back to the file's own directory instead of
    -- climbing to the monorepo's top-level .git -- otherwise jdtls expects
    -- every file's package to mirror its full path from the repo root.
    root_dir = function(bufnr, on_dir)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        local build_root = vim.fs.root(fname, { "pom.xml", "build.gradle", "build.gradle.kts" })
        on_dir(build_root or vim.fs.dirname(fname))
    end,
    settings = {
        java = {
            eclipse = { downloadSources = true },
            maven = { downloadSources = true },
            implementationsCodeLens = { enabled = true },
            referencesCodeLens = { enabled = true },
            inlayHints = { parameterNames = { enabled = "all" } },
            format = { enabled = true },
            signatureHelp = { enabled = true },
            completion = {
                favoriteStaticMembers = {
                    "org.junit.Assert.*",
                    "org.junit.Assume.*",
                    "org.junit.jupiter.api.Assertions.*",
                    "org.junit.jupiter.api.Assumptions.*",
                    "org.mockito.Mockito.*",
                },
                importOrder = { "java", "javax", "com", "org" },
            },
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
        },
    },
}
