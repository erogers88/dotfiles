" [[ Setting options ]]
" Set highlight on search
set hlsearch!

" Make line numbers default
set number

" Enable mouse mode
set mouse=a

" Sync clipboard between OS and Neovim.
set clipboard=unnamedplus

" Enable break indent
set breakindent

" Case-insensitive searching UNLESS \C or capital in search
set ignorecase
set smartcase

" Keep signcolumn on by default
"set signcolumn=yes

" Decrease update time
set updatetime=250
set timeout
set timeoutlen=300

" Set completeopt to have a better completion experience
set completeopt=menuone,noselect

" NOTE: You should make sure your terminal supports this
set termguicolors

" foldmethod
set foldmethod=manual

" VIM-specific
syntax on
