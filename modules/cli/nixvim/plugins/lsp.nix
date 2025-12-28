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
