{pkgs, ...}: {
    programs.neovim = {
        enable = true;
	viAlias = true;
	vimAlias = true;
	extraLuaConfig = ''
            require("johnt")
	'';
    };
}
