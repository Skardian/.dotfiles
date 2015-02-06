" Vim syntax file
" Language:         CUP
" Maintainer:       Pepe Padial <jose.carlos.padial@gmail.com>
" Last Change:      06/02/2015

" Insipired form the official jflex syntax.vim

" Quit when a syntax file was already loaded	{{{
if exists("b:current_syntax")
	finish
endif
"}}}

" Include java syntax {{{
if version >= 600
	runtime! syntax/java.vim
	unlet b:current_syntax 
else
	so $VIMRUNTIME/syntax/java.vim
endif
"}}}

" syncing
"syn sync clear
"syn sync minlines=10
"syn sync match jflexSync grouphere jflexOptionReg "^%[a-z]"
"syn sync match jflexSync grouphere jflexRulesReg "^<"

" Keywords
syn match cupOption "^include"
syn match cupOption "^parser code"
syn match cupOption "^init with"
syn match cupOption "^scan with"
syn match cupOption "^terminal"
syn match cupOption "^non terminal"
syn match cupOption "^precedence"

" Regions
"syn region cupCodeInclude matchgroup=cupCodeIncludeMark  start="^{:" end="^}:" contains=@javaTop

" Higlight
hi link cupOption      Special
hi cupSectionSep guifg=yellow ctermfg=yellow guibg=blue ctermbg=blue gui=bold cterm=bold
hi link cupCodeIncludeMark cupSectionSep
