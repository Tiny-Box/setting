"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is the personal vim config used by TinyBox.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Enable plugins
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'kien/ctrlp.vim'
" Plugin 'Lokaltog/vim-powerline'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'digitaltoad/vim-pug'
Plugin 'vim-airline/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'tell-k/vim-autopep8'
" Plugin 'honza/vim-snippets'
Plugin 'rking/ag.vim'
Plugin 'junegunn/fzf'
Plugin 'w0rp/ale'
Plugin 'nvie/vim-flake8'
Plugin 'mindriot101/vim-yapf'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-expand-region'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'dyng/ctrlsf.vim'
Plugin 'Shougo/neocomplete.vim'
" Color Schemes
Plugin 'flazz/vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'

call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Environment
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basics
set nocompatible               " must be first line
set background=dark            " Assume a dark background

syntax on                      " syntax highlighting
filetype plugin indent on      " Automatically detect file types.

" General
" set fencs=utf-8,gb2312,gbk     " Sets the default encoding
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
" set autochdir                  " always switch to the current file directory.

set nospell                    " spell checking off
set shortmess+=filmnrxoOtT     " abbrev. of messages (avoids 'hit enter')
set virtualedit=onemore        " allow for cursor beyond last character
set history=1000               " Store a ton of history (default is 20)

set noswapfile
set backup                     " backups are nice ...
set backupdir=~/.vim/backup
set undofile                   " persistent undo
set undolevels=1000            " maximum number of changes that can be undone
set undoreload=10000           " maximum number lines to save for undo on a buffer reload
set undodir=~/.vim/undo

" When vimrc is edited, reload it
autocmd! BufWritePost ~/.vimrc source ~/.vimrc

" set clipboard
set clipboard+=unnamed

autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

set tags+=~/workplace/baixing/haojing/tags;,./tags;,tags;

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
    color solarized
    set background=dark
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1
endif
" " lighting line setting 
" let g:lightline = {
      " \ 'colorscheme': 'wombat',
      " \ }
set term=builtin_xterm         " Make terminal stuff works
set t_Co=256

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wrap            " wrap long lines
set linebreak       " set linebreak
set textwidth=0     " sets the text width
set autoindent      " Auto indent
set smartindent     " Smart indet
set expandtab       " tabs are spaces, not tabs
set smarttab        " Smart tab
set shiftwidth=4    " use indents of 4 spaces
set tabstop=4       " an indentation every four columns
set softtabstop=4   " let backspace delete indent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"The default leader is '\', but many people prefer ',' as it's in a standard
"location
let mapleader = ' '

" Fast editing of the .vimrc
map <leader>v :e ~/.vimrc<cr>

" Don't lazy to map : to ;, ; has it's own usage in search
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :bd<CR>

" Remap VIM 0 and 9
map 9 ^
map 0 $

inoremap jk <Esc>

" " Paste mode toggle
" nnoremap <leader>pp :setlocal paste!<cr>

" Use the arrows to something usefull
nnoremap <right> :bn!<cr>
nnoremap <left> :bp!<cr>

" move windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" move line like st
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

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Close the current buffer
map <leader>d :Bclose<cr>

" Close all the buffers
map <leader>D :1,300 bd<cr>:q<cr>

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

"clearing highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

" Shortcuts
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Save and return to normal mode on FocusLost
au FocusLost * :silent! wall                 " Save on FocusLost
au FocusLost * call feedkeys("\<C-\>\<C-n>") " Return to normal mode on FocustLost

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins {
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree
    map <C-n> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
    map <leader>e :NERDTreeFind<CR>
    nmap <leader>nf :NERDTreeFind<CR>

    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.DS_Store']
    let NERDTreeChDirMode=2
    let NERDTreeQuitOnOpen=1
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1

" Tagbar
    nnoremap <silent> <C-t> :TagbarToggle<CR>

" airline
"     let g:airline_theme='light'
    let g:airline_powerline_fonts = 1
    function! AirlineInit()
      let g:airline_section_a = airline#section#create(['(づ￣ 3￣)づ', ' ', 'mode'])
      let g:airline_section_x = airline#section#create(['tagbar'])
      let g:airline_section_y = airline#section#create([''])
    endfunction
    autocmd User AirlineAfterInit call AirlineInit()

" Trigger 
    let g:UltiSnipsUsePythonVersion=2
    let g:UltiSnipsExpandTrigger="<Leader><tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    let g:UltiSnipsListSnippets="<c-e>"

" ale
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

" fzf
    nmap <leader>p :FZF<CR>

" ctrlp
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip
    let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
    nnoremap <C-m> :CtrlPBuffer<CR>

" nerdcomment
    let g:NERDSpaceDelims=1
    let g:NERDDefaultAlign='start'

" vim-expand-region
    vmap v <Plug>(expand_region_expand)
    vmap V <Plug>(expand_region_shrink)

" vim-smooth-scroll
    noremap <silent> <Leader>k :call smooth_scroll#up(&scroll, 0, 2)<CR>
    noremap <silent> <Leader>j :call smooth_scroll#down(&scroll, 0, 2)<CR>


" ag
    let g:ag_arg='ag -S --nocolor --nogroup --column --ignore tags --ignore .git'
    " disbale open first result in buffer
    ca Ag Ag!


" ctrlsf
    nnoremap <leader>f :CtrlSF<Space>
    nnoremap <C-f> :CtrlSFOpen<CR>

" gitgutter
    nmap <Leader>gn <Plug>GitGutterNextHunk
    nmap <Leader>gp <Plug>GitGutterPrevHunk

" easymotion
    let g:EasyMotion_smartcase = 1
    "let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
    map <Leader><leader>h <Plug>(easymotion-linebackward)
    map <Leader><Leader>j <Plug>(easymotion-j)
    map <Leader><Leader>k <Plug>(easymotion-k)
    map <Leader><leader>l <Plug>(easymotion-lineforward)
    " 重复上一次操作, 类似repeat插件, 很强大
    map <Leader><leader>. <Plug>(easymotion-repeat)

"" signify
"    let g:signify_vcs_list              = [ 'git' ]
"    let g:signify_cursorhold_insert     = 1
"    let g:signify_cursorhold_normal     = 1
"    let g:signify_update_on_bufenter    = 0
"    let g:signify_update_on_focusgained = 1
"    let g:signify_realtime = 0
"
"    nnoremap <leader>gr :SignifyRefresh<CR>
"    nnoremap <leader>gd :SignifyDebug<CR>
"    nnoremap <leader>gl :SignifyList<CR>
"
"    " hunk jumping
"    nmap <leader>gj <plug>(signify-next-hunk)
"    nmap <leader>gk <plug>(signify-prev-hunk)

" autopep8
    autocmd FileType python noremap <buffer> <C-=> :call Autopep8()<CR>
    let g:autopep8_ignore="E731"
    let g:autopep8_max_line_length=120
    let g:autopep8_disable_show_diff=1

" js syntax
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 1
autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 0

" php syntax


" neocomplete
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
    
" haojing 
au bufnewfile,bufread */haojing*/*.* setlocal noexpandtab
au bufnewfile,bufread */haojing*/*.php setlocal nolist
au bufnewfile,bufread */haojing*/*.php let b:ale_php_phpcs_standard="/Users/tinybox/Documents/code_style/phpcs_ruleset.xml"

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

function! Synchaojing()
    exec "!rsync -hlrtuOP --del --exclude-from /Users/tinybox/workplace/baixing/haojing/.rsync_ignore /Users/tinybox/workplace/baixing/haojing/ wangyanxiang@192.168.2.2:~/haojing/"
endf

nnoremap rt :call Synchaojing()<CR><CR>
nnoremap rr :call Run()<CR>

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
