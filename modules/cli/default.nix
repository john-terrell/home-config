{pkgs, ...}: {
    imports = [
        ./fzf.nix
        ./nitch.nix
        ./nixvim
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
            nerd-fonts.fira-code
            nerd-fonts.fira-mono
            nerd-fonts.meslo-lg
            fd
            httpie
            jq
            just
            lazygit
            nix-index
            pass
            progress
            restic
            ripgrep
            tldr
            trash-cli
            unzip
            zip
    ];
}


