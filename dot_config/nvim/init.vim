:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-commentary'								" For Commenting gcc & gc
Plug 'https://github.com/tpope/vim-surround'								" Surrounding ysw)
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/mg979/vim-visual-multi'							" CTRL + N for multiple cursors
Plug 'https://github.com/preservim/tagbar'
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}			" Auto Completion
																			" CocInstall coc-tsserver coc-json

call plug#end()

nnoremap <C-t> :NERDTreeToggle<CR>

nmap <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
