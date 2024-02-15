"vim: filtype=vimrc

colorscheme sourcerer

filetype plugin indent on  
syntax on

let mapleader = ","
" For the python (crash with newest) 
" set pythonthreehome=/usr/local/Cellar/python/3.6.6/Frameworks/Python.framework/Versions/3.6
"set pythonthreehome=/Library/Frameworks/Python.framework/Versions/3.6
"
" from https://stackoverflow.com/questions/6488683/how-do-i-change-the-vim-cursor-in-insert-normal-mode#6489348
"
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

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

set showmode
set showmatch
set nobackup

" to make vimwiki work ?
set nocompatible
set smartindent
set smarttab
set autoindent  "will keep indentation level from previous line
set expandtab  "will convert tabs to spaces
set shiftwidth=4  "will affect block indentation with >> and <<
set softtabstop=4  "sets the length of soft tab in spaces
set tabstop=8  "sets the width of tab character
set tw=80  "textwrap 80 characters
set spell  "spell check

"make the spaces fold/unfold 
nnoremap <space> za  
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
set backspace=indent,eol,start  "change the backspace behavior :help backspace
"set backspace=indent
let g:tex_flavor='latex'

let g:vimtex_syntax_enabled = 1

let g:vimtex_syntax_conceal_disable = 0  "do not disable the conceal
"
"makes some character pretty print, c.f. :help vimtex_syntax_conceal
let g:vimtex_syntax_conceal = { 
      \ 'accents': 1,
      \ 'ligatures': 1,
      \ 'cites': 1,
      \ 'fancy': 1,
      \ 'spacing': 1,
      \ 'greek': 1,
      \ 'math_bounds': 1,
      \ 'math_delimiters': 1,
      \ 'math_fracs': 1,
      \ 'math_super_sub': 1,
      \ 'math_symbols': 1,
      \ 'sections': 0,
      \ 'styles': 1,
      \}

let g:vimtex_syntax_packages = {
      \ 'amsmath': {'conceal': 1, 'load': 2},
      \ 'babel': {'conceal': 1},
      \ 'hyperref': {'conceal': 1},
      \ 'fontawesome5': {'conceal': 1},
      \}

let g:vimtex_toc_config = {
            \ 'split_width': 30,
            \}
" slow latex fix? from =https://stackoverflow.com/questions/8300982/vim-running-slow-with-latex-files#975314
"au FileType tex setlocal nocursorline
"au FileType tex :NoMatchParen 
" disable automatic fold
"let g:vimtex_fold_automatic=0 
"qpdfviewer plugin for forward search 
" see https://blazeva1.pages.fit/post/2022/synctex/ 
let g:vimtex_view_general_viewer = 'okular' 
" forward search
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:tex_flavor = "latex"

let g:vimtex_fold_manual=1
let g:vimtex_compiler_latexmk = {
            \ 'aux_dir' : '',
            \ 'out_dir' : '',
            \ 'callback' : 1,
            \ 'continuous' : 1,
            \ 'executable' : 'latexmk',
            \ 'hooks' : [],
            \ 'options' : [
                \   '-verbose',
                \   '-file-line-error',
                \   '-synctex=1',
                \   '-interaction=nonstopmode',
                \ ],
                \}
""

" from https://castel.dev/post/lecture-notes-1/#correcting-spelling-mistakes-on-the-fly 
"let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=1
"let g:vimtex_quickfix_ignore_all_warnings=0    deprecated
"let g:vimtex_quickfix=2 

nnoremap <leader>tt :VimtexTocToggle<CR>
nnoremap <leader>vv :VimtexView<CR>


nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap te  :tabedit<Space>
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


"------------------------------------------------------------------------------
" slime configuration 
"------------------------------------------------------------------------------
" always use tmux
let g:slime_target = 'tmux'

" fix paste issues in ipython
let g:slime_python_ipython = 1

" always send text to the top-right pane in the current tmux tab without asking
let g:slime_default_config = {
            \ "socket_name": "default",
            \ "target_pane": "{down-of}" }
"            \ 'socket_name': get(split($TMUX, ','), 0),
"
"            \ 'target_pane': '{down-of}' }
let g:slime_dont_ask_default = 1

"# julia commands
"let g:ipython_cell_run_command = 'include("{filepath}")'
"let g:ipython_cell_cell_command = 'include_string(Main, clipboard())'

"------------------------------------------------------------------------------
" ipython-cell configuration
"------------------------------------------------------------------------------

" Keyboard mappings. <Leader> is \ (backslash) by default

map <Leader>s to start IPython
nnoremap <Leader>s :SlimeSend1 ipython --matplotlib<CR>

" map <Leader>r to run script
nnoremap <Leader>r :IPythonCellRun<CR>

" map <Leader>R to run script and time the execution
nnoremap <Leader>R :IPythonCellRunTime<CR>

" map <Leader>c to execute the current cell
nnoremap <Leader>c :IPythonCellExecuteCell<CR>

" map <Leader>C to execute the current cell and jump to the next cell
nnoremap <Leader>C :IPythonCellExecuteCellJump<CR>

" map <Leader>l to clear IPython screen
nnoremap <Leader>l :IPythonCellClear<CR>

" map <Leader>x to close all Matplotlib figure windows
nnoremap <Leader>x :IPythonCellClose<CR>

" map [c and ]c to jump to the previous and next cell header
nnoremap [c :IPythonCellPrevCell<CR>
nnoremap ]c :IPythonCellNextCell<CR>

" map <Leader>h to send the current line or current selection to IPython
nmap <Leader>h <Plug>SlimeLineSend
xmap <Leader>h <Plug>SlimeRegionSend

" map <Leader>p to run the previous command
nnoremap <Leader>p :IPythonCellPrevCommand<CR>

" map <Leader>Q to restart ipython
nnoremap <Leader>Q :IPythonCellRestart<CR>

" map <Leader>d to start debug mode
nnoremap <Leader>d :SlimeSend1 %debug<CR>

" map <Leader>q to exit debug mode or IPython
nnoremap <Leader>q :SlimeSend1 exit<CR>


" make YCM compatible with UltiSnips (using supertab)
"
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" NERDTree mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" NERDCommenter mappings
" ,cs clashes with thesaurus
"
xmap <leader>cS <plug>NERDCommenterSexy
nmap <leader>cS <plug>NERDCommenterSexy

" the CtrlP Plugin
" https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
" Setup some default ignores
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
            \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg|swp|aux|pdf)$',
            \}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'ra'

" Default mapping for CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bx :CtrlPMixed<cr>
nmap <leader>bm :CtrlPMRU<cr>

" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif

" for clipboard sharing

noremap <LEADER>a :e ~/.vim/clip.txt<CR>:%d<CR>"0P:w<CR>:bd<CR>:echo "copied clipboard to ~/.vim/clip.txt"<CR>

" conceal highlighting off?
" for indices in tex markdown
highlight clear Conceal 

"set some conceal for markdown? See :help conceallevel
set conceallevel=2  

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

" jump back to the position where you left with `I
autocmd InsertLeave * execute 'normal! mI'

" markdown
"
let g:vim_markdown_folding_disabled = 0

let g:vim_markdown_math = 1

" starts vim with the server enabled
" :help vimtex-clientserver
if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif

" to disable math conceal with latex math syntax enabled
"let g:tex_conceal = ""
"let g:vim_markdown_math = 0


" remove automatic bullets points, taken care of by bullets.vim?
let g:vim_markdown_auto_insert_bullets = 0
