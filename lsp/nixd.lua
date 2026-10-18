return {
    cmd = { "nixd" },
    filetypes = { "nix" },
    root_markers = { "flake.nix", "shell.nix", "default.nix", ".git" },
    settings = {
        nixd = {
            formatting = {
                command = { "nixfmt" },
            },
        },
    },
    -- Repos like NuDox/MachineConfigurations pin nixpkgs through nix/tamal and
    -- deploy with Colmena, so the flake has no nixpkgs input or nixosConfigurations
    -- for nixd to discover. Point it at them explicitly when they exist.
    before_init = function(_, config)
        local root = config.root_dir
        if not root or vim.fn.filereadable(root .. "/nix/tamal/default.nix") == 0 then
            return
        end
        local inputs = string.format("(import %s/nix/tamal { })", root)
        config.settings.nixd.nixpkgs = {
            expr = string.format("import %s.nixpkgs { }", inputs),
        }
        config.settings.nixd.options = {
            nixos = {
                expr = string.format(
                    [[let inputs = %s; in (import (inputs.nixpkgs + "/nixos/lib/eval-config.nix") {
                        system = "x86_64-linux";
                        specialArgs = { inherit inputs; root = %s; };
                        modules = [ (import "${inputs.home-manager}/nixos") %s/system ];
                    }).options]],
                    inputs, root, root
                ),
            },
        }
    end,
}
