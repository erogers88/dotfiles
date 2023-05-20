let g:python3_host_prog = '/usr/bin/python3'

" ALE Settings
let g:deoplete#enable_at_startup = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {'python': ['pyright'], 'sh': ['shellcheck'], 'c': ['ccls'], 'cpp': ['clangd']}
let g:ale_fixers = {'python': [], 'sh': [], 'c': [], 'cpp': []}


" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'dense-analysis/ale'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'vim-airline/vim-airline'
Plug 'EdenEast/nightfox.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'romgrk/barbar.nvim'
Plug 'gabrielelana/vim-markdown'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Custom key mappings
nnoremap <silent> <leader>g	:ALEGoToDefinition<cr>
nnoremap <silent> <leader>r	:ALEFindReferences<cr>
nnoremap <silent> <leader>t	:NvimTreeToggle<cr>
" Find files using Telescope
nnoremap <silent> <leader>ff	<cmd>Telescope find_files<cr>
nnoremap <silent> <leader>fg	<cmd>Telescope live_grep<cr>
nnoremap <silent> <leader>fb	<cmd>Telescope buffers<cr>
nnoremap <silent> <leader>fh	<cmd>Telescope help_tags<cr>
" Change and Move Tabs
nnoremap <silent> <C-PageUp>	<cmd>BufferPrevious<cr>
nnoremap <silent> <C-PageDown>	<cmd>BufferNext<cr>
nnoremap <silent> <A-PageUp>	<cmd>BufferMovePrevious<cr>
nnoremap <silent> <A-PageDown>	<cmd>BufferMoveNext<cr>
nnoremap <silent> <leader>q	<cmd>BufferClose<cr>
" Get out of command line mode
nnoremap          <Esc>		<C-\><C-n>
" Use System Clipboard to unnamed register
set clipboard+=unnamedplus
" Startup commands
set number
set nosplitright
colorscheme carbonfox

" LUA for nvim-tree
lua << EOF
require("nvim-tree").setup(
	{
	sync_root_with_cwd = true,
	view = {
        	side = "left"
	       }
	}
)
EOF
