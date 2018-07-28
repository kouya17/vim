" nvim terminal関連
" 新しいウィンドウを下に開く
"set splitbelow

" 新しいウィンドウを右に開く
set splitright

" nvim起動時に統合terminalを開く
if has('nvim')
  function! s:open_terminal()
  	  8sp
	  terminal
	  wincmd p
  endfunction

  "autocmd vimenter * 10sp
  "autocmd vimenter * terminal
  "autocmd vimenter * wincmd p
  augroup terminal
	au!
    autocmd vimenter * call s:open_terminal()
  augroup END
endif

" terminal
" terminalモードでもいつも通りESCでノーマルモードに移行する
if has('nvim')
  tnoremap <silent> <ESC> <C-\><C-n>
endif

filetype plugin on


" unite.vim
" http://note.ontheroad.jp/archives/64
" http://qiita.com/ykyk1218/items/ab1c89c4eb6a2f90333a
" unite.vimの設定
noremap <C-U><C-F> :Unite -buffer-name=file file<CR>
noremap <C-U><C-R> :Unite file_mru<CR>

au FileType unite nnoremap <silent> <buffer> <expr> <C-i> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-i> unite#do_action('vsplit')

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q


" NeadTree
" Vim起動時にNeadTreeを自動で起動
"autocmd vimenter * NERDTree
" 閉じるときの挙動
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" キーマッピング
map <C-n> :NERDTreeToggle<CR>


" Use deoplete
"let g:deoplete#enable_at_startup = 1


" シンボリックリンクを使わない人は${XDG_CONFIG_HOME}/nvim/init.vim
"if has('nvim')
"  2016/05/11 neovim update. ignore NVIM_TUI_ENABLE_TRUE_COLOR
"  Vimのオプションのtermguicolorsに対応されました
"  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"endif
set termguicolors


" dein -------------------------------------
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
   if !isdirectory(s:dein_repo_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
   endif
   execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
   "execute 'set runtimepath^=' . s:dein_repo_dir
endif

if dein#load_state(s:dein_dir)
   call dein#begin(s:dein_dir)

   let g:rc_dir    = expand('~/.vim/rc')
   let s:toml      = g:rc_dir . '/dein.toml'
   let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

   call dein#load_toml(s:toml,      {'lazy': 0})
   call dein#load_toml(s:lazy_toml, {'lazy': 1})

   call dein#end()
   call dein#save_state()
endif

if dein#check_install()
   call dein#install()
endif


" vim-flake8
autocmd BufWritePost *.py call Flake8()
autocmd FileType python map <buffer> <F1> :call Flake8()<CR>
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1
let g:flake8_quickfix_height=7
"let g:flake8_quickfix_location="bottomleft"


"meidai style -------------------------------
"set encoding=utf-8
"set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
"set fileformats=unix,dos,mac

set title
set number
set showmode
"set enc=japan
"set autoindent
set backspace=start,eol,indent
" タブを表示するときの幅
set tabstop=4
" タブを挿入するときの幅
set shiftwidth=4
set shiftround
set textwidth=0
set laststatus=2
set fileformats=unix
set ff=unix
set background=dark
"colorscheme desert
"colorscheme darkblue

colorscheme hybrid
let g:molokai_original = 1
let g:rehash256 = 1

set t_Co=256
set ruler
set undolevels=100
set scrolloff=20
set showtabline=2

"set backupdir=$HOME/SWP
let &directory = &backupdir

set ignorecase
set smartcase
set incsearch

filetype plugin indent on
syntax on

highlight SpecialKey ctermbg=red  guifg=#ff0000
set list
set listchars=tab:\ \ ,trail:\ ,eol:\
",extends:>,pwecedes:<
"set nowrap

set statusline=%F%m%r%h%w

set hlsearch
nmap <Esc><Esc><Esc> :nohlsearch<CR>

map! <C-]> <Esc>

nmap <CR> o<Esc>
nmap <F2> O<Esc>

let fortran_do_enddo=1
let fortran_if_endif=1
let b:fortran_do_enddo=1

"let s:extfname = expand("%:e")
"if s:extfname ==? "" || s:extfname ==? "sh"
"set noexpandtab
"else
"set expandtab
"endif


"" inyou style -------------------------------------
"if &compatible
"  set nocompatible
"endif
"filetype plugin indent on
"syntax enable
"set t_Co=256
""set fileformats=unix, dos
"
"set smarttab
"set expandtab
"set virtualedit=block
"
"set ignorecase
"set smartcase
"set incsearch
"set nohlsearch
"set wrapscan
"
"set list
"set number
"set listchars=tab:>-,trail:~
"
"set ambiwidth=double
""if has('path_extra')
""    set tags& tags +=.tags, tags
""endif
"set laststatus=2
"set showtabline=2
"
"set clipboard=unnamed
"
"set backspace=eol,indent,start
"
"set wildmenu
"set wildmode=list:full
"set wildignore=*.o,*.obj,*.pyc,*.so,*.dll
"let g:python_highlight_all = 1


" NeoBundle ---------------------------
"autocmd VimEnter,Colorscheme * highlight SpecialKey cterm=NONE ctermfg=244 ctermbg=NONE
"
"
"" Note: Skip initialization for vim-tiny or vim-small.
" if 0 | endif
"
" if &compatible
"   set nocompatible               " Be iMproved
" endif
"
" " Required:
" set runtimepath+=~/.vim/bundle/neobundle.vim/
"
" " Required:
" call neobundle#begin(expand('~/.vim/bundle/'))
"
" " Let NeoBundle manage NeoBundle
" " Required:
" NeoBundleFetch 'Shougo/neobundle.vim'
"
" " My Bundles here:
" " Refer to |:NeoBundle-examples|.
" " Note: You don't set neobundle setting in .gvimrc!
""NeoBundle 'Townk/vim-autoclose'
"NeoBundle 'cohama/lexima.vim'
"NeoBundle 'itchyny/lightline.vim'
"NeoBundle 'Shougo/neosnippet.vim'
"NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'Shougo/neocomplete.vim'
"NeoBundle 'davidhalter/jedi-vim'
"
" call neobundle#end()
"
" " Required:
" filetype plugin indent on
"
" " If there are uninstalled bundles found on startup,
" " this will conveniently prompt you to install them.
" NeoBundleCheck


" vim-indent-guides set
let g:indent_guides_guide_size=1
let g:indent_guides_start_level = 2


" Braceless
autocmd FileType python BracelessEnable +fold +highlight


" python pep8
" original http://stackoverflow.com/questions/12374200/using-uncrustify-with-vim/15513829#15513829
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

function! Autopep8()
    call Preserve(':silent %!autopep8 -')
endfunction


" Shift + F で自動修正
autocmd FileType python nnoremap <S-p> :call Autopep8()<CR>
