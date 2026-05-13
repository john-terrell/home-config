{ pkgs, lib, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      chafa
      clang-tools
      clang
      cmake
      fishMinimal
      nixfmt-rfc-style
      packer
      python3
      rust-analyzer
      tree-sitter
      ueberzugpp
      viu
      vscode-extensions.vadimcn.vscode-lldb
      wget
    ];

    plugins = with pkgs.vimPlugins; [ nvim-treesitter.withAllGrammars ];
  };
}
