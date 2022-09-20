require('lualine').setup {
	options = {
		icons_enabled = false,
		theme = 'powerline_dark',
		component_separators = { left = '|', right = '|' },
	},
	sections = {
		lualine_x = {'encoding', 'filetype'},
	}
}

require('tabline').setup {
	options = {
		show_tabs_always = true,
		show_bufnr = true,
	}
}

vim.cmd([[
	let g:NERDTreeDirArrowExpandable = "+"
	let g:NERDTreeDirArrowCollapsible = "~"

	let g:AutoPairs={'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}
]])
