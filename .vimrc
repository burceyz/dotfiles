" Environment {

" Identify platform {
silent function! OSX()
return has('macunix')
        endfunction
        silent function! LINUX()
        return has('unix') && !has('macunix') && !has('win32unix')
    endfunction
    silent function! WINDOWS()
    return  (has('win32') || has('win64'))
endfunction
" }

" Basics {
set nocompatible        " Must be first line
if !WINDOWS()
    set shell=/bin/sh
endif
" }

" Windows Compatible {
" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
if WINDOWS()
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif
" }

" }


if LINUX()
    set backspace=2
    set mouse=a
    runtime! debian.vim
    if filereadable("/etc/vim/vimrc")
        source /etc/vim/vimrc
    endif
endif

if &compatible
    set nocompatible
endif
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'spf13/vim-colors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'rhysd/conflict-marker.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'vim-scripts/matchit.zip'
Plug 'easymotion/vim-easymotion'
Plug 'mbbill/undotree'
Plug 'Yggdroot/indentLine'
"Plug 'myhere/vim-nodejs-complete'
"Plug 'scrooloose/syntastic', {'for': ['javascript','jsx']}
"Plug 'scrooloose/syntastic', {'for': ['php', 'javascript','jsx']}
Plug 'tpope/vim-fugitive'
Plug 'mattn/gist-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'honza/vim-snippets'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'beyondwords/vim-twig'
Plug 'elzr/vim-json'
Plug 'groenewege/vim-less'
Plug 'kchmck/vim-coffee-script'
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'digitaltoad/vim-pug'
Plug 'powerline/fonts'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'reedes/vim-textobj-sentence'
Plug 'reedes/vim-textobj-quote'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'

Plug 'osyo-manga/vim-over'

Plug 'mhinz/vim-signify'

Plug 'ternjs/tern_for_vim', {'for':'javascript','do': 'npm install'}
Plug 'flowtype/vim-flow', {'for': ['javascript', 'jsx'], 'do': 'npm install -g flow-bin'}
"Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx'
"Plug 'neoclide/vim-jsx-improve'
Plug 'maksimr/vim-jsbeautify'

Plug 'lvht/phpcd.vim', {'do': 'composer install'}
Plug 'vim-scripts/php_localvarcheck.vim'
Plug 'beanworks/vim-phpfmt', {'for': 'php'}
Plug '2072/PHP-Indenting-for-VIm', {'for': 'php'}
Plug 'rafi/vim-phpspec', {'for': 'php'}
Plug 'StanAngeloff/php.vim'


Plug 'tpope/vim-abolish'

Plug 'jlanzarotta/bufexplorer'

Plug 'godlygeek/tabular'

Plug 'plasticboy/vim-markdown'

Plug 'mileszs/ack.vim'

Plug 'Shougo/vimproc.vim', {'do': 'make'}

Plug 'Valloric/YouCompleteMe', {'do': 'python ./install.py'}

Plug 'SirVer/ultisnips'

"Plug 'w0rp/ale', {'for': ['go']}
Plug 'w0rp/ale', {'for': ['go', 'php', 'c', 'cpp']}

Plug 'fatih/vim-go', {'do': 'GoInstallBinaries'}

Plug 'posva/vim-vue'

Plug 'tpope/vim-dispatch'

Plug 'KabbAmine/zeavim.vim'

Plug 'Shougo/vimshell.vim'


Plug '2072/PHP-Indenting-for-VIm'

Plug 'itchyny/vim-cursorword'

"" { Typescript Plugin
"Plug 'leafgarland/typescript-vim', {'on_ft': 'typescript'}

Plug 'Quramy/tsuquyomi',{'for':'typescript'}

Plug 'jason0x43/vim-js-indent'


"Plug 'Shougo/echodoc.vim'

Plug 'HerringtonDarkholme/yats.vim'

Plug 'junegunn/fzf', { 'do': './install --all', 'dir': '~/.fzf'}
Plug 'junegunn/fzf.vim'

Plug 'Chiel92/vim-autoformat'

Plug 'milkypostman/vim-togglelist'

Plug 'ludovicchabant/vim-gutentags',{'for': ['php', 'c', 'cpp']}

Plug 'WolfgangMehner/perl-support'

Plug 'c9s/perlomni.vim'

Plug 'vim-perl/vim-perl', {'for':'perl','do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny'}

"" }

"Plug 'OrangeT/vim-csharp'

"Plug 'OmniSharp/omnisharp-vim'

" Initialize plugin system
call plug#end()


filetype plugin indent on
syntax enable
" To ignore plugin indent changes, instead use:
filetype plugin on
filetype on                  " required



"general============================================================================

set gcr=a:block-blinkon0                              "禁止光标闪烁
set wrap
set number
set linebreak
set t_Co=256
colorscheme gruvbox
set background=dark
"cd /home/yuzhe/
set cursorline                  " Highlight current line
set cursorcolumn                  " Highlight current line
set shiftwidth=4
set softtabstop=4
set expandtab
set showmatch
set hlsearch
set incsearch
set cmdheight=2
set laststatus=2
syntax enable
set tags=tags
set ai
set si
set langmenu=zh_CN.UTF-8
set helplang=cn
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gbk,cp936,latin-1
set fileencoding=utf-8
set autoread
set vb t_vb=                                          "关闭提示音
set showcmd
let mapleader = ","
set ttyfast
set lazyredraw
set completeopt+=preview
set fileformats=unix
nnoremap j jzz
nnoremap k kzz

nnoremap <F9> :TagbarToggle<CR>
nnoremap <leader>; <esc>$a;<esc>
nnoremap <C-h> :OverCommandLine<CR>

vnoremap < <gv
vnoremap > >gv

set history=500
set undolevels=10000
if has("persistent_undo")
    set undodir=~/.vim/undodir/
    set undofile
endif



let g:airline_powerline_fonts = 1
let g:airline_theme = 'molokai'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
" Use the default set of separators with a few customizations
"let g:airline_left_sep = '»'
"let g:airline_right_sep = '«'
let g:airline_left_sep='›'  " Slightly fancier than '>'
let g:airline_right_sep='‹' " Slightly fancier than '<'
let g:airline_left_alt_sep = '»'
let g:airline_right_alt_sep = '«'

" UI=======================================================================
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"
color solarized             " Load a colorscheme
let g:airline_theme = 'solarized'

if has('gui_running')
    set guifont=Ubuntu\ Mono\ derivative\Powerline\ 12
    let g:airline_left_alt_sep = ''
    let g:airline_right_alt_sep = ''
    colorscheme molokai
    let g:airline_theme = 'molokai'
    set go=
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
endif


"缩进线设置
let g:indentLine_enabled = 1
let g:indentLine_char = "┊"
let g:indentLine_color_gui = '#66d9ef'

colorscheme solarized
let g:airline_theme = 'solarized'





"  < 插件配置 >
"----------------------------------------------------------------------------------------


" OmniComplete {
" To disable omni complete, add the following to your .vimrc.before.local file:
"   let g:spf13_no_omni_complete = 1
"if !exists('g:spf13_no_omni_complete')
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
                \if &omnifunc == "" |
                \setlocal omnifunc=syntaxcomplete#Complete |
                \endif
endif

hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

" Some convenient mappings
"inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
if exists('g:spf13_map_cr_omni_complete')
    inoremap <expr> <CR>     pumvisible() ? "\<C-y>" : "\<CR>"
endif
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

" Automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menu
"endif
" }

" Ctags {
set tags=./tags;/,~/.vimtags
"set tags+=/usr/include/tags

" Make tags placed in .git/tags file available in all levels of a repository
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
    let &tags = &tags . ',' . gitroot . '/.git/tags'
endif
" }


" NerdTree {
nnoremap <leader>e :NERDTreeToggle<CR>
map <C-e> :NERDTreeToggle<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" }


" AutoCloseTag {
" Make it so AutoCloseTag works for xml and xhtml files as well
au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
nmap <Leader>ac <Plug>ToggleAutoCloseMappings
" }



" JSON {
nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
let g:vim_json_syntax_conceal = 0
" }


" ctrlp {
let g:ctrlp_working_path_mode = 'ra'
nnoremap <silent> <leader>s :Files<cr>
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

if executable('ag')
    let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
elseif executable('ack-grep')
    let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
elseif executable('ack')
    let s:ctrlp_fallback = 'ack %s --nocolor -f'
    " On Windows use "dir" as fallback command.
elseif WINDOWS()
    let s:ctrlp_fallback = 'dir %s /-n /b /s /a-d'
else
    let s:ctrlp_fallback = 'find %s -type f'
endif
if exists("g:ctrlp_user_command")
    unlet g:ctrlp_user_command
endif
let g:ctrlp_user_command = {
            \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
            \ },
            \ 'fallback': s:ctrlp_fallback
            \ }

" CtrlP extensions
let g:ctrlp_extensions = ['funky']

"funky
nnoremap <Leader>fu :CtrlPFunky<Cr>
"}


" TagBar {
nnoremap <silent> <leader>tt :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 60
"}

" Fugitive {
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
" Mnemonic _i_nteractive
nnoremap <silent> <leader>gi :Git add -p %<CR>
nnoremap <silent> <leader>gg :SignifyToggle<CR>
"}


" youcompleteme{
let g:acp_enableAtStartup = 0

" enable completion from tags
"let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_cache_omnifunc = 1
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_seed_identifiers_with_syntax = 1
"let g:ycm_global_ycm_extra_conf = $HOME . '/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_complete_in_comments = 1

" remap Ultisnips for compatibility for YCM
let g:UltiSnipsExpandTrigger = '<C-k>'
let g:UltiSnipsJumpForwardTrigger = '<C-k>'
let g:UltiSnipsJumpBackwardTrigger = '<C-j>'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/.snippets/']

nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd FileType javascript,jsx,coffee,vue setlocal omnifunc=tern#Complete
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

" Haskell post write lint and check with ghcmod
" $ `cabal install ghcmod` if missing and ensure
" ~/.cabal/bin is in your $PATH.
if !executable("ghcmod")
    autocmd BufWritePost *.hs GhcModCheckAndLintAsync
endif

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

let g:ycm_semantic_triggers = {}
let g:ycm_semantic_triggers.php =
            \ ['->', '::', '(', 'use ', 'namespace ', '\']

" Disable the neosnippet preview candidate window
" When enabled, there can be too much visual noise
" especially when splits are used.
set completeopt+=preview
set completeopt+=longest
set completeopt+=noinsert
set completeopt+=noselect
"}


" UndoTree {
nnoremap <Leader>u :UndotreeToggle<CR>
" If undotree is opened, it is likely one wants to interact with it.
let g:undotree_SetFocusWhenToggle=1
" }







"  < cscope 工具配置 >
" -----------------------------------------------------------------------------
" 用Cscope自己的话说 - "你可以把它当做是超过频的ctags"
if has("cscope")
    "设定可以使用 quickfix 窗口来查看 cscope 结果
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    "使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳转
    set cscopetag
    "如果你想反向搜索顺序设置为1
    set csto=0
    "在当前目录中添加任何数据库
    if filereadable("cscope.out")
        cs add cscope.out
        "否则添加数据库环境中所指出的
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set cscopeverbose
    "快捷键设置
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif


let g:rainbow_active = 1
let g:rainbow_conf = {
            \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
            \   'ctermfgs': ['lightblue', 'lightyellow', 'yellow', 'lightmagenta'],
            \   'operators': '_,_',
            \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \   'separately': {
            \       '*': {},
            \       'tex': {
            \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
            \       },
            \       'lisp': {
            \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
            \       },
            \       'vim': {
            \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
            \       },
            \       'html': {
            \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
            \       },
            \       'css': 0,
            \       'javascript' : {'parentheses' : [['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold',  'start=/{/ end=/}/'], ['(', ')'], ['{', '}']],}
            \   }
            \}

" Tabularize {
nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
nmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a=> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a,, :Tabularize /,\zs<CR>
vmap <Leader>a,, :Tabularize /,\zs<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
" }

" vim-go{
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_gocode_unimported_packages = 1
let g:go_fmt_command = "goimports"
"let g:syntastic_go_checkers = ['errcheck', 'govet', 'golint']
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_enable_go_checker = 0
let g:go_list_type = "quickfix"
au FileType go nmap <leader>rt <Plug>(go-run-tab)
au FileType go nmap <leader>rs <Plug>(go-run-split)
au FileType go nmap <leader>rv <Plug>(go-run-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nnoremap <leader>im :GoImport<Space>
au FileType go inoremap <leader>im :GoImport<Space>
au FileType go nnoremap <leader>ima :GoImportAs<Space>
au FileType go inoremap <leader>ima :GoImportAs<Space>
" }

" { Ack-vim
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
nnoremap <Leader>a :Ack!<Space>
" }

" C compile{

nnoremap <F5> :make<CR>
"定义CompileRun函数，用来对不用外接库的小程序进行编译和运行,自己可以根据文件名扩展或实际情况修改参数
func CompileRun()
    exec "w"
    "C程序
    if &filetype == 'c'
        exec "!gcc % -g -o %<"
        exec "!.//%<"
    endif
endfunc
"结束定义CompileRun

"nnoremap <F5> :call Debug()<CR>
"定义Debug函数，用来调试小程序
func Debug()
    exec "w"
    "C程序
    if &filetype == 'c'
        exec "!rm %<"
        exec "!gcc % -g -o %<"
        exec "!gdb %<"
    elseif &filetype == 'cpp'
        exec "!rm %<"
        exec "!g++ % -g -o %<"
        exec "!gdb %<"
        exec "!rm %<.class"
        "Java程序
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!jdb %<"
    endif
endfunc
"定义dubug结束

" }

" vim-javascript{
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 1
autocmd FileType vue setlocal filetype=javascript
" }

" { padawan key map
autocmd Filetype c,cpp,php inoremap <C-o> <C-x><C-o>
let g:phpfmt_standard = 'PSR2'
autocmd FileType php inoremap <leader>4 $
autocmd FileType php inoremap <leader>1 !
autocmd FileType php inoremap <leader>- ->
" }

" { php namespace config
let g:php_namespace_sort_after_insert = 1
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>
" }
" { php syntastic config
let g:syntastic_php_checkers = ['phpstan','php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_args = "--standard=Custom"
let g:syntastic_php_phpstan_args = "-l 5"
let g:syntastic_php_phpmd_args = "/home/yz/tools/phpmd-rulesets/phpmd_ruleset.xml"


let g:syntastic_always_populate_loc_list = 1
autocmd FileType javascript.jsx nnoremap <Leader>e :FlowType<CR>
autocmd FileType javascript.jsx nnoremap <C-]> :call JumpToDefOnJsx()<cr>
autocmd FileType javascript.jsx nnoremap <C-t> :call JumpBackOnJsx()<cr>
nnoremap <script> <silent> <F7> :call ToggleLocationList()<CR>
"let g:flow#autoclose = 1
let g:syntastic_auto_loc_list = 1
" Asynchronous Lint Engine (ALE)
" Limit linters used for JavaScript.
let g:ale_emit_conflict_warnings = 0
let g:ale_linters = {
            \  'go': ['golint', ' gometalinter', 'go build', 'gofmt -e', 'errcheck', 'govet'],
            \  'php': ['phpstan', 'phpcs', 'php -l'],
            \}
"\  'go': ['golint', ' gometalinter', 'go build', 'gofmt -e', 'errcheck', 'staticcheck', 'govet'],
"\  'php': ['phpstan analyse --level=5 ', 'php -l', 'phpcs --standard=Custom', 'phpmd /home/yz/tools/phpmd-rulesets/phpmd_ruleset.xml'],
let g:ale_php_phpcs_standard = 'Custom'
let g:ale_php_phpstan_level = '5'
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_sign_error = 'X' " could use emoji
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>
" }

" { PHP syntax file config
function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END
" }

"{ reload conf
noremap <F6> :call ReloadToDev()<cr>
noremap <F8> :call UpdateComposer()<cr>
noremap <F3> :Autoformat<cr>
"}

" { Typescript config
let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:tsuquyomi_shortest_import_path = 1
autocmd FileType typescript setlocal completeopt+=menu,preview
" }

" { auto-indent
let g:formatdef_phpcbf = '"phpcbf --standard=Custom"'
let g:formatters_php = ['phpcbf']
autocmd FileType php let b:autoformat_autoindent=1
autocmd FileType php let b:autoformat_retab=1
autocmd FileType php let b:autoformat_remove_trailing_spaces=1
autocmd FileType php setlocal completeopt-=preview
autocmd FileType php let g:ycm_add_preview_to_completeopt = 0
let g:formatters_perl = ['perltidy']
let g:p_auto_indent_filetype = ['vim', 'typescript', 'jsx']
autocmd BufWrite *
            \ if index(g:p_auto_indent_filetype, &filetype) >= 0 |
            \ :Autoformat |
            \ endif
" }

let g:OmniSharp_server_type = 'roslyn'


" {

func ReloadToDev()
    autocmd BufWrite *
                \ if index(g:p_auto_indent_filetype, &filetype) >= 0 |
                \ :Autoformat |
                \ endif
    :write
    if  ! filereadable("./reload.sh")
        echom 'No reload file'
        return
    endif
    let l:res = vimproc#system("./reload.sh")
    let l:reslist = split(l:res, '\n\|\r\n')
    let l:qflist = []
    for str in l:reslist
        let l:tmpDict = {}
        let l:tmpDict["text"] = str
        call insert(l:qflist, l:tmpDict)
    endfor
    call setqflist(l:qflist)
    copen
    call timer_start(5000, "CloseQF")
endfunc

func CloseQF(...)
    cclose
endfunc

func Gentags()
    call vimproc#system("ctags -R --fields=+aimlS --languages=php", "", 10000)
endfunc

func UpdateComposer()
    if ! executable("mcomposer")
        echom "mcomposer unexecutable!!!"
        return
    endif
    if ! filereadable(expand("./composer.json"))
        echom "composer.json not exist"
        return
    endif
    if isdirectory(expand("./vendor"))
        call vimproc#system("mcomposer", "", 300000)
    else
        call vimproc#system("mcomposer install", "", 300000)
    endif
endfunc
" }

let g:jump_stack = 0

func JumpToDefOnJsx()
    let lastPos = fnameescape(expand('%')).' '.line('.').' '.col('.')
    :FlowJumpToDef
    let currentPos = fnameescape(expand('%')).' '.line('.').' '.col('.')
    if lastPos != currentPos
        let g:jump_stack += 1
    endif
    echo g:jump_stack
endfunc

func JumpBackOnJsx()
    if g:jump_stack > 0
        let g:jump_stack -= 1
        execute "normal \<C-o>"
        echo g:jump_stack
    else
        echo '无回退位置'
    endif
endfunc

