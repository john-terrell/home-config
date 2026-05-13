{pkgs, ...}: {
    imports = [
        ./bufferline.nix
        ./cmake-tools.nix
        ./cmp.nix
        ./conform.nix
        ./dap.nix
        ./lazygit.nix
        ./lsp.nix
        ./noice.nix
        ./snacks.nix
        ./treesitter.nix
    ];

    plugins = {
        gitsigns = {
            enable = true;
        };
        lualine = {
            enable = true;
        };
        # Neovim task runner
        overseer = {
            enable = true;
        };
        # Fuzzy finder plugin
        telescope = {
            enable = true;
        };
        # NVIM keybinding search box
        which-key = {
            enable = true;
        };
    };
}
