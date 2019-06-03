runtime! archlinux.vim

filetype plugin indent on


"=====PLUGINS=====
call plug#begin('~/.vim/plugged')


Plug 'https://github.com/vim-scripts/ScrollColors'
"=====COLORSCHEMES=====
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
Plug 'https://github.com/nightsense/snow'
Plug 'https://github.com/nightsense/seabird'
Plug 'https://github.com/nightsense/stellarized'
Plug 'https://github.com/nightsense/rusticated'
Plug 'https://github.com/sts10/vim-pink-moon'
Plug 'https://github.com/andreypopp/vim-colors-plain'
Plug 'https://github.com/yuttie/inkstained-vim'
Plug 'https://github.com/logico-dev/typewriter'
Plug 'https://github.com/NLKNguyen/papercolor-theme'
Plug 'https://github.com/Nequo/vim-allomancer'
Plug 'https://github.com/morhetz/gruvbox'
" Installert manuelt
" Plug 'https://github.com/sonph/onehalf'
Plug 'https://github.com/tomasr/molokai'
Plug 'https://github.com/kamwitsta/flatwhite-vim'

" Er denne nødvendig når fzf er installert?
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" Plug 'junegunn/vim-peekaboo'

Plug 'https://github.com/dkarter/bullets.vim'
Plug 'https://github.com/gabrielelana/vim-markdown'

Plug 'sheerun/vim-polyglot'
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" Plug 'https://github.com/davidhalter/jedi-vim'

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
" Todo: Completion sources
" Denne var bare buggy
" Plug 'https://github.com/ncm2/ncm2-jedi'
Plug 'https://github.com/Shougo/neco-vim'


Plug 'https://github.com/w0rp/ale'

Plug 'pacha/vem-tabline'
let g:vem_tabline_show = 2
let g:vem_tabline_multiwindow_mode = 0


Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/majutsushi/tagbar'

Plug 'https://github.com/tpope/vim-commentary'

Plug 'wellle/targets.vim'

Plug 'https://github.com/machakann/vim-sandwich/'
Plug 'https://github.com/kana/vim-textobj-user'
Plug 'https://github.com/kana/vim-textobj-entire'
Plug 'https://github.com/kana/vim-textobj-indent'
Plug 'https://github.com/kana/vim-textobj-function'
Plug 'https://github.com/Julian/vim-textobj-variable-segment'

" Plug 'https://github.com/jiangmiao/auto-pairs'
" let g:AutoPairsShortcutToggle = ''
" let g:AutoPairsShortcutBackInsert = ''
" let g:AutoPairsMapCh = 0
" let g:AutoPairsMoveCharacter = ''
" let g:AutoPairsShortcutJump = '<M-,>'
" let g:AutoPairsShortcutFastWrap = ''

" Bedre?
Plug 'https://github.com/Raimondi/delimitMate'

Plug 'christoomey/vim-tmux-navigator'
Plug 'https://github.com/szw/vim-maximizer'


Plug 'https://github.com/romainl/vim-qf'
let g:qf_mapping_ack_style = 1
let g:qf_max_height = 15

" Plug 'https://github.com/mileszs/ack.vim/'
" let g:ackprg = "ag --vimgrep"
" let g:ack_apply_qmappings = 0
" let g:ack_apply_lmappings = 0

Plug 'junegunn/vim-slash'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'justinmk/vim-sneak'
Plug 'https://github.com/tommcdo/vim-exchange'
"Bruk gJ og gS
Plug 'https://github.com/AndrewRadev/splitjoin.vim'
Plug 'junegunn/vim-easy-align'
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" Plug 'https://github.com/kana/vim-submode'
" let g:submode_timeout = 0
" let g:submode_keep_leaving_key = 1

"UNIX helpers
Plug 'https://github.com/tpope/vim-eunuch'

" Plug 'https://github.com/SirVer/ultisnips'
" Plug 'https://github.com/honza/vim-snippets'

Plug 'https://github.com/metakirby5/codi.vim'
nnoremap <leader>oc :Codi!!<CR>


Plug 'https://github.com/jeetsukumaran/vim-filebeagle'
let g:filebeagle_suppress_keymaps = 1
nnoremap - :FileBeagleBufferDir<CR>

Plug 'https://github.com/FooSoft/vim-argwrap'
nnoremap gw :ArgWrap<CR>

Plug 'https://github.com/romainl/vim-devdocs'
nnoremap <leader>K :DD<CR>

Plug 'https://github.com/thaerkh/vim-indentguides'

call plug#end()

"=====STATUSLINE=====
set statusline=
set statusline+=%#title#\ %f%*
                             " set statusline+=%#function#\ %l
" set statusline+=%2*[%n%M%R%W%q]%*\ 
                             " set statusline+=%#question#%{getcwd()}\
set statusline+=\ %m
set statusline+=%=
                             " set statusline+=\ %{strftime('%R',getftime(expand('%')))}
set statusline+=%=%y%*%*     " file type
                             " set statusline+=\ %{(&fenc!=''?&fenc:&enc)}
set statusline+=%10(%l:%c%)  " line and column
                             " set statusline+=\ %L\       " total lines
set statusline+=\ ‹\ %P
set statusline+=\ %*



syntax enable
set background=dark

" let g:theme='onehalfdark'
" colorscheme onehalfdark
" colorscheme material-theme
colorscheme deus

" if exists('+termguicolors')
if has('termguicolors')
    set termguicolors
    if exists('$TMUX')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
endif

" augroup TextFile
"     autocmd!
"     autocmd filetype text let b:textfile = 1
" augroup END

" augroup SetFiletypeColors
"     autocmd!
"     autocmd BufEnter * call SetColors()
" augroup END

" function! SetColors()
"     if exists('b:textfile')
"         colorscheme PaperColor
"     else
"         execute "colorscheme " . g:theme
"     endif
" endfun

"-----------------
"" Options

set number
set relativenumber
set title
set cursorline
set list listchars=trail:·

" set iskeyword+=\-

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

set backup
set backupdir=/var/tmp/nvim
set swapfile
set directory=/var/tmp/nvim
set undofile
set undodir=/var/tmp/nvim
" Husk: denne mappen må være writable, selv om den kan høre til root

set hidden
set backspace=indent,eol,start

set startofline
set splitright
set splitbelow

set nohlsearch

" slipper g etter ex/subst commands
set gdefault

set inccommand=split


" set scrolloff=3
set scrolloff=5
set sidescrolloff=3

set nojoinspaces
" set formatoptions+=n
" set formatoptions-=o
" Kan være dette ikke er beste autocommand event å bruke, men funker.
" Formatoptions er ellers ikke persistent
autocmd! BufEnter * set formatoptions=jncrql

" Tror jeg liker select, altså ikke noselect
" Nei tydeligvis ikke, den gjorde det verre...
" Jo den gjør det bedre? Altså du slipper å trykke en ekstra gang bare for å
" velge menyen?
" Nei den fucker opp noe annet jesus
"set completeopt="menu,menuone,noinsert,noselect,preview"
" Den over gjør ingenting med NCM, men den under skal i teorien gjøre det

" Denne funket med ncm2, men preview var flickery og irriterende
" let g:cm_completeopt="menu,menuone,noinsert,noselect,preview"
let g:cm_completeopt="menu,menuone,noinsert,noselect"


set switchbuf=usetab

set tags=./tags;/
set path=**

" split border uten |
" :set fillchars+=vert:\ 

" Ikke vis vimintro, completion-meldinger
set shortmess+=cI
set noshowmode

" Do not store options in session
set sessionoptions-=options,folds


"" AUTOCOMMANDS
" Nødvendig for huske cursor position
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Automatisk normalisering av splits
autocmd VimResized * wincmd =

" Forhindre netrw i å ikke lukkes
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
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END


"------------
" KEYBINDINGS
"------------

" Escape
inoremap <M-q> <Esc>
inoremap <M-l> <Esc>l
nnoremap <M-q> <Esc>
xnoremap <M-q> <Esc>
snoremap <M-q> <Esc>
cnoremap <M-q> <C-C>
onoremap <M-q> <Esc>

" Leader maps
let g:mapleader=" "
nmap <silent> <leader>q :qa!<CR>
nmap <silent> <leader>Q :qa!<CR>
nmap <silent> <leader>w :x!<CR>
inoremap <C-s> <Esc>:update<CR>
nmap <silent> <leader>s :up<CR>
nmap <silent> <leader>e :e!<CR>
nmap <silent> <leader>d :bd!<CR>
nmap <silent> <leader>v :e $MYVIMRC<CR>
nmap <silent> <leader>C :Directories<CR>
nmap <silent> <leader>ot :TagbarToggle<CR>
nmap <silent> <leader>on :NERDTreeToggle<CR>
nmap <silent> <leader>n :enew<CR>
nmap <silent> <leader>t :Tags<CR>
nmap <silent> <leader>b :Buffers<CR>
nmap <silent> <leader>r :History<CR>
nmap <silent> <C-R> :History:<CR>
nmap <silent> <leader>: :Commands<CR>
nmap <silent> <leader>h :Helptags<CR>
nmap <silent> <leader>f :Files<CR>
nmap <silent> <leader>F :Files ~<CR>
nmap <silent> <leader>l :Lines<CR>
nmap <silent> <leader>k :Grep "\b<cword>\b"<CR>
nmap <leader>a :Ag<Space>
nmap <leader>o :Locate<Space>
nmap <silent> <leader>m :Marks<CR>
nmap <silent> <leader>c :Colors<CR>


set winaltkeys=no

nmap <M-u> u
nmap <M-U> U
nnoremap <M-i> S
vnoremap <M-i> c
nmap <M-Q> <Nop>
" nmap <M-f> <C-Right>
" nmap <M-b> <C-Left>
nnoremap <M-f> <C-F>zz
nnoremap <M-b> <C-B>zz

inoremap <M-f> <C-Right>
inoremap <M-b> <C-Left>
" inoremap <M-f> <Esc><Right><C-Right>
" inoremap <M-b> <Esc><C-Left>
imap <M-u> <Esc>u
imap <M-U> <Esc>U
imap <M-o> <Esc>o
imap <M-O> <Esc>O
imap <M-r> <C-O>r
imap <M-R> <C-O>R
imap <M-e> <Esc>A
" imap <M-p> <C-O>p
" imap <M-P> <C-O>P

vmap <M-u> <Esc>u
vmap <M-U> <Esc>U
vmap <M-o> <Esc>o
vmap <M-O> <Esc>O

" Insert mode editing
inoremap <C-D> <Del>
inoremap <C-F> <Right>
inoremap <C-B> <Left>
inoremap <C-Q> <Esc>S
inoremap <M-i> <Esc>I
inoremap <M-d> <C-\><C-O>de
" inoremap <C-H> <C-D>
" inoremap <C-L> <C-T>
inoremap <C-C> <Esc>
inoremap <C-L> <C-X><C-L>

" Command mode editing
noremap! <M-BS> <C-W>
cnoremap <M-f> <C-Right>
cnoremap <M-b> <C-Left>
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <M-d> <C-Right><C-W>
cnoremap <M-n> <C-n>
cnoremap <M-p> <C-p>

" Small keys
" noremap + .
" noremap . <Nop>
noremap + <Nop>
noremap - <Nop>
nnoremap <CR> <Nop>
noremap <M-BS> <Nop>
noremap \ @:
noremap ¤ ~
nnoremap ? K

nnoremap q <Nop>

" Navigate changelist
noremap , g;zz
noremap ; g,zz

" Alternating
nnoremap <silent> <C-S> <C-W>p
noremap <C-A> <C-^>
nnoremap <M-Bar> `.
noremap <Bar> ``
nnoremap <BS> `.
" nnoremap gb `.



" Windows and buffers
" nnoremap <C-Q> <C-W><C-Q>
nnoremap <silent> <C-Q> :q!<CR>
nnoremap <C-X> :bd!<CR>
nnoremap <silent> <C-X> :bp<Bar>bd! #<Cr>
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
nnoremap <M-g> zz
noremap <C-E> zt
noremap <C-Y> zb

" Sudo write trick
cmap w!! w !sudo tee > /dev/null %

" Quickfix
set grepprg=ag\ --vimgrep
command! -nargs=? -complete=file_in_path Grep silent grep! <args>
nnoremap <silent> <left>  :cpf<cr>zvzz
nnoremap <silent> <right> :cnf<cr>zvzz
nnoremap <silent> <up>    :cprev<cr>zvzz
nnoremap <silent> <down>  :cnext<cr>zvzz
" nmap <silent> <leader>g <Plug>(qf_qf_toggle)
nmap <silent> co <Plug>(qf_qf_toggle)
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
autocmd BufReadPost quickfix nnoremap <silent> <buffer> J :call qf#filegroup#NextFile()<CR>
autocmd BufReadPost quickfix nnoremap <silent> <buffer> K :call qf#filegroup#PreviousFile()<CR>
nnoremap <silent> æ :ALENextWrap<CR>
nnoremap <silent> Æ :ALEPreviousWrap<CR>
nnoremap <silent> gæ :ALEDetail<CR>

"-----------------
" Motion
noremap <silent> j gj
noremap <silent> k gk
noremap L $
noremap ø $
noremap H ^
noremap å ^
nnoremap <silent> J :<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>
nnoremap <silent> K :<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>
xnoremap J :<C-u>keepjumps normal! gv}<CR>
xnoremap K :<C-u>keepjumps normal! gv{<CR>
onoremap J }
onoremap K {
" nnoremap <M-j> 4gj4<C-e>
" nnoremap <M-k> 4gk4<C-y>
nnoremap <M-j> 4gjzz
nnoremap <M-k> 4gkzz
" nnoremap <C-M-J> ][
" nnoremap <C-M-K> []
nnoremap <C-F> <C-F>zz
nnoremap <C-B> <C-B>zz
nnoremap gg ggzz
nnoremap G Gzz


" søk
nnoremap s /
nnoremap S ?
vnoremap s /
vnoremap S ?

" substsitute
" nnoremap gs :%s/
nnoremap gs :%s:
" replace word
nnoremap gr :%s/\<<c-r><c-w>\>/
" substitute within visual selection
vnoremap gs :s/
" replace visual selection
vnoremap gr y:%s/\<<c-r>"\>/
" remove empty lines
vnoremap R :g/^$/d<CR>
" make one empty line between each paragraph
vnoremap Q :s/\n\{3,\}/\r\r<CR>

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
" hi Sneak ctermfg=6 ctermbg=8
highlight link Sneak IncSearch

" go to tag
nnoremap <M-t> <C-]>zz

" redo
nnoremap U <C-R>

" command mode
" noremap ø :

" play macro
nnoremap Q @q

" no Ex-mode
nnoremap gQ <Nop>

" join line
" gJ preserver whitespace, men var ikke bra oppførsel når du preserver
" indentering
nnoremap <M-J> J
" split line
" nnoremap <M-K> a<CR><Esc><BS>
function! BreakHere()
    s/^\(\s*\)\(.\{-}\)\(\s*\)\(\%#\)\(\s*\)\(.*\)/\1\2\r\1\4\6
    call histdel("/", -1)
endfunction
nnoremap <silent> <M-K> :<C-u>call BreakHere()<CR>

" visual indent
xnoremap > >gv
xnoremap < <gv
xnoremap <Tab> >gv
xnoremap <S-Tab> <gv
xnoremap <M-h> <gv
xnoremap <M-l> >gv

nnoremap <M-h> <<
nnoremap <M-l> >>


let g:yankstack_map_keys = 0
let g:yankstack_yank_keys = ['y', 'Y', 'd', 'D']
call yankstack#setup()
nmap <M-p> <Plug>yankstack_substitute_older_paste
nmap <M-n> <Plug>yankstack_substitute_newer_paste
" yank to end of line
map Y y$
" yank to clipboard
map <leader>y "+y
vnoremap <C-C> "+y
nnoremap <C-C> "+yyzz
" paste from clipboard
map <leader>p <esc>"+p
nnoremap cp <esc>"+p
nnoremap cP <esc>"+P
" paste from yank register
nnoremap yp "0p
nnoremap yP "0P

" duplicate lines
nnoremap <M-d> :t.<CR>
nnoremap <M-D> :t-1<CR>
" vnoremap P <esc>y'<g'>p
" vnoremap <M-d> <esc>y'<g'>p
vnoremap P :t-1<CR>
vnoremap <M-d> :t-1<CR>

"d/c/y to start of line
nnoremap dh d^
nnoremap ch c^
nnoremap yh y^

" insert blank lines
function! s:blankup(count) abort
    put!=repeat(nr2char(10), a:count)
    ']
endfunction

function! s:blankdown(count) abort
    put =repeat(nr2char(10), a:count)
    '[
endfunction

nnoremap <silent> <M-o> :<c-u>call <sid>blankdown(v:count1)<cr>
nnoremap <silent> <M-O> :<c-u>call <sid>blankup(v:count1)<cr>

" insert space
nnoremap g<Space> a<Space><Esc>

" " move lines
nnoremap <C-M-j> mz:m+<CR>`z
nnoremap <C-M-k> mz:m-2<CR>`z
" Må modifiseres for å også autoindentere
vnoremap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z


" increment/decrement
nnoremap <M-+> <C-A>
nnoremap <M-?> <C-X>

" toggle comment
nmap <M-2> gcc
xmap <M-2> gc

nmap <silent> <M-3> :NERDTreeToggle<CR>
nmap <silent> <M-4> :TagbarToggle<CR>

" toggle fold
set foldmethod=indent
set nofoldenable "folding ikke på default når du åpner en fil
set foldlevel=2
set foldnestmax=2 " 1 = klassenivå, 2 = funksjoner
set foldopen+=jump
nnoremap <expr> <F1> &foldlevel ? 'zM' :'zR'
nnoremap go za
nnoremap gO zA
nnoremap <M-m> zr
nnoremap <M-M> zm


"=====Test=====
map <F12> :w <CR>:!gcc -g % -o %< && ./%< <CR>
" nnoremap qq :q!<CR>
" nnoremap qw :wq!<CR>
" nnoremap qa :qa!<CR>
" nnoremap qd :bd!<CR>

augroup HelpKeymap
    autocmd!
    autocmd FileType help noremap <buffer> q :q<cr>
augroup END

augroup QuickfixKeymap
    autocmd!
    autocmd FileType qf noremap <silent> <buffer> q :q<cr>
augroup END

" nmap gw <M-s>iw
" nmap gW <M-s>iW
nmap <M-w> <M-r>iw
nmap <M-W> <M-r>iW

nnoremap <M-c> ciw
nnoremap <M-C> ciW

" Insert mode navigation uten å escape, undos lagres per linje
inoremap <C-J> <Down>
inoremap <C-K> <Up>
" Alt-f og alt-b kan enten escape eller ikke, som C-f og C-b eller som C-J og C-K, eller kan være mer som alt-j og alt-k
" Men, det kan være hendig å kunne go opp eller ned en linje og gå til normal mode, som alt-j og alt-k, men de funker dårlig med normal browsing j og k som jeg har, men jeg kan ikke bruke ctrl i normal mode til det fordi det må være til window nav.
" inoremap <M-f>
"
nnoremap <M-.> :<Up>
cnoremap <M-.> <Up>
cnoremap <M-:> <Down>

nnoremap mv :Rename<Space>
nnoremap cd :Directories<CR>
nnoremap do :Explore<CR>
" Kan være en nyttig mapping, men den glemmer hvor vim ble startet fra, altså project root
" :set autochdir!
" nnoremap cu :cd %:p:h<CR>\|:pwd<CR>

nnoremap cu :<C-U>call ToggleWorkingDir()<CR>




"cd to home?
nnoremap g/ :g//<CR>
nnoremap g= =ap
nnoremap <M-a> mz=ap`z
" nnoremap g= gg=G``
" nnoremap gb %
" nnoremap Q %
"holy shit lol ,hmmm funker ikke helt
" nnoremap qq qq:unmap qq<CR>:nnoremap q q<CR>
" nnoremap Q @q
" nnoremap Q q
nnoremap q ``
nnoremap Q `.

" xnoremap gb %
" onoremap gb %
nnoremap gB :ls!<CR>:b<Space>
nnoremap gb :Buffers<CR>
nnoremap <leader><Tab> :Buffers<CR>

nnoremap vm :Maps!<CR>
" nnoremap mk :mksession!<Space>
let g:session_dir = '~/.vim/sessions'
exec 'nnoremap mk :mks! ' . g:session_dir . '/'
exec 'nnoremap mo :so ' . g:session_dir. '/<C-D>'
"vim session dir, fzf to resume
"autosave session when opened with -S, from v:this_session or SessionLoadPost autocmd
"autosave session on vim exit
"or map to update current session, taken from variable, or show mksession if
"there is no current session
" :nmap <F2> :wa<Bar>exe "mksession! " . v:this_session<CR>:so ~/sessions/
" if exists("v:this_session")
"     echom v:this_session
" endif
" Kan ikke bare sjekke variabelen, fordi den ikke er satt før vimrc kjører
" virker det som
" Må bruke autocommand for å sette en autocommand som lagrer ved VimLeave
" eller VimLeavePre
" En mapping til en kommando som lagrer en ny session med et navn OG sørger
" for at den autosaves i den samme instansen av vim (evt. bare umiddelbart
" source sessionen for å trigge autocmden)

nnoremap <C-S> :Lines<CR>
cnoremap <C-S> <C-C>:Lines<CR>
nnoremap <C-Space> <C-W>p
" nnoremap <leader><Tab> <C-W>p

nnoremap <M-x> :Commands<CR>

" nnoremap <leader>1 <C-W>o
" nnoremap <leader>2 <C-W>v
nnoremap <leader>1 :1tabnext<CR>
nnoremap <leader>2 :2tabnext<CR>
nnoremap <leader>3 :3tabnext<CR>
nnoremap <leader>4 :4tabnext<CR>
nnoremap <leader>5 :5tabnext<CR>

" map } i{
" map ] i[
" map ) i(
"


" Shortcuts som egentlig ikke sparer deg for så mye, men som kan være nice,
" med mindre du finner noe bedre å bruke dem til
nmap cv civ
" nmap dv div gir mening i tillegg, men vil kanskje ha noe annet her?
" clone paragraph: yapP
" change paragraph: cip
" delete paragraph: dap
nnoremap dp dap

nnoremap vv viw
nnoremap vV viW
nnoremap vp vip
nnoremap vo <C-W>o
" nnoremap vs <C-W>v


" Zappend
nnoremap zd "Zdd
nnoremap zp "zp:let @z=''<CR>

" nnoremap + :<C-u>+m.<left><left>
" nnoremap - :<C-u>-m.<left><left>


" nnoremap goh :let @a=getcwd() \| lcd %:h \| terminal<cr>:execute 'lcd '.@a<cr>A


" resize:
nnoremap <silent> <S-Up> 10<C-w>+
nnoremap <silent> <S-Down> 10<C-w>-
nnoremap <silent> <S-Left> 10<C-w><
nnoremap <silent> <S-Right> 10<C-w>>

inoremap <M-CR> <ESC>:s/\s*$/;<CR>j
nnoremap <M-CR> <ESC>:s/\s*$/;<CR>j

nnoremap zx :pclose<CR>


inoremap <M-n> <C-N>
inoremap <M-p> <C-P>

nmap gj ][
nmap gk []

"go to next search match while searching
cnoremap <M-j> <C-G>
cnoremap <M-k> <C-T>

xnoremap <expr> I mode() == '<C-V>' ? 'I' : '<C-V>^I'
xnoremap <expr> A mode() == '<C-V>' ? 'A' : '<C-V>$A'

xnoremap <expr> j mode() ==# 'v' ? 'gj' : 'j'
xnoremap <expr> k mode() ==# 'v' ? 'gk' : 'k'

" highlight last inserted text
nnoremap gV `[v`]

inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

"=====TEST END=====




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
" nmap <silent> <M-s> <Plug>(operator-sandwich-add)
" nmap <silent> <M-s><M-s> <Plug>(operator-sandwich-add)<Plug>(textobj-sandwich-auto-a)
" xmap <M-s> <Plug>(operator-sandwich-add)
nmap <silent> <M-r> <Plug>(operator-sandwich-add)
nmap <silent> <M-r><M-r> <Plug>(operator-sandwich-add)<Plug>(textobj-sandwich-auto-a)
xmap <M-r> <Plug>(operator-sandwich-add)
" nmap <silent> <M-s><M-s><Plug>(operator-sandwich-add)<SID>line
" nmap <M-S> <M-s><SID>gul
nmap ds <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap dss <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
nmap cs <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap css <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

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
    if bufnr('Scratch') == -1
        e Scratch
        setlocal filetype=text
        setlocal nobuflisted
        setlocal bufhidden=hide
        setlocal buftype=nofile
        setlocal noswapfile
    elseif bufnr('%') == bufnr('Scratch')
        b #
    else
        execute "b " . bufnr('Scratch')
    endif
endfunction
map <silent> <M-1> :call Scratch()<CR>


function! JustOneSpace()
    s/\s\+/ /
    normal ==
endfunction
command! JustOneSpace call JustOneSpace()
nnoremap <silent> <M-Space> :JustOneSpace<CR>

command! -nargs=? Filter let @x='' | execute 'g/<args>/y X' | enew | setlocal bt=nofile | put! x

command! BufOnly silent! execute "up|%bd|e#|bd#"

function! ToggleWorkingDir()
    if !exists("g:project_dir")
        let g:project_dir=getcwd()
        cd %:p:h
        pwd
    else
        execute "cd " . g:project_dir
        unlet g:project_dir
        pwd
    endif
endfunction

function! StripTrailingWhitespace()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

function! s:BG()
    let &background = ( &background == "dark" ? "light" : "dark" )
    if exists("g:colors_name")
        exe "colorscheme " . g:colors_name
    endif
endfunction
command! BG call s:BG()
nnoremap <silent> <F5> :BG<CR>



let g:colorlist = ["material-theme", "snow", "deus", "onehalfdark"]
function! CNext()
    let len_shortlist = len(g:colorlist)
    let current_scheme_idx = index(g:colorlist, g:colors_name)
    let next_scheme_idx = (current_scheme_idx + 1) % len_shortlist
    let next_scheme = g:colorlist[next_scheme_idx]
    exec 'colorscheme '.next_scheme
endfunction
command! CNext call CNext()

function! CPrev()
    let len_shortlist = len(g:colorlist)
    let current_scheme_idx = index(g:colorlist, g:colors_name)
    let next_scheme_idx = (current_scheme_idx - 1)
    if next_scheme_idx == -1
        let next_scheme_idx = (len_shortlist - 1)
    endif
    let next_scheme = g:colorlist[next_scheme_idx]
    exec 'colorscheme '.next_scheme
endfunction
command! CPrev call CPrev()

nnoremap <silent> <F3> :CPrev<CR>
nnoremap <silent> <F4> :CNext<CR>

" FUNCTIONS END
"_____________


"-----------------
" PLUGINS

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
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-D>"

" ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()

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


" Ultisnips
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsJumpForwardTrigger="<M-f>"
let g:UltiSnipsJumpBackwardTrigger="<M-b>"
" let g:UltiSnipsRemoveSelectModeMappings = 0


" Maximizer
nnoremap <silent><leader><leader> :MaximizerToggle<CR>

" Vim markdown
let g:markdown_enable_spell_checking = 0

" Bullets
let g:bullets_enabled_file_types = [
            \ 'markdown',
            \ 'text',
            \ 'gitcommit',
            \ 'Scratch'
            \]

autocmd VimEnter * ALEDisable

