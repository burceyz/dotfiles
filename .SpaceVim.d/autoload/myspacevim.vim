function! myspacevim#before() abort
  let g:ale_linters = {
              \  'php': ['langserver', 'phpstan', 'php -l', 'phpcs'],
              \  'javascript': ["flow"],
              \  'typescript': ["tsserver"],
              \  'go': ["govet", "golangci-lint", "golint"],
  \}
endfunction

function! myspacevim#after() abort
    "let g:deoplete#sources#go#unimported_packages = 1
    "使用语法高亮定义代码折叠
    set foldmethod=syntax
    "打开文件是默认不折叠代码
    set foldlevelstart=99

    let g:ale_go_golangci_lint_package = 1
    let g:go_fmt_fail_silently = 1
    set nofoldenable
    "let g:syntastic_go_checkers = []
    "let g:syntastic_mode_map = { 'mode': 'passive', 'passive_filetypes': ['go'] }
    " Find symbol of current document
    nnoremap <silent> <space>so  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent> <space>sw  :<C-u>CocList -I symbols<cr>
    call coc#config('coc.preferences', {
                \ "autoTrigger": "always",
                \ "maxCompleteItemCount": 10,
                \ "codeLens.enable": 1,
                \ "diagnostic.virtualText": 1,
                \})

endfunction

set autoread                                                                                                                                                                                    
au CursorHold * checktime    
let mapleader = ","
"autocmd FileType php LanguageClientStart
set gcr=a:block-blinkon0
let g:spacevim_terminal_cursor_shape = 0
let g:ale_php_phpcs_standard = 'Custom'
let g:ale_php_phpstan_level = '7'
let g:ale_php_langserver_use_global = 1
"let g:ale_completion_enabled = 1
let g:ale_php_langserver_executable = $HOME . '/.config/composer/vendor/bin/php-language-server.php'
let g:sync_exe_filenames = '.sync;,reload.sh;'

"autocmd FileType javascript let g:ale_completion_enabled = 1

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

autocmd FileType php inoremap <leader>4 $
autocmd FileType php nnoremap gd :ALEGoToDefinition<CR>
autocmd FileType typescript nnoremap gd :ALEGoToDefinition<CR>
nnoremap <leader>ca :q<CR>
nnoremap <f10> :call LanguageClient_contextMenu()<CR>
nnoremap <leader>; <esc>$a;<esc>
nnoremap <C-i> $a;<esc>
nnoremap <space>gl :Gina pull --rebase<CR>
let g:php_namespace_sort_after_insert = 1

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>
let g:gutentags_ctags_extra_args= [
            \ '-R',
            \ '--fields=+aimlS',
            \ '--languages=php',
            \ '--PHP-kinds=cfit',
            \ ]

let g:neoformat_enabled_php = ['phpcbf']
let g:neoformat_php_phpcbf = {
            \ 'exe': 'phpcbf',
            \ 'args': ['--standard=Custom'],
            \ 'stdin': 1,
            \ 'stderr': 1,
            \ 'valid_exit_codes': [0,1],
            \ }

"autocmd FileType php :call deoplete#custom#source('phpcd', 'rank', 9999)

" Remap for format selected region
xmap <leader>ff  <Plug>(coc-format-selected)
nmap <leader>ff  <Plug>(coc-format-selected)

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

let g:auto_save = 1
let g:auto_save_events = ["InsertLeave", "CursorHold"]
let g:auto_save_write_all_buffers = 1
au FileType go let g:auto_save_events = ["InsertLeave", "CursorHold"]

autocmd BufWritePre *.purs :sign unplace *
autocmd BufWritePre *.php :sign unplace *

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
 autocmd BufWritePost * :call SyncUploadFile()

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

let s:coc_extensions = [
			\ 'coc-dictionary',
			\ 'coc-json',
            \ 'coc-css',
            \ 'coc-yaml',
			\ 'coc-tsserver',
			\ 'coc-phpls',
			\ 'coc-snippets',
			\ 'coc-tag',
			\]
