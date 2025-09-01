{pkgs, ...}: {
    home.packages = with pkgs; [
        clang-tools
        clang
    ];

    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        extraLuaConfig = ''
            require("johnt")
            '';
    };
}
