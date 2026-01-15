{
    config,
    lib,
    nixvim,
    pkgs,
    systemConfig ? {},
    ...
}: {
    imports = [
        ../../modules
    ];
    config = lib.mkMerge [
    {
        xdg.enable = true;
        xdg.configFile."tmux-sessionizer/tmux-sessionizer.conf".text = ''
TS_SEARCH_PATHS=(~/Projects ~/Projects/AlphaPixel ~/Projects/github ~/Projects/TauInteractive ~/Projects/john-terrell ~/Projects/PGRV ~/.config/)
        '';
        home = {
            username = "johnt";
            homeDirectory = if pkgs.hostPlatform.isLinux then "/home/${config.home.username}" else "/Users/${config.home.username}";
            stateVersion = "25.05";
            file.".p10k.zsh".text = builtins.readFile ./p10k.zsh;
            shellAliases = {
                rm = "echo rm disabled. Use trash-put \\(tp\\) instead...";
                tp = "trash-put";
                ts = "tmux-sessionizer";
            };
        };

        fonts.fontconfig.enable = true;

        programs = {
            home-manager.enable = true;

            git = {
                enable = true;
                difftastic.enable = true;
                userName = "John W. Terrell";
                signing.key = "64EDA67B2782882D8A5A83EC2E424258DD3731F4";
                signing.signByDefault = true;
                delta.enable = false; # prefer difftastic
                    lfs.enable = true;
                aliases = {
                    st = "status";
                    logd = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
                };
                extraConfig = {
                    core.excludesfile = "~/.gitignore_global";
                    init.defaultBranch = "main";
                };
            };

            gpg = {
                enable = true;
                publicKeys = [
                {
                    text = builtins.readFile ./public_keys/john_terrell.asc;
                    trust = "ultimate";
                }
                {
                    text = builtins.readFile ./public_keys/bill_coldwell.asc;
                    trust = "full";
                }
                {
                    text = builtins.readFile ./public_keys/chris_hanson.asc;
                    trust = "full";
                }
                ];
            };

            zellij = {
                enable = true;
            };

            zsh = {
                enable = true;
                initContent = ''
                    # p10k instant prompt
                    P10K_INSTANT_PROMPT="$XDG_CACHE_HOME/p10k-instant-prompt-''${(%):-%n}.zsh"
                    [[ ! -r "$P10K_INSTANT_PROMPT" ]] || source "$P10K_INSTANT_PROMPT"
                    source ~/.p10k.zsh
                    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

                    if [ ! -x ~/.bin/tmux-sessionizer ]; then
                        echo "tmux-sessionizer not found...downloading..."
                        mkdir -p ~/.bin
                        rm -rf ~/.bin/tmux-sessionizer
                        curl --silent -L https://raw.githubusercontent.com/john-terrell/tmux-sessionizer/refs/heads/master/tmux-sessionizer -o ~/.bin/tmux-sessionizer
                        chmod +x ~/.bin/tmux-sessionizer
                    fi

                    export AWS_ACCESS_KEY_ID=$(pass restic/cpn_backups/b2_key_id)
                    export AWS_SECRET_ACCESS_KEY=$(pass restic/cpn_backups/b2_application_key)
                    export RESTIC_REPOSITORY=s3:$(pass restic/cpn_backups/b2_endpoint)/CPN-Backups
                    export RESTIC_PASSWORD=$(pass restic/cpn_backups/passkey)
                    export PATH=$HOME/.bin:$PATH
                '';
                plugins = with pkgs; [
                {
                    file = "powerlevel10k.zsh-theme";
                    name = "powerlevel10k";
                    src = "${zsh-powerlevel10k}/share/zsh-powerlevel10k";
                }
                ];
            };
        };

        services = {
            gpg-agent = {
                enable = true;
                enableExtraSocket = true;
                defaultCacheTtl = 14400;
                maxCacheTtl = 86400;
                enableSshSupport = true;
                enableZshIntegration = true;
                pinentry.package = if pkgs.hostPlatform.isLinux then pkgs.pinentry-gtk2 else pkgs.pinentry_mac;
                sshKeys = [
                    "C0B077947A793E7D66DCE451EA5B9A8C05A954D6"
                ];
            };
            syncthing = {
                enable = true;
            };
        };
    }
    (lib.mkIf (systemConfig != {}) systemConfig)
    ];
}
