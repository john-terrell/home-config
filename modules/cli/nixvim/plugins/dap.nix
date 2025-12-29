{pkgs, lib, ...}:
{
    plugins.dap = {
        enable = true;
    };
    plugins.dap-lldb = {
        enable = true;
    };
    plugins.dap-ui = {
        enable = true;
    };
}
