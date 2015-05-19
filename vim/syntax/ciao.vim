" Vim syntax file
" Language:    Ciao
" Maintainers: Avani Wildani (avani@cs.unm.edu)
" Last Change: Nov 2006
" URL:	       http://www.cs.hmc.edu/~avani/ciao/ciao.vim

" This is closely based on the Prolog syntax file.  Perhaps too closely..."
" There are two sets of highlighting in here:
" If the "ciao_highlighting_clean" variable exists, it is rather sparse.
" Otherwise you get more highlighting.

" There are several sets of highlighting here to represent the major types of
" syntax Ciao uses.  "bf" is breadth-first, "funct" corresponds to the
" functional package

"Do I need to case out Vim7?  Can I assume they have Vim7?"

" Quit when a syntax file was already loaded
if version < 600
   syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Ciao is always case sensitive.
syn case match

" Very simple highlighting for comments, clause heads and
" character codes.  It respects ciao strings and atoms.

syn keyword ciaoKeyword   call    is      stream_property
syn region   ciaoCComment	start=+/\*+ end=+\*/+
syn match    ciaoComment	+%.*+

syn keyword  ciaoSKeyword	module meta_predicate multifile dynamic assert
syn keyword  ciaoSKeyword	use_package use_module
syn match    ciaoCharCode	+0'\\\=.+
syn region   ciaoString	start=+"+ skip=+\\"+ end=+"+
"syn region   ciaoAtom		start=+'+ skip=+\\'+ end=+'+
"syn region   ciaoClauseHead   start=+^[a-z][^(]*(+ skip=+\.[^			    ]+ end=+:-\|\.$\|\.[	]\|-->+
"syn region   ciaoClauseHead   start=+^[a-z]+ end=+(+
syn match   ciaoClauseHead   +[a-z0-9_]*(+
syn match   ciaoClauseHead  ")"
syn match   ciaoClauseHead   +[a-z0-9_]*\[+
syn match   ciaoClauseHead  "\]"

"I want to set off lpdoc instructions"
syn match   ciaoLpDComment +comment.*+
syn match   ciaoLpDComment +version_number.*+
syn match   ciaoLpDComment +ymd_date.*+
syn match   ciaoLpDComment +time_struct.*+
syn match   ciaoLpDComment +version_maintenance_type.*+

  " some keywords
  " some common predicates are also highlighted as keywords
  " is there a better solution?
  syn keyword ciaoKeyword   abolish current_output  peek_code
  syn keyword ciaoKeyword   append  current_predicate       put_byte
  syn keyword ciaoKeyword   arg     current_ciao_flag     put_char
  syn keyword ciaoKeyword   asserta fail    put_code
  syn keyword ciaoKeyword   assertz findall read
  syn keyword ciaoKeyword   at_end_of_stream	      float   read_term
  syn keyword ciaoKeyword   atom    flush_output    repeat
  syn keyword ciaoKeyword   atom_chars      functor retract
  syn keyword ciaoKeyword   atom_codes      get_byte	      set_input
  syn keyword ciaoKeyword   atom_concat     get_char	      set_output
  syn keyword ciaoKeyword   atom_length     get_code	      set_ciao_flag
  syn keyword ciaoKeyword   atomic  halt    set_stream_position
  syn keyword ciaoKeyword   bagof   integer setof
  syn keyword ciaoKeyword   call    is      stream_property
  syn keyword ciaoKeyword   catch   nl      sub_atom
  syn keyword ciaoKeyword   char_code       nonvar  throw
  syn keyword ciaoKeyword   char_conversion number  true
  syn keyword ciaoKeyword   clause  number_chars    unify_with_occurs_check
  syn keyword ciaoKeyword   close   number_codes    var
  syn keyword ciaoKeyword   compound	      once    write
  syn keyword ciaoKeyword   copy_term       op      write_canonical
  syn keyword ciaoKeyword   current_char_conversion open    write_term
  syn keyword ciaoKeyword   current_input   peek_byte       writeq
  syn keyword ciaoKeyword   current_op      peek_char library
  
  syn match   ciaoOperator "=\|=\\=\|<\-\|=:=\|:-\|\\==\|=<\|==\|>=\|\\=\|\\+\|<\|>\|=i\|\-\->"
  syn match   ciaoMath  "\\+\|\-\|\\\|\*"
  syn match   ciaoAsIs     "===\|\\===\|<=\|=>"

  syn match   ciaoNumber	      "\<[0123456789]*\>"
  syn match   ciaoCommentError      "\*/"
  syn match   ciaoSpecialCharacter  ";"
  syn match   ciaoSpecialCharacter  "!"
  syn match   ciaoSpecialCharacter  "\."
  syn match   ciaoSpecialCharacter  "}"
  syn match   ciaoSpecialCharacter  "{"
  syn match   ciaoSpecialCharacter  "|"
  syn match   ciaoSpecialCharacter  "\."
  
  syn match   ciaoQuestion	      "?-.*\."	contains=ciaoNumber
  
  syn match   ciaoTodo  "FIXME"
  syn match   ciaoTodo  "TODO"

syn sync maxlines=50


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
"if version >= 508 || !exists("did_ciao_syn_inits")
"  if version < 508
"let did_ciao_syn_inits = 1
command -nargs=+ HiLink hi def link <args>
"  else
"    command -nargs=+ HiLink hi def link <args>
"  endif

  " The default highlighting.
  HiLink ciaoComment		Comment
  HiLink ciaoCComment		Comment
  HiLink ciaoTodo   Todo
  HiLink ciaoCharCode		Special
  HiLink ciaoKeyword	Keyword
  HiLink ciaoSKeyword Special
  HiLink ciaoClauseHead	Constant
  HiLink ciaoQuestion	PreProc
  HiLink ciaoSpecialCharacter Special
  HiLink ciaoNumber		Number
  HiLink ciaoMath Operator
  HiLink ciaoAsIs		Normal
  HiLink ciaoCommentError	Error
  HiLink ciaoAtom		Constant
  HiLink ciaoString		String
  HiLink ciaoOperator	Operator
  HiLink ciaoLpDComment Comment
"I'd like to make it different than normal comments, but I'm not sure how yet"

  delcommand HiLink
"endif

let b:current_syntax = "ciao"

