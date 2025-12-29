{pkgs, lib, ...}:
{
extraPackages = with pkgs; [
    # General LLDB package
    lldb
    # The vscode extension package which provides the codelldb adapter
    vscode-extensions.vadimcn.vscode-lldb
  ];

    plugins.dap = {
        enable = true;
    };
    plugins.dap-lldb = {
        enable = true;
        settings = {
            codelldb_path = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb";
        };
    };
    plugins.dap-ui = {
        enable = true;
    };
}
