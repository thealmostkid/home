syn clear

syn case match

set iskeyword=@,48-57,_

syn region	mlComment	start="(\*" end="\*)" contains=mlComment

syn match	mlInt		"[0-9]\+"
syn match	mlReal		"[0-9]\+\(\.[0-9]\+\)"
syn match	mlReal		"[0-9]\+\(\.[0-9]\+\)\=\([Ee]\~\=[0-9]\+\)" contains=mlRealExponent
syn match	mlRealExponent	contained "[Ee]"

syn keyword	mlBoolean	true false
syn region	mlString	start=+"+  skip=+\\"+  end=+"+
syn match	mlChar		+#"[^\\]"+
syn match	mlChar		+#"\\."+

"syn match	mlDelimiter	"[()\[\]]"

syn match	mlIdent		"[A-Za-z][A-Za-z0-9_']*"
syn match	mlIdent		"[!#$%&*-/:;<=>?@\\^`|~]\+"

syn match	mlOperator	"\([+\-*/@!:\~|]\|::\|->\|=>\|:>\)[^!#$%&*-/:;<=>?@\\^`|~]"me=e-1
syn match	mlOperator	"\([+\-*/@!:\~|]\|::\|->\|=>\|:>\)$"
syn keyword	mlOperator	o andalso orelse div mod hd tl
syn keyword	mlException	exception raise handle
syn keyword	mlConditional	if then else case of
syn keyword	mlKeyword	fun fn end infix infixr val local let in and 
syn keyword	mlKeyword	rec with match 
syn keyword	mlKeyword	functor signature sig as
syn keyword	mlStructure	structure struct
syn keyword	mlTypedef	datatype type eqtype
syn keyword	mlType		int char string real
syn keyword	mlTypeCon	list ref option

hi link mlInt		Number
hi link mlReal		Float
hi link mlRealExponent	SpecialChar
hi link mlBoolean	Boolean
hi link mlString	String
hi link mlChar		Character
"hi link mlDelimiter	Delimiter
hi link mlSymbolIdent	Special
hi link mlAlphaIdent	Identifier
hi link mlSpecial	Special
hi link mlOperator	Operator
hi link mlException	Exception
hi link mlConditional	Conditional
hi link mlKeyword	Keyword
hi link mlStructure	Structure
hi link mlTypedef	Typedef
hi link mlType		Type
hi link mlTypeCon	Typedef
hi link mlComment	Comment

"hi clear Identifier

set tabstop=2

