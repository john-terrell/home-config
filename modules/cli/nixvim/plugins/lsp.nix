{pkgs, lib, ...}:
{
    plugins.lsp = {
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
            openscad_lsp = {
                enable = true;
            };
            rust_analyzer = {
                enable = true;
                # The below are used since Cargo and Rustc are installed elsewhere
                installCargo = false;
                installRustc = false;
            };
            wgsl_analyzer = {
                enable = true;
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
}
