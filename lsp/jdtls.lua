return {
    cmd = { "jdtls" },
    filetypes = { "java" },
    root_markers = { "pom.xml", "build.gradle", "build.gradle.kts", ".git" },
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
