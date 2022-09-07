syntax on
set mouse=v
set mouse=a
set guicursor=
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set smarttab
set smartindent
set autoindent
set wildmode=longest,list
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set cmdheight=2
set updatetime=50
set termguicolors
set completeopt=menu,menuone,noselect,noinsert
set cc=80
set cursorline
set cursorlineopt=number

call plug#begin("~/.vim/plugged")

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Use TSInstall <language> to install support
Plug 'tanvirtin/monokai.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'simrat39/rust-tools.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'jiangmiao/auto-pairs'

call plug#end()

" colorscheme monokai_pro
colorscheme tokyonight-storm
highlight Normal guibg=None

" Tabs
nnoremap <C-b> :tabnew<CR>
nnoremap <C-n> :tabn<CR>
nnoremap <C-x> :tabc<CR>
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" AutoPairs
let g:AutoPairs={'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}

" Telescope
let mapleader=" "
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Nerd Tree
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-m> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Airlines
let g:airline_powerline_fonts=1


" returns user to last spot in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Run gofmt on save
function! CustomGoFmt()
	let file = expand('%')
	silent execute "!gofmt -w " . file
endfunction

augroup go_autocmd
	autocmd BufWritePost *.go call CustomGoFmt()
augroup END


" Rust LSP
lua require'lspconfig'.rust_analyzer.setup{}
lua << EOF
local nvim_lsp = require'lspconfig'

local on_attach = function(client)
    require'completion'.on_attach(client)
end

nvim_lsp.rust_analyzer.setup({
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
})
EOF
lua require('rust-tools').setup({})

" Go LSP
lua require'lspconfig'.gopls.setup{}
lua << EOF
local nvim_lsp = require'lspconfig'

local on_attach = function(client)
	require'completion'.on_attach(client)
end

nvim_lsp.gopls.setup({
	on_attach=on_attach,
	cmd = {"gopls", "serve"},
	single_file_support = true,
	settings = {
		["gopls"] = {
			analyses = {
				unusedparams = true,
				shadow = true,
			},
			staticcheck = true,
		},
	},
})
EOF

" Python LSP
lua require'lspconfig'.pylsp.setup{}

" Racket LSP
lua require'lspconfig'.racket_langserver.setup{}

" C/C++ LSP
lua require'lspconfig'.clangd.setup{}
lua << EOF
local nvim_lsp = require'lspconfig'

nvim_lsp.clangd.setup({
	on_attach=on_attach
})
EOF

" Setup completion
lua <<EOF
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
  })
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
EOF
