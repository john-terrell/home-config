{pkgs, lib, ...}:
{
    # Lightweight yet powerful formatter plugin
    plugins.conform-nvim = {
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
}
