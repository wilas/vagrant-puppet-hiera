" turn off auto adding comments on next line
" so you can cut and paste reliably
" http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
" set fo=tcq

syntax on

set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4

set bg=dark

" highlight LiteralTabs ctermbg=darkgreen guibg=darkgreen
" match LiteralTabs /\s\  /
" highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
" match ExtraWhitespace /\s\+$/

" Show me a ruler
set ruler

" ****************************************************************************
" " Misc Stuff
" ****************************************************************************
filetype plugin indent on
