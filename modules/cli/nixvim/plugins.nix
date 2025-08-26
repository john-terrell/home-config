{pkgs, ...}:
{
    plugins = {
# A completion engine for Neovim written in Lua, designed ot be fast and extensible.
        cmp = {
            enable = true;
            autoEnableSources = true;
            settings = {
                sources = [
                { name = "nvim_lsp"; }
                { name = "path"; }
                { 
                    name = "buffer"; 
                    option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
                }
                ];
                mapping = {
                    "<C-d>" = "cmp.mapping.scroll_docs(-4)";
                    "<C-f>" = "cmp.mapping.scroll_docs(4)";
                    "<C-Space>" = "cmp.mapping.complete()";
                    "<C-e>" = "cmp.mapping.close()";
                    "<Tab>" = "cmp.mapping.select_next_item()";
                    "<S-Tab>" = "cmp.mapping.select_prev_item()";
                    "<CR>" = "cmp.mapping.confirm({ select = true })";
                };
            };
        };
        lsp = {
            enable = true;
            servers = {
# C/C++
                clangd = {
                    enable = true;
                    settings = {
                        cmd = [
                            "clangd"
                                "--background-index"
                        ];
                        filetypes = [
                            "c"
                                "cpp"
                        ];
                        root_markers = [
                            "compile_commands.json"
                                "compile_flags.txt"
                                ".git"
                        ];
                    };
                };
# Ziglang
                zls = {
                    enable = true;
                    settings = {
                        root_markers = [
                            ".git"
                        ];
                        semantic_tokens = "partial";
                    };
                };
            };
        };
# Provides a status line in NVIM
        lualine = {
            enable = true;
        };
        oil = {
            enable = true;
        };
# Fuzzy finder plugin
        telescope = {
            enable = true;
        };
        treesitter = {
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
    };
}

