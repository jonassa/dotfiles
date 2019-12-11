set termguicolors
" vim: foldmethod=marker
runtime! archlinux.vim
filetype plugin indent on

"{{{ PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/mhinz/vim-signify'

Plug 'https://github.com/vim-scripts/ScrollColors'
"=====COLORSCHEMES=====
Plug 'KeitaNakamura/neodark.vim'
Plug 'https://github.com/sts10/vim-pink-moon'
Plug 'arcticicestudio/nord-vim'
let g:nord_comment_brightness = 20
Plug 'https://github.com/rakr/vim-two-firewatch'
Plug 'https://github.com/tyrannicaltoucan/vim-quantum'
Plug 'https://github.com/jdkanani/vim-material-theme'
Plug 'https://github.com/lifepillar/vim-wwdc16-theme'
Plug 'https://github.com/kamwitsta/nordisk'
Plug 'https://github.com/tpozzi/Sidonia'
Plug 'https://github.com/zeis/vim-kolor'
Plug 'https://github.com/ajmwagar/vim-deus'
Plug 'https://github.com/kristijanhusak/vim-hybrid-material'
Plug 'https://github.com/jlesquembre/base16-neovim'
Plug 'https://github.com/nightsense/vrunchbang'
let g:vrunchbang_dark_LineNr = 'off'
Plug 'https://github.com/nightsense/seabird'
Plug 'https://github.com/nightsense/stellarized'
Plug 'https://github.com/nightsense/rusticated'
Plug 'https://github.com/andreypopp/vim-colors-plain'
Plug 'https://github.com/yuttie/inkstained-vim'
Plug 'https://github.com/logico-dev/typewriter'
Plug 'https://github.com/NLKNguyen/papercolor-theme'
Plug 'https://github.com/Nequo/vim-allomancer'
Plug 'https://github.com/morhetz/gruvbox'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1
Plug 'https://gitlab.com/protesilaos/tempus-themes-vim.git'
" Plug 'https://github.com/sonph/onehalf' " Installert manuelt
Plug 'https://github.com/tomasr/molokai'
Plug 'https://github.com/kamwitsta/flatwhite-vim'
Plug 'sainnhe/vim-color-forest-night'
Plug 'Rigellute/rigel'
" Plug 'https://github.com/joshdick/onedark.vim'
" Plug 'trevordmiller/nova-vim'
" Plug 'https://github.com/nightsense/snow'
" Plug 'crusoexia/vim-monokai'
Plug 'https://github.com/drewtempelmeyer/palenight.vim'
Plug 'junegunn/seoul256.vim'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'
" Plug 'junegunn/vim-peekaboo'

Plug 'https://github.com/dkarter/bullets.vim'
let g:bullets_enabled_file_types = [
            \ 'markdown',
            \ 'text',
            \ 'gitcommit',
            \ 'Scratch'
            \]
Plug 'https://github.com/gabrielelana/vim-markdown'
let g:markdown_enable_spell_checking = 0

Plug 'pacha/vem-tabline'
let g:vem_tabline_show = 2
let g:vem_tabline_multiwindow_mode = 0

Plug 'https://github.com/scrooloose/nerdtree'
" Plug 'https://github.com/ryanoasis/vim-devicons'
" Plug 'https://github.com/majutsushi/tagbar'

Plug 'liuchengxu/vista.vim'
let g:vista_stay_on_open = 0
let g:vista_icon_indent = [" » ", "\t"]
let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
  \ 'scala': 'coc',
  \ 'vim': 'ctags',
  \ }
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 0

Plug 'https://github.com/tpope/vim-commentary'

Plug 'wellle/targets.vim'

Plug 'https://github.com/machakann/vim-sandwich/'
Plug 'https://github.com/kana/vim-textobj-user'
Plug 'https://github.com/kana/vim-textobj-entire'
Plug 'https://github.com/kana/vim-textobj-indent'
" Plug 'https://github.com/kana/vim-textobj-function'
Plug 'https://github.com/Julian/vim-textobj-variable-segment'


Plug 'christoomey/vim-tmux-navigator'

Plug 'https://github.com/romainl/vim-qf'
let g:qf_mapping_ack_style = 1
let g:qf_max_height = 15

Plug 'junegunn/vim-slash'
" Husker ikke hva ulempen med denne var
" Lar deg automatisk gjøre nohlsearch etter søk
" Lar deg gjøre * uten å bevege deg
" Lar deg gjøre * på en visual selection
" Ser ut til å også gjøre gd veldig lik * (står stille, highlight)

Plug 'unblevable/quick-scope'
Plug 'justinmk/vim-sneak'
let g:sneak#s_next = 1
let g:sneak#use_ic_scs = 1
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
highlight link Sneak IncSearch

Plug 'maxbrunsfeld/vim-yankstack'

Plug 'https://github.com/tommcdo/vim-exchange'
" Plug 'https://github.com/AndrewRadev/splitjoin.vim'
Plug 'https://github.com/FooSoft/vim-argwrap'
nnoremap gw :ArgWrap<CR>
Plug 'junegunn/vim-easy-align'
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

Plug 'https://github.com/jiangmiao/auto-pairs'
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutBackInsert = ''
let g:AutoPairsMapCh = 0
let g:AutoPairsMoveCharacter = ''
let g:AutoPairsShortcutJump = ''
let g:AutoPairsShortcutFastWrap = ''

" Bedre? Nei fucker med parantes på ny linje
" Plug 'https://github.com/Raimondi/delimitMate'

Plug 'https://github.com/AndrewRadev/sideways.vim'
" disse funker bare for lister/argumenter?
nnoremap <silent> <c-m-b> :SidewaysLeft<CR>
nnoremap <silent> <c-m-f> :SidewaysRight<CR>
" funker dårlig når:
" ordet er siste på en linje (kopierer med space på starten istedetfor slutten)
" du flytter ordet til siste på en linje (hopper over linja fordi next word
" ikke finnes)
" Må lage funksjoner som sjekker innholdet av registeret for posisjon av
" space, og om neste ord er siste på linja (må da gå til slutten av linja,
" prepende en space til registeret, fjerne space på slutten av registeret, og
" paste)
nnoremap <m-F> daWWPB
nnoremap <m-B> daWBPB

" UNIX helpers
" Brukes bare til Rename og Remove, kanskje Chmod
Plug 'https://github.com/tpope/vim-eunuch'

Plug 'https://github.com/jeetsukumaran/vim-filebeagle'
let g:filebeagle_suppress_keymaps = 1
nnoremap <silent> - :FileBeagleBufferDir<CR>

" Plug 'https://github.com/romainl/vim-devdocs'
" nnoremap <leader>K :DD<CR>

" Plug 'https://github.com/thaerkh/vim-indentguides'
" let g:indentguides_ignorelist = ['help']
" let g:indentguides_spacechar = '┆'
" let g:indentguides_tabchar = '|'

" LANGUAGE SUPPORT
Plug 'sheerun/vim-polyglot'
Plug 'https://github.com/derekwyatt/vim-scala'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" Plug 'https://github.com/metakirby5/codi.vim'
" nnoremap <leader>oc :Codi!!<CR>

" Plug 'https://github.com/SirVer/ultisnips'
Plug 'https://github.com/honza/vim-snippets'

Plug 'dense-analysis/ale'
" au VimEnter * ALEDisable
nnoremap <silent> æ :ALENextWrap<CR>
nnoremap <silent> Æ :ALEPreviousWrap<CR>
nnoremap <silent> gæ :ALEDetail<CR>
" Disable ALE for certain languages and use coc instead
let g:ale_linters = {
\   'scala': [''],
\}

" LSP
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" CocInstall:
    " coc-json
    " coc-snippets
    " coc-tag
" let g:coc_global_extensions = ['coc-json', 'coc-snippets', 'coc-tag']
" call coc#add_extension('coc-json', 'coc-snippets', 'coc-tag')
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-tag', {'do': 'yarn install --frozen-lockfile'}

" Ikke bruk coc#_select_confirm (som confirmer uten at du har valgt noe)
" coc#on_enter etter <CR>, sier ifra om noe greier om man vil formatte on input
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>\<CR>" : "\<C-g>u\<CR>"
inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>\<CR>" : 
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Close the preview window when completion is done
" Lurer på om denne egentlig er nødvendig
au! CompleteDone * if pumvisible() == 0 | pclose | endif

imap <M-e> <Plug>(coc-snippets-expand)
" vmap <C-j> <Plug>(coc-snippets-select) " Hva er dette?
let g:coc_snippet_next = '<m-f>'
let g:coc_snippet_prev = '<m-b>'

set updatetime=300
" set signcolumn=yes " default = auto
set nobackup
set nowritebackup
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
set statusline^=%{coc#status()}

" comment highlighting in jsonc
au FileType json syntax match Comment +\/\/.\+$+

" TAB: next or tab or trigger completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" S-TAB: previous or backspace
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

Plug 'https://github.com/tpope/vim-apathy'

call plug#end()
"}}}

"{{{ STATUSLINE
set statusline=
set statusline+=%#title#\ %f\ %*
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
"}}}

"{{{ COLORS
syntax enable
set background=dark

" if !empty($VIM_COLORS)
"     let g:theme=$VIM_COLORS
"     colorscheme $VIM_COLORS
" else
"     let g:theme='material-theme'
"     colorscheme material-theme
" endif

" let g:dark='base16-tomorrow-night'
" let g:dark='allomancer'
let g:dark='neodark'
" let g:light='tempus_past'
let g:light='tempus_dawn'
let g:fallback='material-theme'

if $MOOD == "light"
    let g:theme=g:light
elseif $MOOD == "dark"
    let g:theme=g:dark
else
    let g:theme=g:fallback
endif
execute 'colorscheme ' . g:theme

if has('termguicolors')
    set termguicolors
    if exists('$TMUX')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
endif

function! SetColors()
    if &termguicolors == 0
        " Set default/fallback that looks nice
        let g:theme='gruvbox'
    elseif exists('b:textfile')
        let g:theme=g:light
        set background=light
    else
        let g:theme=g:dark
        set background=dark
    endif
    execute 'colorscheme ' . g:theme
endfun

let g:favorites = [
            \ "material-theme",
            \ "deus",
            \ "onehalfdark",
            \ "two-firewatch",
            \ "allomancer",
            \ "forest-night",
            \ "flatwhite",
            \ "orange-moon",
            \ "nordisk",
            \ "onehalfdark",
            \ "neodark",
            \ "base16-tomorrow-night",
            \ "hybrid_material",
            \ "rigel",
            \ "molokai",
            \ "palenight",
            \ "seoul256",
            \ "seoul256-light",
            \ ]

function! CRotate()
    let len_shortlist = len(g:favorites)
    let current_scheme_idx = index(g:favorites, g:colors_name)
    let next_scheme_idx = (current_scheme_idx - 1)
    if next_scheme_idx == -1
        let next_scheme_idx = (len_shortlist - 1)
    endif
    let next_scheme = g:favorites[next_scheme_idx]
    exec 'colorscheme '.next_scheme
    echo g:colors_name
endfunction
command! CRotate call CRotate()

nnoremap <F3> :CRotate<CR>

function! s:BG()
    let &background = ( &background == "dark" ? "light" : "dark" )
    if exists("g:colors_name")
        exe "colorscheme " . g:colors_name
    endif
endfunction
command! BG call s:BG()
nnoremap <silent> <F5> :BG<CR>

"}}}

"{{{ OPTIONS

set winaltkeys=no

set number
" set relativenumber
set title
set cursorline
set listchars=tab:\ \ ,nbsp:␣,trail:·,extends:›,precedes:‹

" set iskeyword+=\-

set notimeout

set mouse=a

set ignorecase
set smartcase

set autoread

set encoding=utf8
set fileencoding=utf8

set tabstop=4 shiftwidth=4
set expandtab
set smarttab

set autoindent
" set smartindent
set cindent " should override smartindent (and maybe autoindent)
set copyindent " use same type of indentation (spaces/tabs) as previous line

" may require additional config: align wrapped lines with indentation
set breakindent

set wrap
set linebreak

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


set scrolloff=5
set sidescrolloff=3

set nojoinspaces
" set formatoptions+=n
" set formatoptions-=o
" Kan være dette ikke er beste autocommand event å bruke, men funker.
" Formatoptions er ellers ikke persistent
au! BufEnter * set formatoptions=jncrql

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

" Using vim-apathy instead, which should make it possible to :find, gf,
" :isplit and so on to included files (standard library at least, but maybe
" also for the current project?) However, go to symbol/tag is better than
" :ijump, and these things are probably better solved by a langserver or ctags anyway.
" set path=**
" Go back to this if something fails
" set path=.,,**

" No ~ in end of buffer
set fillchars=eob:\ 

" Ikke vis vimintro, completion-meldinger
set shortmess+=cI
set noshowmode

" Do not store options in session
set sessionoptions-=options,folds,help

set diffopt+=vertical

set wildignorecase

"}}}

" AUTOCOMMANDS {{{
augroup vimrc
autocmd!

" Restore cursor position and other state from shada/viminfo
au BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Autoreload vimrc
au BufWritePost $MYVIMRC source $MYVIMRC

" Normalize splits on resize
au VimResized * wincmd =

" Close Netrw when exiting
au FileType netrw setlocal bufhidden=delete

" Close preview window after completion
au CompleteDone * pclose

" Highlight cursorline only in active window
au WinEnter * set cursorline
au WinLeave * set nocursorline

" Use q to close help and quickfix windows
au FileType qf noremap <silent> <buffer> q :close<CR>
au FileType help noremap <silent> <buffer> q :close<CR>

" Use custom colorscheme for text files
au FileType text let b:textfile = 1
au BufEnter * call SetColors()

augroup END
"}}}

"------------
" KEYBINDINGS
"------------

" Escape
inoremap <M-q> <Esc>
nnoremap <M-q> <Esc>
xnoremap <M-q> <Esc>
snoremap <M-q> <Esc>
cnoremap <M-q> <C-C>
onoremap <M-q> <Esc>
inoremap <ScrollWheelUp> <Esc>
inoremap <ScrollWheelDown> <Esc>

" Leader maps
let g:mapleader=" "
nmap <silent> <leader>q :qa!<CR>
nmap <silent> <leader>Q :qa!<CR>
nmap <silent> <leader>w :x!<CR>
nmap <silent> <leader>s :up<CR>
nmap <silent> <leader>e :e!<CR>
nmap <silent> <leader>v :e $MYVIMRC<CR>
nmap <silent> <leader>C :Directories<CR>
nmap <silent> <leader>n :enew<CR>
nmap <silent> <leader>t :Tags<CR>
nmap <silent> <leader><leader> :Vista finder<CR>
" nmap <silent> <leader>b :Buffers<CR>
nnoremap <leader><Tab> :Buffers<CR>
nmap <silent> <leader>r :History<CR>
nmap <silent> <C-R> :History:<CR>
nmap <silent> <leader>: :Commands<CR>
nmap <silent> <leader>h :Helptags<CR>
nmap <silent> <leader>f :Files<CR>
nmap <silent> <leader>F :Files ~<CR>
nmap <silent> <leader>g :GFiles<CR>
" nmap <silent> <leader>l :Lines<CR>
nmap <leader>a :Ag<Space>
nmap <leader>o :Locate<Space>
nmap <silent> <leader>m :Marks<CR>
nmap <silent> <leader>c :Colors<CR>
nmap <silent> <leader>d :Gdiffsplit<CR>

inoremap <M-f> <Esc><C-Right>
inoremap <M-b> <Esc><C-Left>
nnoremap <M-f> <C-Right>
nnoremap <M-b> <C-Left>
nnoremap <M-d> dW

" Undo from insert mode
inoremap <M-u> <Esc>u
inoremap <M-U> <Esc>U
nnoremap <M-u> u
nnoremap <M-U> <C-R>

inoremap <M-o> <Esc>o
inoremap <M-O> <Esc>O

vmap <M-u> <Esc>u
vmap <M-U> <Esc>U

" Insert mode editing
inoremap <C-D> <Del>
inoremap <C-F> <Right>
inoremap <C-B> <Left>
" TODO: finne noe bedre for change line fra insert mode og normal mode
" inoremap <C-Q> <Esc>S
inoremap <M-i> <Esc>I
inoremap <M-a> <Esc>A
inoremap <M-d> <C-\><C-O>de
inoremap <C-C> <Esc>
imap <C-L> <C-X><C-L> " line completion
imap <M-w> <C-X><C-F>

" Command mode editing
noremap! <M-BS> <C-W>
cnoremap <M-f> <C-Right>
cnoremap <M-b> <C-Left>
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <M-D> <C-Right><C-W>
cnoremap <M-N> <C-n>
cnoremap <M-P> <C-p>

" Go to next/prev search match while searching
cnoremap <M-j> <C-G>
cnoremap <M-k> <C-T>

" Up/down command history
nnoremap <M-.> :<Up>
cnoremap <M-.> <Up>
cnoremap <M-:> <Down>

" Small keys
noremap \ @:
" nnoremap ? K
" noremap <M-BS> <Nop>
" noremap ¤ ~

" Navigate changelist
noremap , g;zz
noremap ; g,zz

" Alternating
" nnoremap <silent> <C-S> <C-W>p
" used by coc quickfix
nnoremap <C-Space> <C-W>p
nnoremap <silent> <C-A> <C-^>
nnoremap <BS> `.zz
nnoremap q ``
nnoremap Q `.zz
xnoremap q o<Esc>
xnoremap <M-o> o<Esc>

" Windows and buffers
nnoremap <silent> <C-Q> :close<CR>
nnoremap <C-X> :bd!<CR>
nnoremap <silent> <C-X> :bp<Bar>bd! #<Cr>
map <silent> <C-n> :bn<CR>
map <silent> <C-p> :bp<CR>
" nnoremap <C-H> <C-W><C-H>
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-H> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-J> :TmuxNavigateDown<CR>
nnoremap <silent> <C-K> :TmuxNavigateUp<CR>
nnoremap <silent> <C-L> :TmuxNavigateRight<CR>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<CR>

" Sudo write trick
cmap w!! w !sudo tee > /dev/null %

" Quickfix
set grepprg=ag\ --vimgrep\ --silent
command! -nargs=? -complete=file_in_path Grep silent grep! <args>
" nmap <silent> <leader>k :Grep "\b<cword>\b"<CR>
" nmap <silent> gw :Grep "\b<cword>\b"<CR>
nnoremap <silent> <left>  :cpf<CR>zvzz
nnoremap <silent> <right> :cnf<CR>zvzz
" nnoremap <silent> <up>    :cprev<CR>zvzz
" nnoremap <silent> <down>  :cnext<CR>zvzz
nmap <silent> co <Plug>(qf_qf_toggle)
augroup QuickfixKeys
au!
au BufReadPost quickfix nnoremap <buffer> <CR> <CR>
au BufReadPost quickfix nnoremap <silent> <buffer> J :call qf#filegroup#NextFile()<CR>
au BufReadPost quickfix nnoremap <silent> <buffer> K :call qf#filegroup#PreviousFile()<CR>
augroup END

" Diff mode
nnoremap <silent> <expr> <up>    &diff ? '[c' : ':cprev<CR>zvzz'
nnoremap <silent> <expr> <down>  &diff ? ']c' : ':cnext<CR>zvzz'
nnoremap <silent> <expr> <left>  &diff ? 'do' : ':cpf<CR>zvzz'
nnoremap <silent> <expr> <right> &diff ? 'dp' : ':cnf<CR>zvzz'
nnoremap <silent> <expr> dp &diff ? 'dp' : ':t.<CR>'
nnoremap <silent> <expr> do &diff ? 'do' : ':Explore<CR>'

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
nnoremap <M-j> 4gjzz
nnoremap <M-k> 4gkzz
" nnoremap <C-M-J> ][
" nnoremap <C-M-K> []
nnoremap <C-F> <C-F>zz
nnoremap <C-B> <C-B>zz
nnoremap <C-D> <C-D>zz
nnoremap <C-U> <C-U>zz
nnoremap gg ggzz
nnoremap G Gzz
nnoremap <M-g> zz
nnoremap <C-E> zt
nnoremap <C-Y> zb


" søk
nnoremap s /
nnoremap S ?
vnoremap s /
vnoremap S ?

" substsitute
nnoremap gs :%s/
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

" go to tag
nnoremap <CR> <C-]>zz
nnoremap <M-g> <C-]>zz

" redo
nnoremap U <C-R>

" command mode
noremap ø :

" record macro one key
let g:isRecording = get(g:, 'isRecording', 0)
nnoremap <expr> <silent> å g:isRecording ? 'q:let g:isRecording=0<CR>' : 'qq:let g:isRecording=1<CR>'
" play macro
nnoremap Å @q

" no Ex-mode
nnoremap gQ <Nop>
nnoremap <M-Q> <Nop> 

" join line
nnoremap <M-J> J
" split line
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
xnoremap <M-i> >gv
xnoremap <M-I> <gv

nnoremap <M-i> >>
nnoremap <M-I> <<

let g:yankstack_map_keys = 0
let g:yankstack_yank_keys = ['y', 'Y', 'd', 'D']
call yankstack#setup()
nmap <M-p> <Plug>yankstack_substitute_older_paste
nmap <M-n> <Plug>yankstack_substitute_newer_paste
" yank to clipboard
map <leader>y "+y
vnoremap <C-C> "+y
nnoremap <silent> <C-C> "+yy
" paste from clipboard
map <leader>p <esc>"+p
nnoremap cp <esc>"+p
nnoremap cP <esc>"+P
" paste from yank register
nnoremap yp "0p
nnoremap yP "0P

" duplicate lines
nnoremap <M-D> :t-1<CR>
vnoremap P :t-1<CR>
vnoremap + :t-1<CR>
nnoremap + yyp

" toggle comment
nmap <M-c> gcc
xmap <M-c> gc
nmap <M-C> :t-1<CR>gccj

" yank to end of line
map Y y$
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

nnoremap <silent> <M-o> :<c-u>call <sid>blankdown(v:count1)<CR>
nnoremap <silent> <M-O> :<c-u>call <sid>blankup(v:count1)<CR>

" insert space
nnoremap g<Space> a<Space><Esc>

" " move lines
nnoremap <silent> <C-M-j> mz:m+<CR>`z
nnoremap <silent> <C-M-k> mz:m-2<CR>`z
" Må modifiseres for å også autoindentere
vnoremap <M-j> :m'>+<CR>`<my`>mzgv`yo`z
vnoremap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z

nnoremap <silent> <M-Bar> :call Scratch()<CR>
" nnoremap <silent> <M-1> :NERDTreeToggle<CR>
" nnoremap <silent> <M-2> :TagbarToggle<CR>
nnoremap <silent> <expr> <M-1> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
nnoremap <silent> <M-2> :Vista!!<CR>
nnoremap <silent> <M-3> :Vista!!<Bar>NERDTreeToggle<CR><C-W>p

"{{{ FOLDING
" set foldmethod=indent
set nofoldenable " don't fold by default (not great when working on vimrc and using folds)
set foldlevel=2
set foldnestmax=2 " 1 = classes, 2 = functions
set foldopen+=jump
nnoremap <expr> <F1> &foldlevel ? 'zM' :'zR'
" nnoremap go za
" nnoremap gO zA
nnoremap <M-m> zm
nnoremap <M-M> zr
"}}}


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
nmap <silent> <M-r> <Plug>(operator-sandwich-add)
" nmap <silent> <M-r><M-r> <Plug>(operator-sandwich-add)<Plug>(textobj-sandwich-auto-a)
xmap <M-r> <Plug>(operator-sandwich-add)
" nmap <silent> <M-s><M-s><Plug>(operator-sandwich-add)<SID>line
" nmap <M-S> <M-s><SID>gul
nmap ds <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap dss <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
nmap cs <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap css <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

nmap <M-w> <M-r>iw
nmap <M-W> <M-r>iW
" nmap <M-r><M-r> <M-r>$

" omap ij <Plug>(textobj-sandwich-auto-i)
" xmap ij <Plug>(textobj-sandwich-auto-i)
" omap aj <Plug>(textobj-sandwich-auto-a)
" xmap aj <Plug>(textobj-sandwich-auto-a)

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

"{{{ FUNCTIONS
let g:highlight_trailing = 0
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
highlight clear ExtraWhitespace
function! Highlight_trailing_whitespace()
    if g:highlight_trailing == 0
        let g:highlight_trailing = 1
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

function! JustOneSpace()
    s/\s\+/ /
    normal ==
endfunction
command! JustOneSpace call JustOneSpace()
nnoremap <silent> <M-Space> :JustOneSpace<CR>

command! -nargs=? Filter let @x='' | execute 'g/<args>/y X' | enew | setlocal bt=nofile | put! x

function! Redir(cmd)
  redir => message
  silent execute a:cmd
  redir END
  if empty(message)
    echoerr "No output"
  else
    enew | setlocal bt=nofile
    silent put=message
  endif
endfunction
command! -nargs=+ -complete=command Redir call Redir(<q-args>)

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

" Run current file as script with optional arguments to pass to the script
" TODO: add appropriate shebang for language, chmod +x, save and run
" Separate command to shebang and make executable
" A file will not be run with right interpreter, even with .py extension,
" without shebang. Note: this should be used for files intended to be run as
" executable scripts, and has the advantage that it is filetype agnostic. However, many
" programs should not be executables, so there should be a different function
" for running a file with the right interpreter
command! -nargs=* R up|!% <args>
nnoremap <leader>r :R<CR> " Requires shebang and executable (run file as script)
" nnoremap <leader>r :w <CR>:!python %<CR>

" Save, compile with gcc, and run binary
map <F12> :w <CR>:!gcc -g % -o %< && ./%< <CR>
" Save and run python interpreter on file
map <F10> :w <CR>:!python %<CR>
" Send selection to python interpreter
xnoremap <leader>r :w !python<CR>

" Copy a register to the clipboard
command! -nargs=1 Clip let @+=@<args>
"}}}


"-----------------
" PLUGINS

"{{{ FZF
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_nvim_statusline = 0
" imap <c-x><c-f> <plug>(fzf-complete-file-ag)
" complete both dirs and files using find (problem with permissions)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
nmap <leader>? <plug>(fzf-maps-n)
xmap <leader>? <plug>(fzf-maps-x)
omap <leader>? <plug>(fzf-maps-o)
imap <c-x>? <plug>(fzf-maps-i)
let g:fzf_buffers_jump = 1

" Files with bat previewer
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, {'options': ['--preview', 'bat -p --color always {}']}, <bang>0)
" cd to any dir under $HOME
command! -nargs=* -complete=dir Directories call fzf#run(fzf#wrap(
            \ {'source': 'fd . -H -td ~',
            \  'sink': 'cd'}))

" Disable statusline
au! FileType fzf
au  FileType fzf set laststatus=0 noshowmode noruler
            \| au BufLeave <buffer> set laststatus=2 showmode ruler

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
"}}}

" Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25

" NERDTree {{{
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowFiles = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeAutoDeleteBuffer = 1
au BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
au StdinReadPre * let s:std_in=1
"}}}

" Tab completion
" inoremap <expr> <CR> pumvisible() ? "\<C-Y>\<CR>" : "\<CR>" " accept and newline or newline
" inoremap <expr> <Tab> pumvisible() ? "\<C-N>" : "\<Tab>"  " next or tab

" Disse to kan erstattes av tilsvarende config for coc (S-Tab og Tab)
" c-h er forsåvidt bedre enn c-d for shift-tab når det ikke completes

" Shift tab gjør ingenting nyttig default
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-P>" : "\<C-D>" " previous or untab

" function! Tab_Or_Complete()
"     if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"         return "\<C-N>"
"     elseif pumvisible()
"         return "\<C-N>"
"     else
"         return "\<Tab>"
"     endif
" endfunction
" inoremap <silent> <Tab> <C-R>=Tab_Or_Complete()<CR>

" Needed to enable omnicompletion Ctrl-X Ctrl-O
" set omnifunc=syntaxcomplete#Complete


" Ultisnips {{{
" let g:UltiSnipsExpandTrigger="<m-e>"   " expand, bruk m-a for eol
" " let g:UltiSnipsJumpForwardTrigger="<tab>"
" " let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
" let g:UltiSnipsJumpForwardTrigger="<M-f>"
" let g:UltiSnipsJumpBackwardTrigger="<M-b>"
" let g:UltiSnipsRemoveSelectModeMappings = 0
nnoremap <m-e> :Snippets<CR>
"}}}

" TESTING {{{

" if winnr('$') == 1
"   " only one window
"   " make expression mapping to bd when last window in help buffer
" endif

nnoremap cd :Directories<CR>
" nnoremap cd :call search('\d\+')<CR>gnc
nnoremap cd /\d\+<CR>gnc
nnoremap mv :Rename<Space>
nnoremap cu :<C-U>call ToggleWorkingDir()<CR>




"cd to home?
nnoremap g/ :g//<CR>
nnoremap g= =ap
" nnoremap g= gg=G``
nnoremap <M-a> mz=ap`z

map gb %
" nice om du ikke har fzf
nnoremap gB :ls!<CR>:b<Space>

nnoremap vm :Marks<CR>
let g:session_dir = '~/.vim/sessions'

" exec 'nnoremap mk :mks! ' . g:session_dir . '/'
" exec 'nnoremap mo :so ' . g:session_dir. '/<C-D>'

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
" https://vim.fandom.com/wiki/Go_away_and_come_back
" https://stackoverflow.com/questions/5142099/how-to-auto-save-vim-session-on-quit-and-auto-reload-on-start-including-split-wi

nnoremap <silent> <C-S> :up<CR>
inoremap <silent> <C-s> <Esc>:up<CR>
nnoremap <silent> <M-s> :up<CR>
inoremap <silent> <M-s> <Esc>:up<CR>

nnoremap <M-x> :Commands<CR>

" TODO: make new tab if error
nnoremap <silent> <leader>1 :1tabnext<CR>
nnoremap <silent> <leader>2 :2tabnext<CR>
nnoremap <silent> <leader>3 :3tabnext<CR>
nnoremap <silent> <leader>4 :4tabnext<CR>
nnoremap <silent> <leader>5 :5tabnext<CR>

" map } i{
" map ] i[
" map ) i(

" Shortcuts som egentlig ikke sparer deg for så mye, men som kan være nice,
" med mindre du finner noe bedre å bruke dem til
nmap cv civ
nmap dv div
" clone paragraph: yapP
" change paragraph: cip
" delete paragraph: dap

nnoremap vv viw
nnoremap vV viW
nnoremap VV viW
nnoremap vo <C-W>o

" nnoremap vp vip
" v som primær-register
nnoremap vd "vd
nnoremap vD "vD
nnoremap vdp "vdap
nnoremap vp "vp
nnoremap vP "vP
nnoremap vy "vy
nnoremap vY "vY

" Zappend/Zelect
nnoremap zd "Zdd
nnoremap zp "zp:let @z=''<CR>

nnoremap cp "1p
nnoremap cP "1P

" nnoremap + :<C-u>+m.<left><left>
" nnoremap - :<C-u>-m.<left><left>


" nnoremap goh :let @a=getcwd() \| lcd %:h \| terminal<CR>:execute 'lcd '.@a<CR>A


" resize:
nnoremap <silent> <S-Up> 10<C-w>+
nnoremap <silent> <S-Down> 10<C-w>-
nnoremap <silent> <S-Left> 10<C-w><
nnoremap <silent> <S-Right> 10<C-w>>

inoremap <M-CR> <ESC>:s/\s*;*\s*$/;<CR>j
nnoremap <M-CR> <ESC>:s/\s*;*\s*$/;<CR>j

nnoremap zx :pclose<CR>


inoremap <M-n> <C-N>
inoremap <M-p> <C-P>

nmap gj ]]
nmap gk [[

xnoremap <expr> I mode() == '<C-V>' ? 'I' : '<C-V>^I'
xnoremap <expr> A mode() == '<C-V>' ? 'A' : '<C-V>$A'

xnoremap <expr> j mode() ==# 'v' ? 'gj' : 'j'
xnoremap <expr> k mode() ==# 'v' ? 'gk' : 'k'

" highlight last inserted text
nnoremap gV `[v`]

inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

inoremap <M-2> @
inoremap <M-4> $
inoremap <M-5> %


nnoremap <m-h> ^

" Paste unnamed reg in insert mode, bruk heller C-Q for literal hvis i det hele
" tatt nødvendig
inoremap <C-v> <C-R>"

" Insert space (hva gjør du når du skal paste noe på slutten av en linje hvor
" det ikke er mellomrom fra før?
" nnoremap <m-s> a<Space><Esc>


nnoremap M zz
nnoremap <m-v> ^v$h
nnoremap <m-y> ^y$


" Alternate header/source using ctags --extras=+f
" nnoremap <silent> gh :<c-u>tjump /^<c-r>=expand("%:t:r")<CR>\.\(<c-r>=join(get(
"             \ {
"             \ 'c':   ['h'],
"             \ 'cpp': ['h','hpp'],
"             \ 'h':   ['c','cpp'],
"             \ 'hpp': ['cpp']
"             \ },
"             \  expand("%:e"), ['UNKNOWN EXTENSION']), '\\\|')<CR>\)$<CR>

" Does not use tags, only finds files in same directory, does not check if
" file exists
function Header()
    let l:ext = expand('%:e') 
    if l:ext == 'c'
        if filereadable(expand('%:r') . '.h')
            :e %:r.h
        else
            echo "No corresponding header"
        endif
    elseif l:ext == 'h'
        if filereadable(expand('%:r') . '.c')
            :e %:r.c
        else
            echo "No corresponding source"
        endif
    else
        echo "Not a c or h file"
    endif
endfunction
command! Header call Header()
nnoremap <silent> gh :Header<CR>

function! MoveOrCreateWindow(key) abort
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <M-Left> :call MoveOrCreateWindow('h')<CR>
nnoremap <silent> <M-Down> :call MoveOrCreateWindow('j')<CR>
nnoremap <silent> <M-Up> :call MoveOrCreateWindow('k')<CR>
nnoremap <silent> <M-Right> :call MoveOrCreateWindow('l')<CR>

nnoremap <C-W><C-I> <C-W>}

nmap đ <C-F>
nmap ” <C-B>
nnoremap } $
nnoremap ± <C-A>
nnoremap ¿ <C-X>

nnoremap <silent> t :Tags<CR>
nnoremap <silent> <M-l> :Lines<CR>
nnoremap <silent> gl :Lines<CR>
nnoremap <silent> S :Lines<CR>
set scrolloff=999
"}}}

" COC TESTING {{{
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" kan være alegotodefinition er bedre
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" gjør det samme som gd på en definisjon (gjorde hvertfall det for scala)
" nmap <silent> <leader>r <Plug>(coc-references)

" Documentation DWIM
nnoremap <silent> <m-h> :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" nmap <m-cr>  <Plug>(coc-codeaction)
nmap <c-space> <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" set foldmethod=manual
" Use `:Fold` to fold current buffer
" Fold comment, imports, region
" command! -nargs=? Fold :call CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
" command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')


nnoremap <silent> <leader>ll  :<C-u>CocList<CR>
nnoremap <silent> <leader>lc  :<C-u>CocCommand<CR>
nnoremap <silent> <leader>lo  :<C-u>CocList outline<CR>
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<CR>
" nnoremap <silent> <leader>o  :<C-u>CocList diagnostics<CR>

nmap <silent> <Bar> <Plug>(coc-diagnostic-next)
" coc uses ALE so coc-diagnostic-next and alenext have the same effect
    " diagnostic.displayByAle": true,
" nmap <silent> Æ <Plug>(coc-diagnostic-prev)

" <Plug>(coc-diagnostic-info)
" <Plug>(coc-diagnostic-next)
" <Plug>(coc-diagnostic-prev)
" <Plug>(coc-diagnostic-next-error)
" <Plug>(coc-diagnostic-prev-error)
" <Plug>(coc-definition)
" <Plug>(coc-declaration)
" <Plug>(coc-implementation)
" <Plug>(coc-type-definition)
" <Plug>(coc-references)
" <Plug>(coc-format-selected)
 " <Plug>(coc-format)
nnoremap <leader>lr <Plug>(coc-rename)
" <Plug>(coc-codeaction)
" <Plug>(coc-codeaction-selected)
" <Plug>(coc-openlink)
" <Plug>(coc-codelens-action)
" <Plug>(coc-fix-current)
" <Plug>(coc-float-hide)
" <Plug>(coc-float-jump)
" <Plug>(coc-refactor)
" <Plug>(coc-range-select)
" <Plug>(coc-range-select)
" <Plug>(coc-range-select-backward)
" <Plug>(coc-funcobj-i)
" <Plug>(coc-funcobj-a)
"}}}

