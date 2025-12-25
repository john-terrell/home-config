{pkgs, lib, ...}: {
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;

        extraPackages = with pkgs; [
            clang
            clang-tools
            cmake
            tree-sitter
            vscode-extensions.vadimcn.vscode-lldb
        ];

        plugins = with pkgs.vimPlugins; [
          nvim-treesitter.withAllGrammars
          # Add other plugins managed by Nix here
        ];
    };
}
