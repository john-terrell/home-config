{pkgs, ...}: {
    imports = [
        ./fzf.nix
        ./nixvim
        #./neovim
    ];

    programs.bat = {enable = true;};

    programs.carapace = {
        enable = true;
        enableFishIntegration = true;
        enableNushellIntegration = true;
        enableBashIntegration = true;
    };

    programs.direnv = {
        enable = true;
        enableNushellIntegration = true;
        nix-direnv.enable =
            true;
    };

    programs.eza = {
        enable = false;
        enableFishIntegration = true;
        enableBashIntegration = true;
        extraOptions = ["-l" "--icons" "--git" "-a"];
    };

    programs.lf = {
        enable = true;
        settings = {
            preview = true;
            drawbox = true;
            hidden = true;
            icons = true;
            theme = "Dracula";
            previewer = "bat";
        };
    };

    programs.tmux = {
        enable = true;
        prefix = "C-a";
        keyMode = "vi";
        extraConfig = ''
            set -g base-index 1 # start window numbering at 1
            bind -r h select-pane -L
            bind -r l select-pane -R
            bind -r j select-pane -D
            bind -r k select-pane -U

            set -sg escape-time 10
        '';
    };

    programs.vscode = {
      enable = true;
        profiles.default.extensions = with pkgs.vscode-extensions; [
        ms-vscode.cpptools
        ms-vscode.cmake-tools
        vadimcn.vscode-lldb
      ];
    };

    programs.zoxide = {
        enable = true;
        enableFishIntegration = true;
        enableNushellIntegration = true;
    };

    home.packages = with pkgs; [
        alejandra
        btop
        cargo
        cmake-language-server
        comma
        coreutils
        devenv
        dune3d
        emacs
        findutils
        fontconfig
        nerd-fonts.fira-code
        nerd-fonts.fira-mono
        nerd-fonts.meslo-lg
	nerd-fonts.symbols-only
        fd
        httpie
        jq
        jujutsu
        just
        lazygit
        lazyjj
        lua-language-server
        meld
        nix-index
        openscad
        openscad-lsp
        pandoc
        pass
        progress
        restic
        ripgrep
        rustc
        rust-analyzer
        shellcheck
        symbola
        tldr
        trash-cli
        tree-sitter
        unzip
        wgsl-analyzer
        yubikey-manager
	zig
	zls
        zip
    ];
}
