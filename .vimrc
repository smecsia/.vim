" Nicolas vimrc
" nmap gR :commandv
" use za to close/open foldings
set nocp      " nocompatible
"  instal font and use it
"  sudo apt-get install xfonts-terminus
set guifont=Terminus\ 14
" highlite line and column
set cursorline 
"more colors in terminal
set t_Co=256
set nu
set numberwidth=3
" change color sheme on mode
au InsertLeave * hi CursorLine     guibg=#333333
au InsertEnter * hi CursorLine     guibg=#213333
" set list
" Show $ at end of line and trailing space as ~
set laststatus=2  " Always show status line.
" Теперь нет необходимости передвигать курсор к краю экрана, чтобы
" подняться в режиме редактирования
set scrolljump=5
" Теперь нет необходимости передвигать курсор к краю экрана, чтобы
" опуститься в режиме редактирования
set scrolloff=5
" Формат строки состояния
set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P 
set laststatus=2
set mouse=a " enable mouse
set guioptions=a
set noeb
set novb
set et        " expandtab
"set wm=8      " wrapmargin
set bs=2      " backspace
"set ru        " ruler
set ic        " ignorecase
set is        " incsearch
set scs       " smartcase: override the 'ic' when searching
set shiftwidth=2  " use two spases for intend
set backup
set nowrap
syn on 
filetype plugin indent on
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" im not shure wi need it
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType ruby,eruby set omnifunc=rubycomplete
au! BufRead,BufNewFile *.haml         setfiletype haml 
" buffer maps  2
" save
"map <C-S> :w<CR>
"map <C-Q> :q<CR>
map <c-tab> :bnext<cr>
map <s-tab> :bprevious<cr>
" clipboard
vmap <C-C> "+y
nmap <C-V> "+gP
" open explorer
map <C-E> :Explore<CR>
" in normal mode space is visual selection 
nmap <S-b> :BufferExplorer<cr>
nmap <S-e> :BufExplorer<cr>
"  2}}}
" line manipulation maps  2
" enable eclipse style moving of lines
nmap <M-j> mz:m+<CR>`z==
nmap <M-k> mz:m-2<CR>`z==
imap <M-j> <Esc>:m+<CR>==gi
imap <M-k> <Esc>:m-2<CR>==gi
vmap <M-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z
"  2}}}
" F buttons  2
"allow/dis line wrap
map <F2> :cprevious<cr>
map <F3> :cnext<cr>
nmap <s-f> mngg=G`n
"show buffer explorer
map <c-space> \lb
map <s-space> \be
nmap \fo :!firefox -new-tab % &<cr> 
" Поиск и замена слова под курсором
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/
nmap ,; :%s/<c-r>=expand("<cword>")<cr>/<c-r>=expand("<cword>")<cr>/g
" nmap <c-m> :MarksBrowser<cr>
nmap ' `
"fs brousing navigation  
let g:netrw_list_hide='\~$,\~\*$,\.swp$,\.svn'
" automatization  
"open file in firefox
au BufNewFile,BufRead *.as set filetype=actionscript
au BufNewFile,BufRead *.mxml set filetype=mxml
set t_Co=256
colorscheme lucius
" fix vimrc
cabbr vimrc e ~/.vim/.vimrc<cr>
augroup RubyTests
  au!
  autocmd BufRead,BufNewFile *.rb,*.rb
        \ :compiler ruby
  autocmd BufRead,BufNewFile *_test.rb,test_*.rb
        \ :compiler rubyunit
  autocmd BufRead,BufNewFile *.rb,*.rb
        \ :map <buffer> <F5> :make %<cr>
augroup END
map <F10> :cal VimCommanderToggle()<cr>

" the last string is instructions for vim about this file
" vim:ft=vim:fdm=marker:ff=unix:nowrap:tabstop=4:shiftwidth=4:softtabstop=4:smarttab:shiftround:expandtab

"open current directory on ctrl+c
map <c-c> :exec 'Explore '.getcwd()<CR>

"open online documentation on word under cursor
function! OnlineDoc()
  let s:browser = "chromium-browser"
  let s:wordUnderCursor = expand("<cword>")
  if &ft == "ruby"
    let s:url = "http://www.google.ru/search?q=".s:wordUnderCursor."+ruby+on+rails"
  elseif &ft == "vim"
    let s:url = "http://www.google.com/codesearch?q=".s:wordUnderCursor
  else
    return
  endif
  let s:cmd = "silent !" . s:browser . " " . s:url
  execute s:cmd
  redraw!
endfunction



function! OpenView()

  :exec 'Explore '.getcwd()<CR>
endfunction

function! OpenController()

  :exec 'Explore '.getcwd()<CR>
endfunction


" Online doc search.
nmap <c-d> :call OnlineDoc()<CR>
imap <c-r> <ESC>
nmap f mygg=G'y
nmap s :w<CR>
nmap <a-o> a<CR><Esc>k$
nmap q :q<CR>
" debug mapping
nmap <F4>        :call g:RubyDebugger.toggle_breakpoint()<CR>
"nmap <>        :call g:RubyDebugger.open_variables()<CR>
nmap <c-B>       :call g:RubyDebugger.open_breakpoints()<CR>
nmap <c-T>        :call g:RubyDebugger.open_frames()<CR>
nmap <F5>        :call g:RubyDebugger.step()<CR>
nmap <F8>        :call g:RubyDebugger.finish()<CR>
nmap <F6>        :call g:RubyDebugger.next()<CR>
nmap <F7>        :call g:RubyDebugger.continue()<CR>
nmap <F9>        :call g:RubyDebugger.exit()<CR>
nmap <Leader>d   :call g:RubyDebugger.remove_breakpoints()<CR>
nnoremap <C-_> zM
nnoremap <NL> zR
"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold
" nmap O :normal i<CR><ESC>
nmap <c-i> :call OpenRequire('e')<CR>
nmap <c-t> :!ruby #<CR>
nmap [[ ?def <CR>
nmap ]] /def <CR>
vmap c "+y
map <C-F5> :!ruby %<cr>
set backupdir=~/.vimtmp,.
set directory=~/.vimtmp,.
nmap <c-a> myi<cr><Esc>'y
nmap gH :H<cr>
nmap gTH :TH<cr>
nmap gT :T<cr>
nmap gC :C<cr>
nmap gS :S<cr>
noremap <c-F12> :cal VimCommanderToggle()<CR>
map <C-F10> :set paste<CR>
map <C-F11> :set nopaste<CR>
map <Leader>\ <Plug>RubyTestRun
map <Leader>] <Plug>RubyFileRun
map <C-D> :!git diff %<CR>
map <A-F5> :!spec %<CR>
