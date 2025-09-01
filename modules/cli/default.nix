{pkgs, ...}: {
    imports = [
        ./fzf.nix
        #./nixvim
        ./neovim
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
        enable = true;
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
        '';
    };

    programs.zoxide = {
        enable = true;
        enableFishIntegration = true;
        enableNushellIntegration = true;
    };

    home.packages = with pkgs; [
        alejandra
            btop
            comma
            coreutils
            devenv
            findutils
            nerd-fonts.fira-code
            nerd-fonts.fira-mono
            nerd-fonts.meslo-lg
            fd
            httpie
            jq
            jujutsu
            just
            lazygit
            meld
            nix-index
            pass
            progress
            restic
            ripgrep
            tldr
            trash-cli
            unzip
            yubikey-manager
            zip
    ];
}
