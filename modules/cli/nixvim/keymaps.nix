{
    keymaps = [
    {
        mode = "n";
        action = "<cmd>Oil<CR>";
        key = "<leader>pv";
    }
    {
        mode = "n";
        action = "<cmd>Telescope find_files<CR>";
        key = "<leader>ff";
    }
    {
        mode = "n";
        action = "<cmd>Telescope git_files<CR>";
        key = "<leader>pf";
    }
    {
        mode = "n";
        options = {
            expr = true;
        };
        action = ''function() require("telescope.builtin").grep_string( { search = vim.fn.input("Grep > ") }) end'';
        key = "<leader>fg";
    }
    ];
}

