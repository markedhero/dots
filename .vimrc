"" Vim-Plug ====================================

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')      " Minimalist Vim Plugin Manager


""" Settings ====================================

set nocompatible                       " be iMproved, required
set nobackup
set noswapfile
set termencoding=utf-8                 " UTF8 as default encoding
set encoding=utf-8                     " ...

Plug 'tpope/vim-sensible'              " Sensible Defaults


""" Input =======================================

set mouse=a                            " Mouse Support
set clipboard=unnamedplus              " Share X11 clipboard
set t_BE=                              " Disable bracketed paste

let mapleader = ','

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use <leader>/ to clear search highlight
nmap <silent> <leader>/ :nohlsearch<CR>


""" Display =====================================

set pastetoggle=<F2>
set listchars=tab:\|.,trail:.,extends:#,nbsp:.

Plug 'vim-airline/vim-airline'         " Status/Tabline
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'

""" Plug 'edkolev/tmuxline.vim'            " Simple tmux statusline generator
Plug 'universal-ctags/ctags'           " ctags implementation

Plug 'majutsushi/tagbar'               " Displays tags in a window
  nmap <F8> :TagbarToggle<CR>


""" Utilities ===================================

Plug 'Shougo/vimfiler.vim'             " Powerful file explorer
Plug 'Shougo/neocomplete.vim'          " Source Completion
Plug 'kassio/neoterm'                  " Terminal Wrapper
Plug 'tpope/vim-eunuch'                " Helpers for UNIX
Plug 'tpope/vim-dispatch'              " Async Build/Test
Plug 'benmills/vimux'                  " tmux Integration

Plug 'mileszs/ack.vim'                 " Enhanced Grepping within Vim
  if executable('ag')
    let g:ackprg = 'ag --vimgrep'
  endif

Plug 'ctrlpvim/ctrlp.vim'              " Fuzzy file/buffer/mru/tag/etc finder
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'some_bad_symbolic_links',
  \ }
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


""" Languages ===================================

Plug 'sheerun/vim-polyglot'            " Language Support

Plug 'scrooloose/syntastic'            " Syntax checking hacks for vim
  nmap <leader>c :SyntasticCheck<CR>
  set statusline+=%#warningmsg#
  set statusline+=%*
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_error_symbol="S>"
  let g:syntastic_style_error_symbol="E>"
  let g:syntastic_warning_symbol="W>"
  let g:syntastic_style_warning_symbol="W>"

Plug 'fatih/vim-go'                    " Go development plugin for Vim
  let g:go_auto_type_info = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_interfaces = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_extra_types = 1


""" Editor ======================================

set guioptions-=m                      "remove menu bar
set guioptions-=T                      "remove toolbar
set guioptions-=r                      "remove right-hand scroll bar
set guioptions-=L                      "remove left-hand scroll bar

"set list                               " Show whitespace
set ruler                              " Show line/cursor position
set number                             " Show line numbers
set wrap linebreak nolist
autocmd BufWritePre * %s/\s\+$//e      " Delete trailing whitespace on save

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4

Plug 'tpope/vim-sleuth'                " Heuristically set buffer options
Plug 'nathanaelkane/vim-indent-guides' " Visaully display indent level

Plug 'junegunn/vim-easy-align'         " Easier text alignment
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)

Plug 'ervandew/supertab'               " Vim insert mode completions with Tab
Plug 'tpope/vim-surround'              " Quoting/Parenthesizing made simple
Plug 'junegunn/limelight.vim'          " Hyperfocus-writing in Vim


""" Theme =======================================

"Plug 'mtglsk/mushroom'

try
  set background=dark
 " autocmd VimEnter * colorscheme mushroom
catch
endtry


""" Version Control System ======================

Plug 'airblade/vim-gitgutter'          " Show git diff in the gutter
  nmap <Leader>ha <Plug>GitGutterStageHunk
  nmap <Leader>hr <Plug>GitGutterUndoHunk

Plug 'tpope/vim-fugitive'              " Git wrapper
Plug 'tpope/vim-git'                   " Git integration
Plug 'mattn/gist-vim'                  " Gist upload (GitHub)

call plug#end()
