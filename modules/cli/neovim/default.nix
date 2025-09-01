{pkgs, ...}: {
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        extraLuaConfig = ''
            require("johnt")
            '';

        extraPackages = with pkgs; [
            clang
            clang-tools
            cmake
            vscode-extensions.vadimcn.vscode-lldb
        ];
    };
}
