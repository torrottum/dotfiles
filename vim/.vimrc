" ---------
" Plugins
" ---------
call plug#begin('~/.vim/plugged')
Plug 'w0ng/vim-hybrid' "colorscheme
Plug 'mileszs/ack.vim' "ag in a quickfix window
Plug 'jeffkreeftmeijer/vim-numbertoggle' "toggle rlu/number in normal/insert mode
call plug#end()

let g:ackprg = 'ag --vimgrep' "use ag instead of ack

" -------------
" Indentation
" -------------
set autoindent
set smartindent
set expandtab "Sorry, Richard, https://youtu.be/SsoOG6ZeyUI
set tabstop=4
set softtabstop=4
set shiftwidth=4

" -------------
" Visual
" -------------
syntax on
colorscheme hybrid
set relativenumber "relative numbers for faster movement
set number "but keep the absolute number for current line
filetype plugin indent on
set list "show whitespace
set listchars=tab:!·,trail:· "show tabs and trailing whitespace
set colorcolumn=80,120 ""ruler" at col 80 and 120

"Cursors (todo: VTE terminal/termite support)
let &t_ti = "\<Esc>]1337;CursorShape=0\x7"
let &t_SI = "\<Esc>]1337;CursorShape=1\x7"
let &t_SR = "\<Esc>]1337;CursorShape=2\x7"
let &t_EI = "\<Esc>]1337;CursorShape=0\x7"
autocmd VimLeave * let &t_me="\<Esc>]50;CursorShape=1\x7" "Reset on exit

" -------------
" Behaviour
" -------------
set timeoutlen=1000 ttimeoutlen=0
au CursorHold,CursorHoldI * silent! checktime "ask to reload changed files
