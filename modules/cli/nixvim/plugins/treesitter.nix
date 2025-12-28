{pkgs, ...}: {
    plugins.treesitter = {
        enable = true;
        settings = {
            auto_install = true;
            grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
                bash
                c
                javascript
                json
                lua
                make
                markdown
                nix
                regex
                rust
                toml
                typescript
                vim
                vimdoc
                xml
                yaml
            ];
            hightlight = {
                enable = true;
                additional_vim_regex_highlighting = false;
            };
        };
    };
}
