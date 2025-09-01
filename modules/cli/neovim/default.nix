{pkgs, ...}: {
    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        plugins = [
            pkgs.vimPlugins.clang_complete
        ];
        extraLuaConfig = ''
            require("johnt")
            '';
    };
}
