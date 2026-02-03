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
        { mode = "n"; action = ":lua require('dapui').toggle()<cr>"; key = "<leader>dd"; }
        { mode = "n"; action = ":lua require('dap').toggle_breakpoint()<cr>"; key = "<leader>db"; }
        { mode = "n"; action = ":lua require('dapui').open() require('dap').continue()<cr>"; key = "<leader>dc"; }

        # TMux
        { mode = "n"; action = "<cmd>silent ! tmux neww tmux-sessionizer<CR>"; key = "<leader>tt"; }

        # Terminal
        { mode = "n"; action = ":lua Snacks.terminal()<cr>"; key = "<leader>ft"; }

        # LSP
        { mode = "n"; action = ":lua vim.lsp.buf.type_definition()<cr>"; key = "<leader>gd"; }
        { mode = "n"; action = ":lua vim.lsp.buf.references()<cr>"; key = "<leader>gr"; }
        { mode = "n"; action = ":lua vim.lsp.buf.document_symbol()<cr>"; key = "<leader>gO"; }

        # DAP-ui
        { mode = "n"; action = "<cmd>DapContinue<cr>"; key = "<F5>"; }
        { mode = "n"; action = "<cmd>DapTerminate<cr>"; key = "<S-F5>"; }
        { mode = "n"; action = "<cmd>DapToggleBreakpoint<cr>"; key = "<F9>"; }
        { mode = "n"; action = "<cmd>DapClearBreakpoints<cr>"; key = "<S-F9>"; }
        { mode = "n"; action = "<cmd>DapStepOver<cr>"; key = "<F10>"; }
        { mode = "n"; action = "<cmd>DapStepInto<cr>"; key = "<F11>"; }
        { mode = "n"; action = "<cmd>DapStepInto<cr>"; key = "<S-F11>"; }
    ];
}
