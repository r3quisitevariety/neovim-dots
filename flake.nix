{
  description = "Reproducible Neovim with LSPs, formatters, and tools (r3quisitevariety/neovim-dots)";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forEachSystem = nixpkgs.lib.genAttrs systems;
      pkgsFor = nixpkgs.legacyPackages;

      toolList =
        system:
        with pkgsFor.${system};
        [
          # editor + fuzzy finding / search
          neovim
          fzf
          ripgrep
          fd

          # toolchains
          rustup

          # LSPs (note: `harper` ships both `harper-cli` and `harper-ls`)
          lua-language-server
          gopls
          nil
          typescript-language-server
          harper

          # formatters
          stylua
          prettier
          nixfmt
          alejandra

          # language runtimes / binaries the LSPs/formatters shell out to
          nodejs

          # plugin manager bootstrap (lazy.nvim clones itself with git)
          git
        ];

      toolsEnv = system: pkgsFor.${system}.symlinkJoin {
        name = "neovim-dots-tools";
        paths = toolList system;
      };

      nvimConfig = ./.; # the flake root is the nvim config dir

      makeApp = system: name: script: {
        type = "app";
        program = toString (pkgsFor.${system}.writeShellScript name script);
      };
    in
    {
      apps = forEachSystem (system: rec {
        # default: `nix run github:r3quisitevariety/neovim-dots` -> launches nvim
        default = makeApp system "neovim" ''
          set -e

          # Writable, isolated XDG_CONFIG_HOME so we use the flake's nvim config
          # without touching the user's real ~/.config/nvim. Lazy.nvim will still
          # install plugins to the persistent XDG_DATA_HOME (~/.local/share).
          export XDG_CONFIG_HOME="$(mktemp -d -t neovim-dots.XXXXXX)"
          cp -rL ${nvimConfig} "$XDG_CONFIG_HOME/nvim"
          chmod -R u+w "$XDG_CONFIG_HOME/nvim"

          # Put all the LSPs, formatters, and toolchain binaries on PATH.
          export PATH="${toolsEnv system}/bin:$PATH"

          exec nvim "$@"
        '';

        # `nix run github:r3quisitevariety/neovim-dots#shell` -> interactive shell
        shell = makeApp system "neovim-shell" ''
          set -e

          export XDG_CONFIG_HOME="$(mktemp -d -t neovim-dots.XXXXXX)"
          cp -rL ${nvimConfig} "$XDG_CONFIG_HOME/nvim"
          chmod -R u+w "$XDG_CONFIG_HOME/nvim"
          export PATH="${toolsEnv system}/bin:$PATH"

          export PS1="[neovim-dots] \w$ "
          echo "Neovim-dots shell. All LSPs and formatters are on PATH."
          echo "Run \`nvim\` to launch the editor, or \`exit\` to leave."

          exec ${pkgsFor.${system}.bashInteractive}/bin/bash --noprofile --norc
        '';
      });

      devShells = forEachSystem (system: {
        default = pkgsFor.${system}.mkShell {
          packages = toolList system;
          shellHook = ''
            export XDG_CONFIG_HOME="$PWD/.config"
            mkdir -p "$XDG_CONFIG_HOME"
            [ -L "$XDG_CONFIG_HOME/nvim" ] || ln -s "$PWD" "$XDG_CONFIG_HOME/nvim"
          '';
        };
      });
    };
}
