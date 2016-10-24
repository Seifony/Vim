set background=dark
"colorscheme xoria256
"""Sourcing Project Specific .vimrc
set exrc
set secure
"""Indentation rules
"///////////////////"
"Autoindentation
filetype indent on
set tabstop=2
set softtabstop=4
set shiftwidth=4
set noexpandtab
set number
nnoremap    <F12> :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>
"///////////////////"
"ShortCuts
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
"///////////////////"
syntax enable
"""Highlights
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
highlight CursorLine   cterm=NONE ctermbg=darkred
highlight CursorColumn cterm=NONE ctermbg=darkred

"Highlight Coulmn limit
if exists('+colorcolumn')
    set colorcolumn=88   
"    let &colorcolumn="80,".join(range(120,230),",")
  else
      au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>88v.\+', -1)
    endif
highlight ColorColumn ctermbg=darkred guibg=NONE

"///////////////////"
"""ADD column for new line break
set colorcolumn=88
set textwidth=88
highlight ColorColumn ctermbg=darkred

"///////////////////"

""" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"///////////////////"
""Avoid writing headers:
"autocmd BufNewFile *.cpp r /path/to/file.cpp

""""Compiling and Running programs from Vim
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
map <F3> :!pdflatex % <CR>
map <F4> :!okular %:r.pdf & <CR>
map <F5> :!python % <CR>
map <F6> :!gcc % -lm -Ofast -std=c99 <CR>
map <F7> :!g++ % -lm -std=c99 && ./a.out <CR>

"///////////////////"
"""Plugins
"///////////////////"
"""cvim
filetype plugin on
"///////////////////"
"""Pythogen
execute pathogen#infect()
"""RainbowParentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
