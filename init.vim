runtime! archlinux.vim

filetype plugin indent on


" vim-plug
call plug#begin('~/.vim/plugged')

"" Colors
Plug 'KeitaNakamura/neodark.vim'
Plug 'trevordmiller/nova-vim'
Plug 'crusoexia/vim-monokai'
Plug 'arcticicestudio/nord-vim'
let g:nord_comment_brightness = 20
Plug 'https://github.com/rakr/vim-two-firewatch'
Plug 'https://github.com/tyrannicaltoucan/vim-quantum'
Plug 'https://github.com/jdkanani/vim-material-theme'
Plug 'https://github.com/lifepillar/vim-wwdc16-theme'
Plug 'https://github.com/kamwitsta/nordisk'
Plug 'https://github.com/tpozzi/Sidonia'
Plug 'https://github.com/zeis/vim-kolor'
Plug 'https://github.com/joshdick/onedark.vim'
Plug 'https://github.com/ajmwagar/vim-deus'
Plug 'https://github.com/kristijanhusak/vim-hybrid-material'
Plug 'https://github.com/jsit/disco.vim'
Plug 'https://github.com/jlesquembre/base16-neovim'
Plug 'https://github.com/nightsense/vrunchbang'
let g:vrunchbang_dark_LineNr = 'off'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'sheerun/vim-polyglot'
Plug 'roxma/nvim-completion-manager'

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/ryanoasis/vim-devicons'

Plug 'https://github.com/dkarter/bullets.vim'

Plug 'https://github.com/w0rp/ale'

Plug 'https://github.com/tpope/vim-commentary'

Plug 'wellle/targets.vim'

Plug 'https://github.com/machakann/vim-sandwich/'
Plug 'https://github.com/kana/vim-textobj-user'
Plug 'https://github.com/kana/vim-textobj-entire'
Plug 'https://github.com/kana/vim-textobj-indent'
Plug 'https://github.com/kana/vim-textobj-function'
Plug 'https://github.com/Julian/vim-textobj-variable-segment'

"Plug 'https://github.com/chaoren/vim-wordmotion'

Plug 'https://github.com/jiangmiao/auto-pairs'
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutBackInsert = ''
let g:AutoPairsMapCh = 0
let g:AutoPairsMoveCharacter = ''
let g:AutoPairsShortcutJump = '<M-,>'
let g:AutoPairsShortcutFastWrap = ''

Plug 'https://github.com/justinmk/vim-sneak'

Plug 'junegunn/vim-slash'

Plug 'maxbrunsfeld/vim-yankstack'

Plug 'https://github.com/majutsushi/tagbar'

Plug 'https://github.com/scrooloose/nerdtree'

Plug 'https://github.com/szw/vim-maximizer'

Plug 'christoomey/vim-tmux-navigator'

Plug 'https://github.com/gabrielelana/vim-markdown'

Plug 'https://github.com/romainl/vim-qf'
let g:qf_mapping_ack_style = 1
let g:qf_max_height = 15

Plug 'https://github.com/mileszs/ack.vim/'
let g:ackprg = "ag --vimgrep"
let g:ack_apply_qmappings = 0
let g:ack_apply_lmappings = 0

Plug 'wsdjeg/FlyGrep.vim'

Plug 'https://github.com/tommcdo/vim-exchange'


Plug 'https://github.com/junegunn/vim-easy-align'
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

Plug 'junegunn/vim-peekaboo'

Plug 'https://github.com/kana/vim-submode'
let g:submode_timeout = 0
let g:submode_keep_leaving_key = 1

" Completion
Plug 'https://github.com/Shougo/neco-vim'

Plug 'https://github.com/tpope/vim-eunuch'

call plug#end()

syntax enable
set background=dark

if exists('$TMUX')
    set notermguicolors
    colorscheme disco
    let g:airline_theme='quantum'
else
    set termguicolors
    " colorscheme two-firewatch
    " let g:airline_theme='base16'
    colorscheme deus
    let g:airline_theme='deus'
    augroup textcolors
        autocmd!
        autocmd filetype text let b:textfile = 1
    augroup END

    augroup SetFiletypeColors
        autocmd!
        autocmd BufEnter * call SetColors()
    augroup END
endif


function! SetColors()
    if exists('b:textfile')
        colorscheme PaperColor
        AirlineTheme papercolor
    else
        colorscheme deus
        AirlineTheme deus    
    endif
endfun

"-----------------
"" Options

set number
set relativenumber
set title
set cursorline

set iskeyword+=\-

set linebreak

set notimeout

set mouse=a

set ignorecase
set smartcase

set autoread

set encoding=utf8
set fileencoding=utf8

set tabstop=4 shiftwidth=4
set copyindent
set autoindent
set smartindent
set expandtab
set smarttab

" Do not store global and local values in a session
set sessionoptions=options

set backup
set backupdir=/var/tmp
set swapfile
set directory=/var/tmp
set undofile
set undodir=/var/tmp

set hidden
set backspace=indent,eol,start

set startofline
set splitright
set splitbelow

set nohlsearch

" slipper g pÃÂ¥ slutten av ex/subst commands
set gdefault

set inccommand=split

set foldmethod=indent
set nofoldenable

set scrolloff=3
set sidescrolloff=3

set nojoinspaces
set formatoptions+=n
" Tror jeg liker select, altsÃ¥ ikke noselect
" Nei tydeligvis ikke, den gjorde det verre...
" Jo den gjÃ¸r det bedre? AltsÃ¥ du slipper Ã¥ trykke en ekstra gang bare for Ã¥
" velge menyen?
" Nei den fucker opp noe annet jesus
"set completeopt="menu,menuone,noinsert,noselect,preview"
" Den over gjÃ¸r ingenting med NCM, men den under skal i teorien gjÃ¸re det
let g:cm_completeopt="menu,menuone,noinsert,noselect,preview"


set switchbuf=usetab

set tags=./tags;/
set path=**

" split border uten |
":set fillchars+=vert:\ 

" Ikke vis vimintro, completion-meldinger
set shortmess+=cI

" Do not store options in session
set sessionoptions=options,folds


"" AUTOCOMMANDS
" Nødvendig for huske cursor position
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Automatisk normalisering av splits
autocmd VimResized * wincmd =

" Forhindre netrw i ÃÂ¥ ikke lukkes
autocmd FileType netrw setl bufhidden=delete

" Lukk preview window automatisk
autocmd CompleteDone * pclose

" Highlight cursorline kun i aktivt vindu
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END

" Autoreload vimrc
augroup vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC
                \ source $MYVIMRC | AirlineRefresh
augroup END

"----------------
" KEYBINDINGS

" Leader maps
let g:mapleader=" "
nmap <silent> <leader>q :q!<CR>
nmap <silent> <leader>w :wq<CR>
nmap <silent> <leader>s :w<CR>
nmap <silent> <leader>e :e!<CR>
nmap <silent> <leader>d :bd!<CR>
nmap <silent> <leader>v :e $MYVIMRC<CR>
nmap <silent> <leader>c :cd %:h<CR>
nmap <silent> <leader>C :Directories<CR>
nmap <silent> <leader>ot :TagbarToggle<CR>
nmap <silent> <leader>on :NERDTreeToggle<CR>
nmap <silent> <leader>n :enew<CR>

nmap <silent> <leader>t :Tags<CR>
nmap <silent> <leader>b :Buffers<CR>
nmap <silent> <leader>r :History<CR>
nmap <silent> <leader>: :Commands<CR>
nmap <silent> <leader>h :Helptags<CR>
nmap <silent> <leader>f :Files<CR>
nmap <silent> <leader>F :Files ~<CR>
nmap <silent> <leader>l :Lines<CR>
nmap <silent> <leader>k :Ack! "\b<C-R><C-W>\b"<CR>
nmap <silent> <leader>a :Ack!<Space>
nmap <silent> <leader>m :Marks<CR>


" Alt-chaining
 set winaltkeys=no
imap <M-h> <Esc>h
imap <M-H> <Esc>H
imap <M-j> <Esc>j
imap <M-J> <Esc>J
imap <M-k> <Esc>k
imap <M-K> <Esc>K
imap <M-l> <Esc>l
imap <M-L> <Esc>L
imap <M-w> <Esc>w
imap <M-W> <Esc>W
imap <M-e> <Esc>e
imap <M-E> <Esc>E
imap <M-b> <Esc>b
imap <M-B> <Esc>B
imap <M-u> <Esc>u
imap <M-U> <Esc>U
imap <M-o> <Esc>o
imap <M-O> <Esc>O
imap <M-n> <Esc>n
imap <M-N> <Esc>N
imap <M-ø> <Esc>:
imap <M-:> <Esc>:
imap <M-s> <Esc>s
imap <M-S> <Esc>S
imap <M-f> <Esc>f
imap <M-F> <Esc>F
imap <M-r> <C-O>r
imap <M-R> <C-O>R
imap <M-i> <Home>
imap <M-a> <End>
imap <M-p> <C-O>p
imap <M-P> <C-O>P
imap <M-q> <Esc>

nmap <M-h> h
nmap <M-H> H
nmap <M-j> j
nmap <M-J> J
nmap <M-k> k
nmap <M-K> K
nmap <M-l> l
nmap <M-L> L
nmap <M-w> w
nmap <M-W> W
nmap <M-e> e
nmap <M-E> E
nmap <M-b> b
nmap <M-B> B
nmap <M-u> u
nmap <M-U> U
nmap <M-n> n
nmap <M-N> N
nmap <M-q> <Esc>

vmap <M-h> <Esc>h
vmap <M-j> <Esc>j
vmap <M-k> <Esc>k
vmap <M-l> <Esc>l
vmap <M-w> <Esc>w
vmap <M-e> <Esc>e
vmap <M-b> <Esc>b
vmap <M-u> <Esc>u
vmap <M-U> <Esc>U
vmap <M-o> <Esc>o
vmap <M-O> <Esc>O
vmap <M-n> <Esc>n
vmap <M-N> <Esc>N
vmap <M-q> <Esc>

cmap <M-h> <Esc>h
cmap <M-j> <Esc>j
cmap <M-k> <Esc>k
cmap <M-l> <Esc>l
cmap <M-q> <C-C>

omap <M-h> <Esc>h
omap <M-j> <Esc>j
omap <M-k> <Esc>k
omap <M-l> <Esc>l
omap <M-q> <Esc>

" Insert mode editing
inoremap <C-D> <Del>
inoremap <C-F> <Right>
inoremap <C-B> <Left>
inoremap <C-Q> <Esc>cc
inoremap <M-d> <C-\><C-O>de
inoremap <C-H> <C-D>
inoremap <C-L> <C-T>
inoremap <C-C> <Esc>

" Command editing
noremap! <M-BS> <C-W>
cnoremap <M-f> <C-Right>
cnoremap <M-b> <C-Left>
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <M-d> <C-Right><C-W>

" Small keys
noremap + .
noremap \ @:
noremap . <Nop>
nnoremap <CR> <Nop>
noremap <Backspace> <Nop>
noremap - <Nop>
" toggle case
noremap ¤ ~

" Navigate changelist
noremap , g;
noremap ; g,

" Windows and buffers
" nnoremap <C-Q> <C-W><C-Q>
nnoremap <silent> <C-Q> :q!<CR>
nnoremap <C-X> :bd!<CR>
map <silent> <C-n> :bn<CR>
map <silent> <C-p> :bp<CR>
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
nnoremap <C-C> zz
nnoremap <M-g> zz
noremap <C-E> zt
noremap <C-Y> zb

" Sudo write trick
cmap w!! w !sudo tee > /dev/null %

" Alternating
nnoremap <C-S> <C-W>p
noremap <Bar> ``
noremap <BS> ``
noremap <M-Bar> `.
noremap <C-A> <C-^>

" Quickfix
set grepprg=ag\ --vimgrep
nnoremap <silent> <left>  :cpf<cr>zvzz
nnoremap <silent> <right> :cnf<cr>zvzz
nnoremap <silent> <up>    :cprev<cr>zvzz
nnoremap <silent> <down>  :cnext<cr>zvzz
nmap <silent> <leader>g <Plug>(qf_qf_toggle)
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
autocmd BufReadPost quickfix nnoremap <silent> <buffer> J :call qf#filegroup#NextFile()<CR>
autocmd BufReadPost quickfix nnoremap <silent> <buffer> K :call qf#filegroup#PreviousFile()<CR>
" nnoremap . :ALENextWrap<CR>
" nnoremap : :ALEPreviousWrap<CR>

"-----------------
" Motion
noremap <silent> j gj
noremap <silent> k gk
noremap L $
noremap H ^
nnoremap <silent> J :<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>
nnoremap <silent> K :<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>
xnoremap J :<C-u>keepjumps normal! gv}<CR>
xnoremap K :<C-u>keepjumps normal! gv{<CR>
onoremap J }
onoremap K {
nnoremap <M-j> 4gj4<C-e>
nnoremap <M-k> 4gk4<C-y>

" søk
nmap s /
nmap S ?
vmap s /
vmap S ?

nmap s /
nmap S ?
vmap s /
vmap S ?

" substsitute
nnoremap gs :%s/
" replace word
nnoremap gr :%s/\<<c-r><c-w>\>/
" substitute within visual selection
vnoremap gs :s/
" replace visual selection
vnoremap gr y:%s/\<<c-r>"\>/

" go high, low, mid
noremap gh H
noremap gl L
noremap gm M

" page up down
nnoremap <C-F> <C-F>zz
nnoremap <C-B> <C-B>zz

" Sneak
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
let g:sneak#s_next = 1
let g:sneak#use_ic_scs = 1
hi Sneak ctermfg=6 ctermbg=8

" go to tag
" map t <C-]>

" redo
nnoremap U <C-R>

" command mode
noremap ø :

" macro
nnoremap Q @q

" join line
nnoremap <M-J> gJ
" split line
" nnoremap <M-K> a<CR><Esc><BS>
function! BreakHere()
    s/^\(\s*\)\(.\{-}\)\(\s*\)\(\%#\)\(\s*\)\(.*\)/\1\2\r\1\4\6
    call histdel("/", -1)
endfunction
nnoremap <M-K> :<C-u>call BreakHere()<CR>

" visual indent
vmap > >gv
vmap < <gv
vmap <Tab> >gv
vmap <S-Tab> <gv

let g:yankstack_map_keys = 0
let g:yankstack_yank_keys = ['y', 'Y', 'd', 'D']
call yankstack#setup()
nmap <M-p> <Plug>yankstack_substitute_older_paste
nmap <M-P> <Plug>yankstack_substitute_newer_paste
" yank to end of line
map Y y$
" yank to clipboard
map <leader>y "+y
" paste from clipboard
map <leader>p <esc>"+p
" paste from yank register
" nnoremap <M-p> "0p
" nnoremap <M-P> "0P
" duplicate line below
nnoremap <M-d> yyp
" duplicate line above
nnoremap <M-D> yyP
" duplicate selected lines
vnoremap P <esc>y'<g'>p

" insert blank lines
function! s:blankup(count) abort
    put!=repeat(nr2char(10), a:count)
    ']
endfunction

function! s:blankdown(count) abort
    put =repeat(nr2char(10), a:count)
    '[
endfunction

nnoremap <silent> go   :<c-u>call <sid>blankdown(v:count1)<cr>
nnoremap <silent> gO   :<c-u>call <sid>blankup(v:count1)<cr>

" insert space
nnoremap g<Space> i<Space><Esc>

" move lines
call submode#enter_with('move', 'n', 's', 'gj', ':m .+1<CR>==')
call submode#enter_with('move', 'n', 's', 'gk', ':m .-2<CR>==')
call submode#map('move', 'n', 's', 'j', ':m .+1<CR>==')
call submode#map('move', 'n', 's', 'k', ':m .-2<CR>==')
call submode#leave_with('move', 'n', '', 'g')

call submode#enter_with('move-visual', 'x', 's', 'gj', ":m '>+1<CR>gv=gv")
call submode#enter_with('move-visual', 'x', 's', 'gk', ":m '<-2<CR>gv=gv")
call submode#map('move-visual', 'x', 's', 'j', ":m '>+1<CR>gv=gv")
call submode#map('move-visual', 'x', 's', 'k', ":m '<-2<CR>gv=gv")
call submode#leave_with('move', 'x', '', 'g')

" insert from command
map ! :r !

" increment/decrement
nnoremap <M-+> <C-A>
nnoremap <M-?> <C-X>

" toggle comment
nmap <M-2> gcc
xmap <M-2> gc

" toggle fold
"nnoremap <space> za

" WORD OBJECTS
" targets.vim
let g:targets_quotes = '"d ''q `'
let g:targets_pairs = '()b {}B []r <>'

" vim-sandwich
let g:sandwich_no_default_key_mappings = 1
let g:operator_sandwich_no_default_key_mappings = 1
let g:textobj_sandwich_no_default_key_mappings = 1

call operator#sandwich#set('delete', 'all', 'highlight', 0)
highlight link OperatorSandwichChange IncSearch

" onoremap <SID>line :normal! ^vg_<CR>
" onoremap <SID>gul g_
nmap <silent> <M-s> <Plug>(operator-sandwich-add)
nmap <silent> <M-s><M-s> <Plug>(operator-sandwich-add)<Plug>(textobj-sandwich-auto-a)
" nmap <silent> <M-s><M-s><Plug>(operator-sandwich-add)<SID>line
" nmap <M-S> <M-s><SID>gul
nmap ds <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap dss <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
nmap cs <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap css <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
xmap <M-s> <Plug>(operator-sandwich-add)

omap ij <Plug>(textobj-sandwich-auto-i)
xmap ij <Plug>(textobj-sandwich-auto-i)
omap aj <Plug>(textobj-sandwich-auto-a)
xmap aj <Plug>(textobj-sandwich-auto-a)

let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:sandwich#recipes += [
    \ {'buns': ['<', '>'], 'expand_range': 0, 'match_syntax': 1, 'input': ['a']},
    \ {'buns': ['"', '"'], 'quoteescape': 1, 'expand_range': 0, 'linewise': 0, 'nesting': 0, 'input': ['d']},
    \ {'buns': ['''', ''''], 'quoteescape': 1, 'expand_range': 0, 'linewise': 0, 'nesting': 0, 'input': ['q']},
    \ {'buns': ['{', '}'], 'skip_break': 1, 'match_syntax': 1, 'nesting': 1, 'input': ['B']},
    \ {'buns': ['[', ']'], 'match_syntax': 1, 'nesting': 1, 'input': ['r']},
    \ {'buns': ['(', ')'], 'match_syntax': 1, 'nesting': 1, 'input': ['b']},
    \]

"-----------------
" FUNCTIONS

let g:highlight_trailing = 0
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
highlight clear ExtraWhitespace
function! Highlight_trailing_whitespace()
    if g:highlight_trailing == 0
        let g:highlight_trailing= 1
        highlight ExtraWhitespace ctermbg=red guibg=red
        echom "Highlight trailing enabled"
    else
        let g:highlight_trailing = 0
        highlight clear ExtraWhitespace
        echom "Highlight trailing disabled"
    endif
endfunction
map <silent> <F2> :call Highlight_trailing_whitespace()<CR>

function! Scratch()
    if bufnr('scratch') == -1
        e scratch
        setlocal filetype=text
        setlocal nobuflisted
        setlocal bufhidden=hide
        setlocal buftype=nofile
        setlocal noswapfile
    elseif bufnr('%') == bufnr('scratch')
        b #
    else
        execute "b " . bufnr('scratch')
    endif
endfunction
map <silent> <M-1> :call Scratch()<CR>

"-----------------
" PLUGINS


" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#exclude_preview = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#whitespace#enabled = 0
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep=''
let g:airline_left_alt_sep='|'
let g:airline_right_sep=''
let g:airline_right_alt_sep='|'
let g:airline_symbols.maxlinenr = ''
set noshowmode
let g:airline#extensions#ale#enabled = 1


" fzf
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_history_dir = '~/.local/share/fzf-history'
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
let g:fzf_nvim_statusline = 0
imap <c-x><c-f> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
nmap <leader>? <plug>(fzf-maps-n)
xmap <leader>? <plug>(fzf-maps-x)
omap <leader>? <plug>(fzf-maps-o)
imap <C-x>? <plug>(fzf-maps-i)
let g:fzf_buffers_jump = 1

command! -nargs=* -complete=dir Directories call fzf#run(fzf#wrap(
  \ {'source': 'fd . -H -t d ~',
  \  'sink': 'cd'}))

" Disable statusline
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Statement'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'Normal'],
  \ 'hl+':     ['fg', 'SpecialComment'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--color-path "0;34" --color-line-number "0;32"', fzf#vim#with_preview(), <bang>0)

" Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25

" NERDTree
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowFiles = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeAutoDeleteBuffer = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" nvim completion manager
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    elseif pumvisible()
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction
inoremap <silent> <Tab> <C-R>=Tab_Or_Complete()<CR>

" Needed to enable omnicompletion Ctrl-X Ctrl-O
set omnifunc=syntaxcomplete#Complete

" Maximizer
nnoremap <silent><leader><leader> :MaximizerToggle<CR>

" Vim markdown
let g:markdown_enable_spell_checking = 0

" Bullets
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]

