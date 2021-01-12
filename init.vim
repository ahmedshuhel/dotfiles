set nocompatible
set noswapfile
set clipboard+=unnamedplus
set exrc
set secure
filetype off
filetype plugin indent on
syntax on
syntax enable
set guicursor=
set background=dark
set foldmethod=indent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set number
set nowrap
set cursorline
set hlsearch
set incsearch
set mouse=a
set laststatus=2 "airline
set list                                            "Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:•,extends:»,precedes:«  "Unprintable chars mapping

if !exists('g:env')
    if has('win64') || has('win32') || has('win16')
        let g:env = 'WINDOWS'
    else
        let g:env = toupper(substitute(system('uname'), '\n', '', ''))
    endif
endif


let g:coc_node_path = expand("~/.nvm/versions/node/v12.14.1/bin/node")


if g:env =~ 'DARWIN'
  let g:python_host_prog = '/usr/local/bin/python2'
  let g:python3_host_prog = '/usr/local/bin/python3'
endif

if g:env =~ 'LINUX'
  let g:python_host_prog = '/usr/bin/python2'
  let g:python3_host_prog = '/usr/bin/python3'
endif

let python_highlight_all=1

call plug#begin('~/.config/nvim/plugged')

Plug 'szw/vim-maximizer'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'ryanoasis/vim-devicons'
Plug 'skywind3000/asyncrun.vim'
Plug 'moll/vim-node'
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim'
Plug 'digitaltoad/vim-pug'
Plug 'raimondi/delimitmate'
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'derekwyatt/vim-scala'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-unimpaired'
Plug 'kshenoy/vim-signature'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'racer-rust/vim-racer'
Plug 'fatih/vim-go'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'OrangeT/vim-csharp'
Plug 'Shougo/defx.nvim'
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'
Plug 'morhetz/gruvbox'
Plug 'andys8/vim-elm-syntax', { 'for': ['elm'] }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'dhruvasagar/vim-table-mode'
Plug 'vim-test/vim-test'

call plug#end()

colorscheme gruvbox

"Defx {{
let s:defx_ignore_pattern='*.tmp,__pycache__,*.eggs,*.egg-info,*.pyc,*.cache*,*.egg,*.git,*.github,*.idea,*.vscode,*.ropeproject'
let defx_explorer_cmd=':Defx -split=vertical -winwidth=40 -direction=topleft -columns=indent:git:icons:filename:type -ignored-files=' . s:defx_ignore_pattern

autocmd FileType defx call s:defx_my_settings()
autocmd FileType defx set cursorline

" Close defx when closing the last buffer
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'defx') | q | endif

" Enter with defx open
" autocmd VimEnter * exec defx_explorer_cmd

nnoremap - :exec defx_explorer_cmd . ' ' . expand('%:p:h') . ' -search=' . expand('%p:p') <cr>

function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') :
  \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> %
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> D
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> -
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-r>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-p>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction
"}}



"COC {{
let g:coc_global_extensions = [
      \'coc-markdownlint',
      \'coc-highlight',
      \'coc-yaml',
      \'coc-actions',
      \'coc-rls',
      \'coc-omnisharp',
      \'coc-yank',
      \'coc-html',
      \'coc-snippets',
      \'coc-css',
      \'coc-python',
      \'coc-tsserver',
      \'coc-flutter',
      \'coc-json',
      \'coc-git',
      \'coc-spell-checker',
      \'coc-cspell-dicts',
      \'coc-vimlsp',
      \'coc-java'
      \]
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup COC
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"}}

"coc-snippets {{
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
"}}

"coc-git {{
" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
nmap <leader>hs :CocCommand git.chunkStage<CR>
nmap <leader>hu :CocCommand git.chunkUndo<CR>
" show commit contains current position
nmap gc <Plug>(coc-git-commit)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)
"}}

"coc-action {{
" Remap for do codeAction of selected region
function! s:CocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction

xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>CocActionsOpenFromSelected<CR>g@
"}}


"Airline {{
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
"}}

"Emmet {{
let g:user_emmet_leader_key='<c-y>'
"}}

"Temp Files {{
set directory=~/.vim/swapfiles//
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc
"}}

"ALE {{
let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'

let g:ale_fixers = {
\   'javascript': [
\       'eslint',
\       'prettier',
\   ]
\}

let g:ale_javascript_prettier_options = '--single-quote'
let g:ale_rust_rls_executable = 'rls'
let g:ale_linters = { 'elm': ['elm_ls'] }
"}}


"AsyncRun Settings {{
let g:asyncrun_open = 8
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>
"}}

"Syntax Highlighting {{
hi link pythonImport Include
hi link pythonBuiltinFunc PreProc

hi DiffAdd cterm=reverse ctermfg=237 ctermbg=142 gui=reverse guifg=#b8bb26 guibg=#282828
hi DiffChange cterm=reverse ctermfg=237 ctermbg=108 gui=reverse guifg=#8ec07c guibg=#282828
hi DiffDelete cterm=reverse ctermfg=237  ctermbg=167 gui=reverse guifg=#fb4934 guibg=#282828
"}}

"Mappings {{
nnoremap edf :DlEnableDistractionFree<CR>
nnoremap ddf :DlDisableDistractionFree<CR>
nnoremap dlgn :DlGotoDailyNote<CR>
nnoremap dln :DlCreateDailyNote<CR>
nnoremap dlp :DlCreatePost
nnoremap dlt :DlCreateTil
nnoremap dlo :DlCreateOoo
nnoremap dlm :DlCreateMeetingNotes
nnoremap dli :DlCreateInterviewNotes
"}}

"Clap {{
let g:clap_layout = { 'relative': 'editor' }
let g:clap_enable_background_shadow = v:false
nnoremap <C-t> :Clap grep<CR>
nnoremap <C-p> :Clap files<CR>
"}}

"
"Devlife {{
let s:project_root_dir = finddir('.git/..', expand('%:p:h').';')
command! DlEnableDistractionFree call s:EnableDistractionFreeMode()
command! DlDisableDistractionFree  call s:DisableDistractionFreeMode()
command! DlGotoDailyNote call s:GotoDailyNote()
command! DlCreateDailyNote call s:CreateDailyNote()
command! -nargs=1 DlCreatePost call s:CreatePost(<q-args>)
command! -nargs=1 DlCreateTil call s:CreateTil(<q-args>)
command! -nargs=1 DlCreateOoo call s:CreateOoo(<q-args>)
command! -nargs=1 DlCreateMeetingNotes call s:CreateMeetingNotes(<q-args>)
command! -nargs=1 DlCreateInterviewNotes call s:CreateInterviewNotes(<q-args>)

function! s:RelPath(path, current_path) abort

python3 << EOF
import vim
from os.path import relpath

def get_rel_path():
  return relpath(vim.eval('a:path'), vim.eval('a:current_path'))
EOF

return py3eval('get_rel_path()')
endfunction

function! s:Sanitize(fn)
  " Replace `(`, `)` `-` with empty string
  return substitute(a:fn, "-\\|(\\|)", "", "g")
endfunction

function! s:CreateMeetingNotes(fn)
    let l:fp = s:project_root_dir . "/meetings/" . strftime("%Y-%m-%d") . "-" . join(split(s:Sanitize(a:fn)), '-') . ".md"
    call s:InsterAtCursor(s:RelPath(l:fp, expand('%:p:h')))
    call s:NewFile(l:fp)

    let l:cmd = "~/.dl/dlm.sh"
    let l:result = system(cmd)
    call append(0, split(l:result, '\n'))
endfunction

function! s:CreateInterviewNotes(fn)
    let l:fp = s:project_root_dir . "/meetings/interview/" . strftime("%Y-%m-%d") . "-" . join(split(s:Sanitize(a:fn)), '-') . ".md"
    call s:InsterAtCursor(s:RelPath(l:fp, expand('%:p:h')))
    call s:NewFile(l:fp)

    let l:cmd = "~/.dl/dli.sh" . " '" . a:fn . "'"
    let l:result = system(cmd)
    call append(0, split(l:result, '\n'))
endfunction


function! s:InsterAtCursor(text)
    let l:line = getline('.')
    call setline('.', strpart(l:line, 0, col('.') - 1) . a:text . strpart(l:line, col('.') - 1))
endfunction

function! s:CreateOoo(pn)
    let l:date = strftime("%Y-%m-%d")
    let l:folder_path = s:project_root_dir . "/meetings/ooo/" . a:pn . "/"
    let l:file_path = l:folder_path . l:date . ".md"
    let l:last_entry = s:FindLastEntry(localtime(), 'meetings/ooo/' . a:pn . '/', 60)

    " Insert link in the current buffer. e.g. daily note
    call s:InsterAtCursor(s:RelPath(l:file_path, expand('%:p:h')))

    execute "edit " . l:last_entry

    " Add next entry link. Note: `Previous` is at line 2 and we want to add
    " `Next` exactly after line #2
    call append(2, '- [Next](' . s:RelPath(l:file_path,  fnamemodify(l:last_entry, ":p:h")) . ')')

    " Copy from #Action/Decisions into register `*
    execute "normal /## Decision\/Actions\<CR>"
    execute "normal j"
    execute "normal yG"
    let l:backlog = getreg('*')
    " End copy

    call s:NewFile(l:file_path)

    let l:cmd = "~/.dl/dlo.sh " . s:RelPath(l:last_entry, l:folder_path)
    let l:result = system(cmd)
    call append(0, split(l:result, '\n'))

    execute "normal /## Agenda\<CR>"
    execute "normal j"
    execute "normal p"
    " call append(line("."), split(l:backlog, '\n'))
endfunction

function! s:GotoDailyNote()
    let l:date = strftime("%Y-%m-%d")
    let l:month = strftime('%m.%B')
    let l:year = strftime('%Y')
    let l:fp = s:project_root_dir . "/dn/" . l:year . "/" . l:month . "/" . l:date . ".md"
    execute "e ". l:fp
endfunction

function! s:FindLastEntry(today, base_path, max_retry)
    if (a:max_retry <= 0)
      return s:project_root_dir . "/"  . a:base_path . strftime('%Y-%m-%s', localtime()) . '.md'
    endif

    let l:yesterday = a:today - 24 * 3600
    let l:entry = findfile(strftime('%Y-%m-%d', l:yesterday) . '.md', a:base_path . '**')

    if !empty(l:entry)
      return s:project_root_dir . "/"  . l:entry
    else
      return s:FindLastEntry(l:yesterday, a:base_path, a:max_retry - 1)
    endif
endfunction

function! s:CreateDailyNote()
    let l:date = strftime("%Y-%m-%d")
    let l:month = strftime('%m.%B')
    let l:year = strftime('%Y')
    let l:last_entry = s:FindLastEntry(localtime(), 'dn/', 15)

    let l:folder_path = s:project_root_dir . "/dn/" . l:year . "/" . l:month . "/"
    let l:file_path = l:folder_path . l:date . ".md"

    execute "edit " . l:last_entry

    " Add next entry link. Note: `Previous` is at line 2 and we want to add
    " `Next` exactly after line #2
    call append(3, '- [Next](' . s:RelPath(l:file_path,  fnamemodify(l:last_entry, ":p:h")) . ')')


    " Copy from #Todo into register `*
    execute "normal /Todo\<CR>"
    execute "normal j"
    execute "normal yG"
    let l:backlog = getreg('*')
    " End copy

    call s:NewFile(l:file_path)

    let l:cmd = "~/.dl/dln.sh " . s:RelPath(l:last_entry, l:folder_path)
    let l:result = system(cmd)
    call append(0, split(l:result, '\n'))
    execute "normal /Todo\<CR>"
    execute "normal p"
endfunction

function! s:CreatePost(fn)
    let l:fp = s:project_root_dir . "/posts/" . strftime("%Y-%m-%d") . "-" . join(split(a:fn), '-') . ".md"
    call s:InsterAtCursor(s:RelPath(l:fp, expand('%:p:h')))
    call s:NewFile(l:fp)
endfunction

function! s:CreateTil(fn)
    let l:fp = s:project_root_dir . "/til/" . strftime("%Y-%m-%d") . "-" . join(split(a:fn), '-') . ".md"
    call s:NewFile(l:fp)

    let l:cmd = "~/.dl/dlt.sh " . " '". a:fn ."'"
    let l:result = system(l:cmd)
    call append(0, split(l:result, '\n'))
endfunction

function! s:NewFile(fp)
    echom "Creating file '" . a:fp . "'"
    execute "e ". a:fp
    :w
endfunction

" Distraction Free {{
function! s:EnableDistractionFreeMode()
  set signcolumn=no
  :CocDisable
  :ALEDisable
  :silent exec "!tmux set -g status on"
  :silent exec "!tmux resize-pane -Z"
  color seoul256
  :Goyo
  :Limelight
endfunction

function! s:DisableDistractionFreeMode()
  set signcolumn=yes
  :CocEnable
  :ALEEnable
  :Limelight!
  :Goyo!
  color gruvbox
  :silent exec "!tmux set -g status on"
  :silent exec "!tmux resize-pane"
endfunction
"}}


function! MarkdownGF()
    " Get the filename under the cursor
    let cfile=expand('<cfile>')
    " Separate the filename from the section
    let parts=split(cfile, '#')

    " No section marked
    if (len(parts) == 1)
        execute "normal! gf"
    " There is a subsection in the file name
    else
        " Build relative file path from current directory and edit
        execute "e " . expand('%:h') . "/" . parts[0]

        " Normalize: 'todo-list' => 'todo list'
        let l:raw_section = join(split(parts[1], '-'), ' ')

        " Capitalize: `todo list` => `Todo List`
        let l:section = substitute(l:raw_section, '\<.', '\u&', 'g')

        " Build the pattern
        let l:pattern = "^\\#\\+\\s" . l:section . "$"
        call search(l:pattern, 'w')
    endif
endfunction

autocmd! Filetype markdown nnoremap <buffer> gf :call MarkdownGF()<CR>

" Create non-existent directory on buffer create
" https://stackoverflow.com/a/4294176/530767
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction

augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

"}}

"Vim Markdown {{
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_autowrite = 1
autocmd BufRead,BufNewFile *.md set conceallevel=2
autocmd BufRead,BufNewFile *.md set wrap
"}}

"Vim Test {{
" let test#strategy = "asyncrun_background"
" let test#strategy = "vtr"

function! AttachVtrStrategy(cmd)
  if !exists("g:vtr_pane_attached")
    let g:vtr_pane_attached = 1
    :VtrAttachToPane
  endif
  call VtrSendCommand(a:cmd)
endfunction

let g:test#custom_strategies = {'vtr_attach': function('AttachVtrStrategy')}
let g:test#strategy = 'vtr_attach'


" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
"}}

autocmd FileType gitcommit setlocal spell
