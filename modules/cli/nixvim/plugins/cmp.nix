{pkgs, lib, ...}:
{
    # A completion engine for Neovim written in Lua, designed ot be fast and extensible.
    plugins.cmp = {
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
}
