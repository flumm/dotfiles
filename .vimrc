syntax on
"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=/home/flumm/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/home/flumm/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

let g:airline_powerline_fonts=1
let g:airline_theme='term'
colorscheme termorrow
syntax on
set ts=8 sts=4 sw=4 noet noci ai si cino=(0,u0,U0
set nu
" Highlight trailing whitespace if you don't use list mode:
highlight ExtraWhite ctermbg=darkred guibg=lightred
autocmd Syntax * syn match ExtraWhite /\s\+$/
autocmd colorscheme * highlight ExtraWhite ctermbg=darkred guibg=lightred
set mouse=a
set laststatus=2
