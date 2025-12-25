{pkgs, lib, ...}: {
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;

        extraPackages = with pkgs; [
            clang-tools
            clang
            cmake
            tree-sitter
            vscode-extensions.vadimcn.vscode-lldb
        ];

        plugins = with pkgs.vimPlugins; [
            nvim-treesitter.withAllGrammars
        ];
    };
}
