" For the python (crash with newest) 
" set pythonthreehome=/usr/local/Cellar/python/3.6.6/Frameworks/Python.framework/Versions/3.6
"set pythonthreehome=/Library/Frameworks/Python.framework/Versions/3.6
"
" from https://stackoverflow.com/questions/6488683/how-do-i-change-the-vim-cursor-in-insert-normal-mode#6489348
"
let &t_SI = "\e[6 q"
let &t_EI = "\e[1 q"

" optional reset cursor on start:
"augroup myCmds
"au!
"autocmd VimEnter * silent !echo -ne "\e[1 q"
"augroup END
"  Ps = 0  -> blinking block.
"    Ps = 1  -> blinking block (default).
"    Ps = 2  -> steady block.
"    Ps = 3  -> blinking underline.
"    Ps = 4  -> steady underline.
"    Ps = 5  -> blinking bar (xterm).
"    Ps = 6  -> steady bar (xterm).

set mouse=a
"map <ScrollWheelUp> <C-Y>
"map <ScrollWheelDown> <C-E>
" from https://jeffkreeftmeijer.com/vim-number/
set number relativenumber

set showmode
set showmatch
set nobackup

" to make vimwiki work ?
set nocompatible
filetype plugin indent on  "this is the culprit*/
syntax on
set smartindent
set smarttab
set autoindent  "will keep indentation level from previous line
set expandtab  "will convert tabs to spaces
set shiftwidth=4  "will affect block indentation with >> and <<
set softtabstop=4  "sets the length of soft tab in spaces
set tabstop=4  "sets the width of tab character

 "status line
"set statusline+=%F " display current file path in status line
"set statusline+=%=%(%p%%%) 
"set laststatus=2 " status bar always visible
"
set laststatus=2  " status bar always visible
set ruler
set wildmenu

" utf-8 coding
set encoding=utf-8
set fileencoding=utf-8

"set linebreak "to avoid wrapping in the middle of words

"Search options
"set ignorecase
set smartcase
set hlsearch
set wrapscan
set incsearch
"Redefines the grep command
set grepprg=grep\ -nH\ $*


"add filetypes on launch
"filetype on
"au BufNewFile,BufRead *.djhtml setfiletype=htmldjango
"au BufNewFile,BufRead *.ejs setfiletype html

""theme
set t_Co=256
let g:hybrid_use_Xresources = 1
colorscheme sourcerer 
"set backspace=indent,eol,start  "change the backspace behavior :help backspace
set backspace=indent
let g:tex_flavor='latex'
" slow latex fix? from =https://stackoverflow.com/questions/8300982/vim-running-slow-with-latex-files#975314
"au FileType tex setlocal nocursorline
"au FileType tex :NoMatchParen 
let g:tex_flavor = "latex"
let g:vimtex_latexmk_callback = 1
let g:vimtex_latexmk_continuous = 1 
" disable automatic fold
let g:vimtex_fold_automatic=0 
let g:vimtex_syntax_enabled=1
"qpdfviewer plugin for forward search 
"let g:vimtex_view_general_viewer = 'qpdfview' 
"let g:vimtex_view_general_options = '--unique @pdf\#src:@tex:@line:@col' 
"let g:vimtex_view_general_options_latexmk = '--unique' 
let g:vimtex_fold_manual=1

" from https://castel.dev/post/lecture-notes-1/#correcting-spelling-mistakes-on-the-fly 
"let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=1
let g:vimtex_quickfix_ignore_all_warnings=0 
let g:vimtex_quickfix_ignored_warnings = [ 'Underfull', 'Overfull', 'specifier changed to',] 
let g:vimtex_quickfix=2 

map <C-S-N> :VimtexTocToggle<CR>

"set conceallevel=1
"let g:tex_conceal='abdmg'
"hi Conceal ctermbg=none

" fix of slow latex?
"
set timeoutlen=1000
set ttimeoutlen=0


"MacVim font
set guifont=Source\ Code\ Pro:h12
" maps the leader key to ,
let mapleader=","
"yank to the end of the line
map Y y$
" formats a paragraph
map Q gqip
map L gq$
" maps the screen moves to normal moves for multi line
"map j gj 
map k gk
" add $ delimiter for commands
onoremap <silent> i$ :<C-U>normal! T$vt$<CR>*/*/
onoremap <silent> a$ :<C-U>normal! F$vf$<CR>
" mappings for tasklist and TagList
"map T :TaskList<CR>
" CTags binary
let $Tlist_Ctags_Cmd='/opt/local/bin/ctags'
" add autocomplete to python files
"let g:pymode_rope = 0
" NERDTree
" prevent conflict with <leader>cs reserved for thesaurus
map <leader>cx <plug>NERDCommenterSexy
"noremap <leader>cx <plug>NERDCommenterSexy
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" auto startup of NERDTree even if no file is specified 
"autocmd StdinReadPre * let s:std_in=1 
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif 
" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
"" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)

" Documentation
"let g:pymode_doc = 1
"let g:pymode_doc_key = 'K'

" python3 syntax for pymode
let g:pymode_python = "python3"
"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
"let g:pymode_lint_write = 1

" Support virtualenv
"let g:pymode_virtualenv = 1

" Enable breakpoints plugin
"let g:pymode_breakpoint = 1
"let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
"let g:pymode_syntax = 1
"let g:pymode_syntax_all = 1
"let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
"let g:pymode_folding = 0

 "Load pylint code plugin
"let g:pymode_lint = 1

" Switch pylint or pyflakes code checker
" values (pylint, pyflakes)
let g:pymode_lint_checker = "pyflakes"


" Pylint configuration file
" If file not found use 'pylintrc' from python-mode plugin directory
""let g:pymode_lint_config = "$HOME/.pylintrc"

" Check code every save
"let g:pymode_lint_write = 1

" Auto open cwindow if errors be finded
""let g:pymode_lint_cwindow = 1

" Auto jump on first error
let g:pymode_lint_jump = 1

" Place error signs
let g:pymode_lint_signs = 1

" Minimal height of pylint error window
"let g:pymode_lint_minheight = 3

" Maximal height of pylint error window
let g:pymode_lint_maxheight = 6
" Autoremove unused whitespaces
let g:pymode_utils_whitespaces = 1
" tab bindings
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
"nnoremap tm  :tabm<Space>
"nnoremap td  :tabclose<CR>
"nnoremap tn :tabnew<CR>
nnoremap t1 1gt
nnoremap t2 2gt
nnoremap t3 3gt
nnoremap t4 4gt
nnoremap t5 5gt
nnoremap t6 6gt
nnoremap t7 7gt
nnoremap t8 8gt
nnoremap t9 9gt
nnoremap t0 10gt
let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'

" mouse scrolling
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" Syntastic
let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_check_header = 1
"""let g:syntastic_<filetype>_checkers = ['<checker-name>']
"let g:syntastic_cpp_checkers = ['gcc']
"let g:syntastic_cpp_compiler_options = "-std=c++14 -Wall -Wextra -Wpedantic -I/usr/local/include/eigen3 -I/usr/local/Cellar/qt5/HEAD/include -I/usr/local/Cellar/qt5/HEAD/lib/QtCore.framework/Versions/5/Headers/"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"""let g:syntastic_always_populate_loc_list = 1
"""let g:syntastic_auto_loc_list = 1
""let g:syntastic_check_on_open = 0
""let g:syntastic_check_on_wq = 0
"let g:syntastic_aggregate_errors = 1
"let g:syntastic_enable_baloons = 1
"let g:syntastic_loc_list_height = 5
let g:syntastic_tex_checkers = ['lacheck']

"YCM config
"let g:ycm_always_populate_location_list = 1
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_global_ycm_extra_conf'
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_complete_in_comments = 1 
"let g:ycm_seed_identifiers_with_syntax = 1 
"let g:ycm_collect_identifiers_from_comments_and_strings = 1 
""let g:ycm_server_python_interpreter = '/usr/local/bin/python3'
" Jedi and YCM conflict
"let g:jedi#completions_enabled = 0
"" debugging ycm
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'

""make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

""better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-tab>"
let g:UltiSnipsListSnippets="<C-tab>"

"thesaurus mapping
"nnoremap <Leader>cs :ThesaurusQueryReplaceCurrentWord<CR>
"
" replace in visual selection
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Tagbar mappings
nmap <C-g> :TagbarToggle<CR>
" Tagbar auto on
"autocmd VimEnter * nested :call tagbar#autoopen(1)
"autocmd BufEnter * nested :call tagbar#autoopen(0)
" tagbar to work with latex files as explained in the tagbar documentation

"let g:tagbar_type_tex = {
"           \ 'ctagstype' : 'latex',
"           \ 'kinds'     : [
"           \ 's:sections',
"           \ 'g:graphics:0:0',
"           \ 'l:labels',
"           \ 'r:refs:1:0',
"           \ 'p:pagerefs:1:0'
"           \ ],
"           \ 'sort'    : 0,
"           \ }

" Let Vim walk up directory hierarchy from CWD to root looking for tags file
set tags=tags;/
" Tell EasyTags to use the tags file found by Vim
let g:easytags_dynamic_files = 1

" Only generate tags when a file is saved
let g:easytags_events = ['BufWritePost']

" Deoplete
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#enable_smart_case = 1
" https://stackoverflow.com/questions/42024254/how-to-autoexpand-neosnippet-with-deoplete-dropdown-menu
"let g:neosnippet#enable_snipmate_compatibility = 1

"imap <C-k>     <Plug>(neosnippet_expand_or_jump) 
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)
"inoremap <silent> <CR>   <C-r>=<SID>my_cr_function()<CR>
"inoremap <silent><expr><CR> pumvisible() ? deoplete#mappings#close_popup()."\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"
"
" recognize latex files as latex and not plain test
" https://stackoverflow.com/questions/26145505/using-vims-tagbar-plugin-for-latex-files#26146471
"augroup latex
   ""autocmd!
   ""autocmd BufRead,BufNewFile *.tex set filetype=latex
"augroup end

let g:tagbar_type_tex = {
           \ 'ctagstype' : 'latex',
           \ 'kinds'     : [
           \ 's:sections',
           \ 'g:graphics:0:0',
           \ 'l:labels',
           \ 'r:refs:1:0',
           \ 'p:pagerefs:1:0'
           \ ],
           \ 'sort'    : 0,
           \ 'deffile' : expand('<sfile>:p:h:h') . '/ctags/latex.cnf'
           \ }
" fold the commented sections of the text*/
" from 
" https://vi.stackexchange.com/questions/3512/how-to-fold-comments
"autocmd FileType tex setlocal foldmethod=expr foldexpr=getline(v:lnum)=~'^\s*
" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
   "function! MyTabLine()
       "let s = ''
       "let wn = ''
       "let t = tabpagenr()
       "let i = 1
       "while i <= tabpagenr('$')
           "let buflist = tabpagebuflist(i)
           "let winnr = tabpagewinnr(i)
           "let s .= '%' . i . 'T'
           "let s .= (i == t ? '%1*' : '%2*')
           "let s .= ' '
           "let wn = tabpagewinnr(i,'$')

           "let s .= '%#TabNum#'
           "let s .= i
           "" let s .= '%*'
           "let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
           "let bufnr = buflist[winnr - 1]
           "let file = bufname(bufnr)
           "let buftype = getbufvar(bufnr, 'buftype')
           "if buftype == 'nofile'
               "if file =~ '\/.'
                   "let file = substitute(file, '.*\/\ze.', '', '')
               "endif
           "else
               "let file = fnamemodify(file, ':p:t')
           "endif
           "if file == ''
               "let file = '[No Name]'
           "endif
           "let s .= ' ' . file . ' '
           "let i = i + 1
       "endwhile
       "let s .= '%T%#TabLineFill#%='
       "let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
       "return s
   "endfunction
   "set stal=2
   "set tabline=%!MyTabLine()
   "set showtabline=1
   "highlight link TabNum Special
endif


" from https://stackoverflow.com/questions/4064651/what-is-the-best-way-to-do-smooth-scrolling-in-vim

function SmoothScroll(up)
   "if a:up
       "let scrollaction=""
   "else
       "let scrollaction=""
   "endif
   "exec "normal " . scrollaction
   "redraw
   "let counter=1
   "while counter<&scroll
       "let counter+=1
       "sleep 10m
       "redraw
       "exec "normal " . scrollaction
   "endwhile
endfunction

"nnoremap <C-U> :call SmoothScroll(1)<Enter>
"nnoremap <C-D> :call SmoothScroll(0)<Enter>
"inoremap <C-U> <Esc>:call SmoothScroll(1)<Enter>i
"inoremap <C-D> <Esc>:call SmoothScroll(0)<Enter>i


" Vimwiki configuration
"
let g:vimwiki_list = [{'path': '~/notes/', 'syntax': 'markdown', 'ext': '.md'}]

"au FileType vimwiki set syntax=markdown
"noremap <C-Space <Plug>VimwikiToggleListItem


" vim markdown configuration
"
let g:vim_markdown_folding_disabled=1  " no folding in markdown
"let g:vim_markdown_new_list_item_indent=1  " new indented lists
let g:vim_markdown_math=1  " math mode for md files

            \
" neomake config
" When writing a buffer (no delay).
"call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
"call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing (no delay).
"call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 500ms; no delay when writing).
"call neomake#configure#automake('nrwi', 500)

function! MyOnBattery()
  if has('macunix')
    return match(system('pmset -g batt'), "Now drawing from 'Battery Power'") != -1
  elseif has('unix')
    return readfile('/sys/class/power_supply/AC/online') == ['0']
  endif
  return 0
endfunction

if MyOnBattery()
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_lint_on_insert_leave = 0
"else
  "call neomake#configure#automake('nw', 1000)
endif

