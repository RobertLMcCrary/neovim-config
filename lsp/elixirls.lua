return {
    cmd = { "elixir-ls" },
    -- launch.sh relaunches via `exec zsh`, which sources /etc/zshenv.
    -- On nix-darwin, /etc/zshenv runs a set-environment script that hardcodes a
    -- Nix-only PATH (no Homebrew). Setting __NIX_DARWIN_SET_ENVIRONMENT_DONE=1
    -- tells that script it already ran, preserving our PATH with /opt/homebrew/bin.
    cmd_env = {
        PATH = "/opt/homebrew/bin:" .. vim.env.PATH,
        __NIX_DARWIN_SET_ENVIRONMENT_DONE = "1",
    },
    filetypes = { "elixir", "eelixir", "heex", "surface" },
    root_markers = { "mix.exs", "mix.lock", ".git" },
    settings = {
        elixirLS = {
            --dialyzerEnabled = true,
            dialyzerEnabled = false,
            fetchDeps = false,
        },
    },
}
