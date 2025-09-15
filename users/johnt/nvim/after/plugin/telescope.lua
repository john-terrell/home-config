local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.git_files, { desc = 'Telescope git files' })
vim.keymap.set('n', '<leader>fF', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = "Telescope find referenced" })
vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, { desc = "Telescope find definitions" })
vim.keymap.set('n', '<leader>fs', builtin.lsp_dynamic_workspace_symbols, { desc = "Telescope workspace symbols" })
vim.keymap.set('n', '<leader>sq', builtin.quickfix, { desc = "Telescope quickfix" })

vim.keymap.set('n', '<leader>fG', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
