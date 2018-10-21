" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

  " Basic Feature  {{{
  "
  " menu
  Plug 'scrooloose/nerdtree'

  " file search
  Plug 'kien/ctrlp.vim'
  Plug 'junegunn/fzf'

  " text search
  Plug 'mileszs/ack.vim'
  Plug 'dyng/ctrlsf.vim'

  " lint
  Plug 'w0rp/ale'

  " comment
  Plug 'scrooloose/nerdcommenter'

  " git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  " code snippet
  Plug 'SirVer/ultisnips'

  " }}}
  "

  " Python {{{
  "
  Plug 'tell-k/vim-autopep8'
  Plug 'nvie/vim-flake8'
  Plug 'fisadev/vim-isort', {'autoload': {'filetypes': ['python']}}
  "
  " }}}
  "
  " PHP {{{
  "
  Plug 'StanAngeloff/php.vim'
  "
  " }}}
  "
  " GUI {{{
  "
  Plug 'vim-airline/vim-airline'
  "
  " }}}
  "
  " Colorschemes {{{

  " Dark themes
  " Improved terminal version of molokai, almost identical to the GUI one
  Plug 'joedicastro/vim-molokai256'

  Plug 'tomasr/molokai'
  Plug 'sjl/badwolf'
  Plug 'nielsmadan/harlequin'


  " Light themes
  Plug 'vim-scripts/summerfruit256.vim'
  Plug 'joedicastro/vim-github256'

  " Make terminal themes from GUI themes
  Plug 'godlygeek/csapprox', {'on_cmd' : ['CSApprox', 'CSApproxSnapshot']}

  " }}}
  "
  "
  " Other {{{
  "
  Plug 'terryma/vim-expand-region'
  Plug 'terryma/vim-smooth-scroll'

  Plug 'ryanoasis/vim-devicons'
  "
  " }}}

call plug#end()



" Required:
filetype plugin indent on
syntax enable


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Environment
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Basics  options {{{

set nocompatible               " must be first line
set background=dark            " Assume a dark background

" General
" set fencs=utf-8,gb2312,gbk     " Sets the default encoding
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
" set autochdir                  " always switch to the current file directory.
set encoding=utf-8

set nospell                    " spell checking off
set shortmess+=filmnrxoOtT     " abbrev. of messages (avoids 'hit enter')
set virtualedit=onemore        " allow for cursor beyond last character
set history=1000               " Store a ton of history (default is 20)

set noswapfile
set backup                     " backups are nice ...
set backupdir=~/.vim/backup

" When vimrc is edited, reload it
autocmd! BufWritePost ~/.vimrc source ~/.vimrc

" set clipboard
set clipboard+=unnamed

" }}}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
"     color solarized
"     set background=dark
"     let g:solarized_termcolors=256
"     let g:solarized_termtrans=1
" endif


" Colorscheme {{{

syntax enable                  " enable the syntax highlight
set background=dark            " set a dark background
set t_Co=256                   " 256 colors for the terminal
if has('gui_running')
    colorscheme molokai
else
    colorscheme molokai256
endif

" }}}


" Font {{{

set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12

" }}}


" Basic config {{{

set tabpagemax=15             " only show 15 tabs
set showmode                  " display the current mode

set cursorline                " highlight current line
set cursorcolumn              " highlight current column

set laststatus=2
set backspace=indent,eol,start " Backspace for dummys
set linespace=0                " No extra spaces between rows
set nu                         " Line numbers on
set showmatch                  " Show matching brackets/parenthesis
set incsearch                  " Find as you type search
set hlsearch                   " Highlight search terms
set winminheight=0             " Windows can be 0 line high
set ignorecase                 " Case insensitive search
set smartcase                  " Case sensitive when uc present
set wildmenu                   " Show list instead of just completing
set wildmode=list:longest,full " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]  " Backspace and cursor keys wrap to
set scrolljump=5               " Lines to scroll when cursor leaves screen
set scrolloff=3                " Minimum lines to keep above and below cursor
set nofoldenable               " Disable fold code
set gdefault                   " The /g flag on :s substitutions by default
set hidden                     " Change buffer - without saving
set magic                      " Set magic on, for regular expressions
set autoread                   " Auto reload file on change
set list
set listchars=tab:>\ ,trail:\ ,extends:#,nbsp:\  " Highlight problematic whitespace
set cc=100

" }}}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tabs, space and wrapping {{{

set expandtab                  " spaces instead of tabs
set tabstop=4                  " a tab = four spaces
set shiftwidth=4               " number of spaces for auto-indent
set softtabstop=4              " a soft-tab of four spaces
set autoindent                 " set on the auto-indent

" set formatoptions=qrn1ct
set textwidth=80
set colorcolumn=81

function! ToggleWrap()
    let s:nowrap_cc_bg = [22, '#005f00']
    redir => s:curr_cc_hi
    silent hi ColorColumn
    redir END
    let s:curr_cc_ctermbg = matchstr(s:curr_cc_hi, 'ctermbg=\zs.\{-}\s\ze\1')
    let s:curr_cc_guibg = matchstr(s:curr_cc_hi, 'guibg=\zs.\{-}\_$\ze\1')
    if s:curr_cc_ctermbg != s:nowrap_cc_bg[0]
        let g:curr_cc_ctermbg = s:curr_cc_ctermbg
    endif
    if s:curr_cc_guibg != s:nowrap_cc_bg[1]
        let g:curr_cc_guibg = s:curr_cc_guibg
    endif
    if &textwidth == 80
        set textwidth=0
        exec 'hi ColorColumn ctermbg='.s:nowrap_cc_bg[0].
                    \' guibg='.s:nowrap_cc_bg[1]
    elseif &textwidth == 0
        set textwidth=80
        exec 'hi ColorColumn ctermbg='.g:curr_cc_ctermbg.
                    \' guibg='.g:curr_cc_guibg
    endif
endfunction

nmap <silent><Leader>ew :call ToggleWrap()<CR>

" }}}


" Basic Config {{{

set wrap            " wrap long lines
set linebreak       " set linebreak
set textwidth=0     " sets the text width
set smartindent     " Smart indet

" }}}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Basic Config {{{

" The default leader is '\', but many people prefer ',' as it's in a standard
" location, BUT I LOVE SPACE!!!!
let mapleader = ' '

" Fast editing of the .vimrc
map <leader>v :e ~/.vimrc<cr>

" Don't lazy to map : to ;, ; has it's own usage in search
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :bd<CR>

" Quickly esc in insert mode
inoremap jk <Esc>

" }}}


" split windows {{{

nnoremap <Leader>- :sp<CR>
nnoremap <Leader>+ :vsp<CR>

" }}}


" move windows {{{

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" }}}


" Remap VIM 0 and 9 {{{

map 9 ^
map 0 $

" }}}


" Use the arrows to something usefull {{{

nnoremap <right> :bn!<cr>
nnoremap <left> :bp!<cr>

" }}}


" move line like st {{{

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
set <A-j>=∆
set <A-k>=˚
set <A-h>=˙
set <A-l>=¬
set <A-a>=å
set <A-d>=∂

" }}}


" Cut / Paste {{{

" to/from the clipboard
map <Leader>y "*y
map <Leader>p "*p

" toggle paste mode
map <Leader>P :set invpaste<CR>

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" }}}

" clearing highlighted search {{{

nmap <silent> <leader>/ :nohlsearch<CR>

" }}}

" Change Working Directory to that of the current file {{{

cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" }}}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins {
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NerdTree {{{

    map <C-n> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
    map <leader>e :NERDTreeFind<CR>
    nmap <leader>nf :NERDTreeFind<CR>

    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.DS_Store']
    let NERDTreeChDirMode=2
    let NERDTreeQuitOnOpen=1
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1

" }}}


" airline {{{

    let g:airline_powerline_fonts = 1
    function! AirlineInit()
      let g:airline_section_a = airline#section#create(['(づ￣ 3￣)づ', ' ', 'mode'])
      let g:airline_section_x = airline#section#create(['tagbar'])
      let g:airline_section_y = airline#section#create([''])
    endfunction
    autocmd User AirlineAfterInit call AirlineInit()

" }}}


" ale {{{

    let g:ale_linters = {
                \   'sh' : ['shellcheck'],
                \   'vim' : ['vint'],
                \   'html' : ['tidy'],
                \   'python' : ['flake8'],
                \   'markdown' : ['mdl'],
                \   'javascript' : ['eslint'],
                \}
    " python standard
    let g:ale_python_flake8_executable = 'python3'
    let g:ale_python_flake8_options = '-m flake8'
    let g:ale_php_phpcs_standard="/Users/tinybox/workplace/pgyer/config/pgyer_phpcs_ruleset.xml"
    " If emoji not loaded, use default sign
    try
        let g:ale_sign_warning = emoji#for('boom')
        let g:ale_sign_error = emoji#for('boom')
    catch
        " Use same sign and distinguish error and warning via different colors.
        let g:ale_sign_error = '•'
        let g:ale_sign_warning = '•'
    endtry
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
    let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']

    " For a more fancy ale statusline
    function! ALEGetError()
        let l:res = ale#statusline#Status()
        if l:res ==# 'OK'
            return ''
        else
            let l:e_w = split(l:res)
            if len(l:e_w) == 2 || match(l:e_w, 'E') > -1
                return ' •' . matchstr(l:e_w[0], '\d\+') .' '
            endif
        endif
    endfunction

    function! ALEGetWarning()
        let l:res = ale#statusline#Status()
        if l:res ==# 'OK'
            return ''
        else
            let l:e_w = split(l:res)
            if len(l:e_w) == 2
                return ' •' . matchstr(l:e_w[1], '\d\+')
            elseif match(l:e_w, 'W') > -1
                return ' •' . matchstr(l:e_w[0], '\d\+')
            endif
        endif
    endfunction

    let g:ale_echo_msg_error_str = '✹ Error'
    let g:ale_echo_msg_warning_str = '⚠ Warning'

    nmap <Leader>en <Plug>(ale_next)
    nmap <Leader>eN <Plug>(ale_previous)

" }}}


" Ack {{{

    if executable('ag')
      let g:ackprg = 'ag --vimgrep'
    endif
    ca Ack Ack!

" }}}


" fzf {{{

    nmap <leader>p :FZF<CR>

" }}}


" ctrlp {{{

    set wildignore+=*/tmp/*,*.so,*.swp,*.zip
    let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
    nnoremap <C-m> :CtrlPBuffer<CR>

" }}}


" nerdcomment {{{

    let g:NERDSpaceDelims=1
    let g:NERDDefaultAlign='start'

" }}}


" vim-expand-region {{{

    vmap v <Plug>(expand_region_expand)
    vmap V <Plug>(expand_region_shrink)

" }}}


" vim-smooth-scroll {{{

    noremap <silent> <Leader>k :call smooth_scroll#up(&scroll, 0, 2)<CR>
    noremap <silent> <Leader>j :call smooth_scroll#down(&scroll, 0, 2)<CR>

" }}}


" ctrlsf {{{

    nnoremap <leader>f :CtrlSF<Space>
    nnoremap <C-f> :CtrlSFOpen<CR>

" }}}


" gitgutter {{{

    nmap <Leader>gn <Plug>GitGutterNextHunk
    nmap <Leader>gp <Plug>GitGutterPrevHunk

" }}}


" autopep8 {{{

    autocmd FileType python noremap <buffer> <C-=> :call Autopep8()<CR>
    let g:autopep8_ignore="E731"
    let g:autopep8_max_line_length=120
    let g:autopep8_disable_show_diff=1

" }}}


" js syntax {{{

    autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
    autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
    autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 1
    autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
    autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 0

" }}}


" neocomplete {{{

    "Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? "\<C-y>" : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

    " AutoComplPop like behavior.
    "let g:neocomplete#enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif
    "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" }}}

function! Run()
  if &filetype == 'sh'
    call "!bash %"
  elseif &filetype == 'python'
    exec "!time python3 %"
  elseif &filetype == 'php'
    exec "!php %"
  elseif &filetype == 'javascript'
    exec "!node %"
  elseif &filetype == 'c' || &filetype == 'cpp'
    call Compile()
  elseif &filetype == 'java'
    call CompileJava()
  endif
endf

" 这个是为了以后项目推送做个例子
function! Synchaojing()
    exec "!rsync -hlrtuOP --del --exclude-from local_haojing_path/.rsync_ignore local_haojing_path username@remote_ip:remote_haojing_path"
endf

" nnoremap rt :call Syncfrontjs()<CR><CR>
nnoremap rr :call Run()<CR>

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

