{pkgs, lib, ...}:
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
        conform-nvim = {  # Lightweight yet powerful formatter plugin
            enable = true;
            settings = {
                formatters_by_ft = {
                    cpp = [ "clang-format" ];
                    "_" = [
                        "squeeze_blanks"
                        "trim_whitespace"
                        "trim_newlines"
                    ];
                };
                formatters = {
                    squeeze_blanks = {
                        command = lib.getExe' pkgs.coreutils "cat";
                    };
                };
                format_on_save = # Lua
      ''
        function(bufnr)
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end

          return { timeout_ms = 500, lsp_fallback = true }
         end
      '';
    format_after_save = # Lua
      ''
        function(bufnr)
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end

          return { lsp_fallback = true }
        end
      '';
                log_level = "warn";
                notify_on_error = true;
                notify_no_formatters = true;
            };
        };
        cmake-tools = {
            enable = true;
            settings = {
                cmake_build_directory.__raw = ''
                    function()
                        local build_dir_format = os.getenv("LOCAL_BUILD_DIR_FORMAT")
                        if (not build_dir_format) then
                            build_dir_format = "build/%s"
                        end

                        return string.format(build_dir_format, "${variant:buildType}")
                    end
                '';
            };
        };
        dap = {
            enable = true;
        };
        dap-lldb = {
            enable = true;
        };
        dap-ui = {
            enable = true;
        };
        lsp = {
            enable = true;
            servers = {
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
        overseer = {
            enable = true;
        };
# Fuzzy finder plugin
        telescope = {
            enable = true;
        };
        toggleterm = {
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
