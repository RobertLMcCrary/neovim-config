return {
    cmd = { "basedpyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
    settings = {
        basedpyright = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
                -- basedpyright defaults to "recommended", which is far stricter
                -- than pyright. "standard" matches pyright's default.
                typeCheckingMode = "standard",
                diagnosticSeverityOverrides = {
                    reportMissingParameterType = "none",
                    reportUnknownParameterType = "none",
                    reportUnknownArgumentType = "none",
                    reportUnknownVariableType = "none",
                    reportUnknownMemberType = "none",
                    reportUnknownLambdaType = "none",
                    reportMissingTypeStubs = "none",
                    reportUninitializedInstanceVariable = "none",
                    reportAny = "none",
                    reportExplicitAny = "none",
                    reportImplicitOverride = "none",
                    reportUnusedCallResult = "none",
                },
            },
        },
    },
}
