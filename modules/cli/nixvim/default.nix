{ self, pkgs, ... }:
{
    programs.nixvim = {
        imports = [
            ./autocmd.nix
            ./diagnostic.nix
            ./keymaps.nix
            ./options.nix
            ./plugins
        ];

        config = {
            enable = true;
            colorschemes.catppuccin.enable = true;
            globals = {
                mapleader = " ";
            };
            vimAlias = true;
            viAlias = true;
        };
    };
}
