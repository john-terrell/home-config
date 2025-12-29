{
    # LazyVim keymap definitions: https://www.lazyvim.org/configuration/general#keymaps
    keymaps = [
        { mode = "n"; action = "<cmd>qa<cr>"; key = "<leader>qq"; }

        # Better cursor key handling (from LazyVim...not working..)
        #{ mode = [ "n" "x" ]; key = "j"; action = "lua v:count == 0 ? 'gj' : 'j'"; }
        #{ mode = [ "n" "x" ]; key = "<Down>"; action = "lua v:count == 0 ? 'gj' : 'j'"; }
        #{ mode = [ "n" "x" ]; key = "k"; action = "lua v:count == 0 ? 'gk' : 'k'"; }
        #{ mode = [ "n" "x" ]; key = "<Up>"; action = "lua v:count == 0 ? 'gk' : 'k'"; }

        # Better window selection
        { mode = "n"; action = "<C-w>h"; key = "<C-h>"; }
        { mode = "n"; action = "<C-w>j"; key = "<C-j>"; }
        { mode = "n"; action = "<C-w>k"; key = "<C-k>"; }
        { mode = "n"; action = "<C-w>l"; key = "<C-l>"; }

        # Snacks file picker
        { mode = "n"; action = "<cmd>lua Snacks.picker.explorer()<cr>"; key = "<leader>e"; }

        # CMake support
        { mode = "n"; action = "<cmd>CMakeBuild<cr>"; key = "<leader>bb"; }
        { mode = "n"; action = "<cmd>CMakeGenerate<cr>"; key = "<leader>bc"; }

        # lazygit
        { mode = "n"; action = "<cmd>LazyGit<cr>"; key = "<leader>gg"; }

        # DAP
        { mode = "n"; action = ":lua require('dap').toggle_breakpoint()<cr>"; key = "<leader>db"; }
        { mode = "n"; action = ":lua require('dap').continue()<cr>"; key = "<leader>dc"; }
    ];
}
