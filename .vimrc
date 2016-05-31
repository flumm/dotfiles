set encoding=utf-8
"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline_theme='term'
let g:airline#extensions#whitespace#mixed_indent_algo = 2
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'long' ]
let g:powerline_symbols='unicode'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols_branch = ''
let g:airline_symbols_readonly = ''
let g:airline_symbols_linenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ""


"NeoBundle Scripts-----------------------------
if &compatible
      set nocompatible               " Be iMproved
      endif

      " Required:
      set runtimepath^=/home/dcsapak/.vim/bundle/neobundle.vim/

      " Required:
      call neobundle#begin(expand('/home/dcsapak/.vim/bundle'))

      " Let NeoBundle manage NeoBundle
      " Required:
      NeoBundleFetch 'Shougo/neobundle.vim'

      " Add or remove your Bundles here:
      NeoBundle 'Shougo/neosnippet.vim'
      NeoBundle 'Shougo/neosnippet-snippets'
      NeoBundle 'tpope/vim-fugitive'
      NeoBundle 'ctrlpvim/ctrlp.vim'
      NeoBundle 'flazz/vim-colorschemes'
      NeoBundle 'stayradiated/vim-termorrow'
      " You can specify revision/branch/tag.
      NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
      "NeoBundle 'tpope/vim-fugitive'
      NeoBundle 'valloric/youcompleteme'
      NeoBundle 'vim-airline/vim-airline'
      NeoBundle 'vim-airline/vim-airline-themes'
      "NeoBundle 'andrewle/vim-autoclose'
      NeoBundle 'raimondi/delimitmate'
      "NeoBundle 'scrooloose/syntastic'
      " Required:
      call neobundle#end()

      " Required:
      filetype plugin indent on

      " If there are uninstalled bundles found on startup,
      " this will conveniently prompt you to install them.
      NeoBundleCheck
      "End NeoBundle Scripts-------------------------


colorscheme termorrow
syntax on
" set indendation rules
set ts=8 sts=4 sw=4 noet noci ai si cino=(0,u0,U0
" set linenumber and search highlight
set nu hls
" Highlight trailing whitespace if you don't use list mode:
highlight ExtraWhite ctermbg=darkred guibg=lightred
autocmd Syntax * syn match ExtraWhite /\s\+$/
autocmd colorscheme * highlight ExtraWhite ctermbg=darkred guibg=lightred
" set linenumber color
highlight LineNr ctermfg=DarkGrey
set mouse=a
set laststatus=2
