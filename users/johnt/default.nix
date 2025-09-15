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
        xdg.configFile."tmux-sessionizer/tmux-sessionizer.conf".text = ''
TS_SEARCH_PATHS=(~/Projects ~/Projects/john-terrell ~/.config/)
        '';
        home = {
            username = "johnt";
            homeDirectory = if pkgs.hostPlatform.isLinux then "/home/${config.home.username}" else "/Users/${config.home.username}";
            stateVersion = "25.05";
            file.".p10k.zsh".text = builtins.readFile ./p10k.zsh;
            shellAliases = {
                rm = "echo rm disabled. Use trash-put \\(tp\\) instead...";
                tp = "trash-put";
                # command to reset the wifi driver on Legion 5i after failing to load after suspend
                wifi_bonk = "modprobe -v rtw89_8852ce";
                ts = "tmux-sessionizer";
            };
            sessionPath = [
                "${config.home.homeDirectory}/.local/bin"
            ];
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

                    if [ ! -x ~/.local/bin/tmux-sessionizer ]; then
                        echo "tmux-sessionizer not found...downloading..."
                        mkdir -p ~/.local/bin
                        rm -rf ~/.local/bin/tmux-sessionizer
                        curl --silent -L https://raw.githubusercontent.com/john-terrell/tmux-sessionizer/refs/heads/master/tmux-sessionizer -o ~/.local/bin/tmux-sessionizer
                        chmod +x ~/.local/bin/tmux-sessionizer
                    fi
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
        };
    }
    (lib.mkIf (systemConfig != {}) systemConfig)
    ];
}
