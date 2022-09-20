vim.keymap.set('n', '<Leader>ff', function()
	require('telescope.builtin').find_files()
end)

vim.keymap.set('n', '<Leader>fg', function()
	require('telescope.builtin').live_grep()
end)

vim.keymap.set('n', '<Leader>fb', function()
	require('telescope.builtin').buffers()
end)

vim.keymap.set('n', '<Leader>fn', function()
	require('telescope.builtin').help_tags()
end)
