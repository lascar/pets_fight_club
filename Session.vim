let SessionLoad = 1
if &cp | set nocp | endif
nnoremap -sv :source $MYVIMRC
nnoremap -ev :vsplit $MYVIMRC
noremap -t :!ctags --tag-relative -Rf.git/tags.$$ --exclude=.git --exclude=log --exclude=public --exclude=node_modules --exclude=app/stylesheets * $(echo $GEM_HOME)/*;fg;mv .git/tags.$$ .git/tags;rm -f .git/tags.$$
let s:cpo_save=&cpo
set cpo&vim
nmap cr <Plug>Coerce
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
nnoremap gk k
nnoremap gj j
nnoremap j gj
nnoremap k gk
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())
nnoremap <silent> <S-F12> :bp
nnoremap <silent> <F12> :bn
nnoremap <silent> <F7> :NERDTreeToggle
nnoremap <silent> <F8> :TagbarToggle
nnoremap <silent> <F5> :buffers:buffer 
nnoremap <silent> <F3> 
inoremap  vawuea
inoremap  vawUea
iabbr jstr JSON.stringify(
iabbr @@ pascal.carrie@gmail.com
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set backspace=indent,eol,start
set backup
set cpoptions=aABceFs$
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set hidden
set history=1000
set laststatus=2
set nomodeline
set printoptions=paper:a4
set ruler
set runtimepath=~/.vim,~/.vim/bundle/javascript-libraries-syntax,~/.vim/bundle/nerdtree,~/.vim/bundle/tagbar,~/.vim/bundle/vim-abolish,~/.vim/bundle/vim-angular,~/.vim/bundle/vim-fugitive,~/.vim/bundle/vim-jsbeautify,~/.vim/bundle/vim-rails,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/bundle/javascript-libraries-syntax/after,~/.vim/after,$HOME/.vim
set shiftwidth=2
set softtabstop=2
set statusline=%m%F%h%w\ [ASCII=%03.3b]\ [HEX=%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set tabstop=2
set undodir=~/.vim/undodir
set undofile
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/petsFight
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +0 spec/controllers/pets_controller_spec.rb
argglobal
silent! argdel *
argadd spec/controllers/pets_controller_spec.rb
edit spec/controllers/pets_controller_spec.rb
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
nmap <buffer> gf <Plug>RailsTabFind
nmap <buffer> f <Plug>RailsSplitFind
nnoremap <buffer> <silent> g} :exe        "ptjump =RubyCursorIdentifier()"
nnoremap <buffer> <silent> } :exe          "ptag =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g] :exe      "stselect =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g :exe        "stjump =RubyCursorIdentifier()"
nnoremap <buffer> <silent>  :exe v:count1."stag =RubyCursorIdentifier()"
nnoremap <buffer> <silent> ] :exe v:count1."stag =RubyCursorIdentifier()"
nnoremap <buffer> <silent>  :exe  v:count1."tag =RubyCursorIdentifier()"
nmap <buffer> gf <Plug>RailsFind
nnoremap <buffer> <silent> g] :exe       "tselect =RubyCursorIdentifier()"
nnoremap <buffer> <silent> g :exe         "tjump =RubyCursorIdentifier()"
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=^\\s*def\\s\\+\\(self\\.\\)\\=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=%\\S%\\+\ \ %#%[cefi]%[rxod]%[eir]%[a-z]%#%\\x1b[0m\ %\\+%\\S%\\+%$%\\&%\\x1b%\\S%\\+\ \ %#%m%\\>%\\x1b[0m\ \ %#%f,%\\s\ %#%[cefi]%[rxod]%[eir]%[a-z]%#\ %\\+%\\S%\\+%$%\\&%\\s\ %#%m%\\>\ \ %#%f,Overwrite%.%#%\\S%\\+\ \ %#%m%\\x1b[0m\ \ %#%f,%-GOverwrite%.%#\"h\"%.%#,%+GCurrent\ version:%.%#,%+G\ %#Status\ %#Migration\ ID%.%#,%+G\ %#Prefix\ %#Verb%.%#,%+G\ %#Code\ LOC:\ %.%#,%+GAbout\ your\ application's\ environment,%+Grun\ %\\S%#::Application.routes,%+Eruby:%.%#(LoadError),%+EUsage:%.%#,%+ECould\ not\ find\ generator%.%#,%+EType\ 'rails'\ for\ help.,%D(in\ %f),%\\s%#from\ %f:%l:%m,%\\s%#from\ %f:%l:,%\\s%##\ %f:%l:%m,%\\s%##\ %f:%l,%\\s%#[%f:%l:\ %#%m,%\\s%#%f:%l:\ %#%m,%\\s%#%f:%l:,%m\ [%f:%l]:,chdir\ /HOME/home/pascal/petsFight
setlocal expandtab
if &filetype != 'ruby'
setlocal filetype=ruby
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=0
setlocal include=^\\s*\\<\\(load\\>\\|require\\>\\|autoload\\s*:\\=[\"']\\=\\h\\w*[\"']\\=,\\)
setlocal includeexpr=RailsIncludeexpr()
setlocal indentexpr=GetRubyIndent(v:lnum)
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,=end,=else,=elsif,=when,=ensure,=rescue,==begin,==end
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=ri
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeprg=bin/rake
setlocal matchpairs=(:),{:},[:]
setlocal nomodeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=~/petsFight/lib,~/petsFight/vendor,~/petsFight/app/models/concerns,~/petsFight/app/controllers/concerns,~/petsFight/app/controllers,~/petsFight/app/helpers,~/petsFight/app/mailers,~/petsFight/app/models,~/petsFight/app/*,~/petsFight/app/views,~/petsFight/app/views/pets,~/petsFight/app/views/application,~/petsFight/public,~/petsFight/test,~/petsFight/test/unit,~/petsFight/test/functional,~/petsFight/test/integration,~/petsFight/test/controllers,~/petsFight/test/helpers,~/petsFight/test/mailers,~/petsFight/test/models,~/petsFight/spec,~/petsFight/spec/controllers,~/petsFight/spec/helpers,~/petsFight/spec/mailers,~/petsFight/spec/models,~/petsFight/spec/views,~/petsFight/spec/lib,~/petsFight/spec/features,~/petsFight/spec/requests,~/petsFight/spec/integration,~/petsFight/vendor/plugins/*/lib,~/petsFight/vendor/plugins/*/test,~/petsFight/vendor/rails/*/lib,~/petsFight/vendor/rails/*/test,~/petsFight,~/.rubies/ruby-2.2.2/lib/ruby/site_ruby/2.2.0,~/.rubies/ruby-2.2.2/lib/ruby/site_ruby/2.2.0/x86_64-linux,~/.rubies/ruby-2.2.2/lib/ruby/site_ruby,~/.rubies/ruby-2.2.2/lib/ruby/vendor_ruby/2.2.0,~/.rubies/ruby-2.2.2/lib/ruby/vendor_ruby/2.2.0/x86_64-linux,~/.rubies/ruby-2.2.2/lib/ruby/vendor_ruby,~/.rubies/ruby-2.2.2/lib/ruby/2.2.0,~/.rubies/ruby-2.2.2/lib/ruby/2.2.0/x86_64-linux
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=.rb
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'ruby'
setlocal syntax=ruby
endif
setlocal tabstop=2
setlocal tags=~/petsFight/tags,~/petsFight/tmp/tags,./tags,./TAGS,tags,TAGS,~/.rubies/ruby-2.2.2/lib/ruby/site_ruby/2.2.0/tags,~/.rubies/ruby-2.2.2/lib/ruby/site_ruby/2.2.0/x86_64-linux/tags,~/.rubies/ruby-2.2.2/lib/ruby/site_ruby/tags,~/.rubies/ruby-2.2.2/lib/ruby/vendor_ruby/2.2.0/tags,~/.rubies/ruby-2.2.2/lib/ruby/vendor_ruby/2.2.0/x86_64-linux/tags,~/.rubies/ruby-2.2.2/lib/ruby/vendor_ruby/tags,~/.rubies/ruby-2.2.2/lib/ruby/2.2.0/tags,~/.rubies/ruby-2.2.2/lib/ruby/2.2.0/x86_64-linux/tags
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 16) / 33)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
