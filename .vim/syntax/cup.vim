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

syn match cupRegion "^action code"
syn match cupRegion "^parser code"
syn match cupRegion "^init with"
syn match cupRegion "^scan with"

syn match cupKeyword "^terminal"
syn match cupKeyword "^non terminal"
syn match cupKeyword "^precedence left"
syn match cupKeyword "^precedence right"

syn match cupWordWithDots "\w:"

syn match cupCodeSeparator "{:"
syn match cupCodeSeparator ":}"

hi link cupKeyword Special
hi link cupRegion Special
hi link cupWordWithDots Special
hi link cupCodeSeparator Operator


