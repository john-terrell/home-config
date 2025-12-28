{pkgs, ...}: {
    imports = [
        ./bufferline.nix
        ./cmake-tools.nix
        ./cmp.nix
        ./conform.nix
        ./lsp.nix
        ./snacks.nix
        ./treesitter.nix
    ];

    plugins = {
        dap = {
            enable = true;
        };
        dap-lldb = {
            enable = true;
        };
        dap-ui = {
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
