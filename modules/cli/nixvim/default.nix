{ self, pkgs, ... }:
{
    programs.nixvim = {
    imports = [ 
        ./autocmd.nix
        ./bufferline.nix 
        ./diagnostic.nix
        ./keymaps.nix
        ./options.nix
        ./plugins.nix
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
