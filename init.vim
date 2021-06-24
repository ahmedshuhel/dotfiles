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
set foldmethod=syntax
set nofoldenable
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
set laststatus=2
set list                                            "Display unprintable characters f12 - switches
set listchars=tab:•\ ,trail:•,extends:»,precedes:«  "Unprintable chars mapping

if !exists('g:env')
    if has('win64') || has('win32') || has('win16')
        let g:env = 'WINDOWS'
    else
        let g:env = toupper(substitute(system('uname'), '\n', '', ''))
    endif
endif


let g:coc_node_path = expand("~/.nvm/versions/node/v14.15.4/bin/node")


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

Plug 'rktjmp/lush.nvim'
Plug 'npxbr/gruvbox.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'skywind3000/asyncrun.vim'
Plug 'moll/vim-node'
Plug 'altercation/vim-colors-solarized'
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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
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
Plug 'andys8/vim-elm-syntax', { 'for': ['elm'] }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'dhruvasagar/vim-table-mode'
Plug 'vim-test/vim-test'
Plug 'ahmedshuhel/devlife.vim'
Plug 'puremourning/vimspector'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'navarasu/onedark.nvim'
"Plug '~/Workspace/devlife.vim'

call plug#end()


lua <<EOF
require('nvim-treesitter.configs').setup {
  ignore_install = {},              -- List of parsers to ignore installing
  highlight = {
    enable = true,                  -- false will disable the whole extension
    disable = {},                   -- list of language that will be disabled
  },
}
EOF

set background=dark
"colorscheme gruvbox
colorscheme onedark

lua <<EOF
require('lualine').setup {
  options = {theme = 'onedark'},
  extensions = {
    'quickfix',
    'fzf',
    'fugitive'
  },
}
EOF

"Table mode {{
let g:table_mode_corner='|'
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='
"}}

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
      \'coc-rls',
      \'coc-omnisharp',
      \'coc-yank',
      \'coc-html',
      \'coc-snippets',
      \'coc-css',
      \'coc-pyright',
      \'coc-tsserver',
      \'coc-flutter',
      \'coc-json',
      \'coc-git',
      \'coc-spell-checker',
      \'coc-cspell-dicts',
      \'coc-vimlsp',
      \'coc-java',
      \'coc-go'
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
nmap <silent> gu <Plug>(coc-references)

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

" goyo {{
function! s:goyo_enter()
  color seoul256
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set signcolumn=no
  set noshowmode
  set noshowcmd
  set scrolloff=999
  silent Limelight
  silent CocDisable
  silent ALEDisable
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set signcolumn=yes
  set showmode
  set showcmd
  set scrolloff=5

  silent Limelight!
  silent CocEnable
  silent ALEEnable

  color gruvbox
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

noremap df :Goyo 120x50%<CR>
noremap ddf :Goyo<CR>
" }}

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

hi CocWarningSign ctermfg=Yellow ctermbg=237 guifg=#ff922b
hi CocInfoSign ctermfg=Blue ctermbg=237 guifg=#fab005
"}}


"FZF {{
nnoremap <C-t> :Rg<CR>
nnoremap <C-p> :GFiles<CR>
"}}

"Vim Markdown {{
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_autowrite = 1

au BufRead,BufNewFile *.md setl textwidth=100
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
