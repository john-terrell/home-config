{pkgs, ...}: {
    home.packages = with pkgs; [
        clang
    ];

    programs.neovim = {
        enable = true;
	viAlias = true;
	vimAlias = true;
	extraLuaConfig = ''
            require("johnt")
	'';
    };
}
