syn clear
syn region 	spimComment start="#" end="^" contains=spimComment


syn match	spimInt			"\<[0-9]\+\>"
syn match	spimInt			"\<-[0-9]\+\>"
syn match	spimReal		"\<[0-9]*\(\.[0-9]\+\)\>"
syn match	spimReal		"\<-[0-9]*\(\.[0-9]\+\)\>"
syn keyword	spimFunction 	add sub mul div rem andi muli
syn keyword spimFunction	and or xor nor addi ori xori andi move not
syn keyword	spimFunction 	lw lb lbu ll la sw sb sbu li sll sla srl sra liu
syn keyword	spimConditional beq bgt bge blt ble bne 
syn keyword spimConditional bltz bgez blez bgtz beqz bnez
syn keyword	spimConditional j jr jal
syn keyword spimIdentifier  word asciiz eq
syn match 	spimIdentifier	"\$t[0-9]"
syn match 	spimIdentifier	"\$s[0-7]"
syn match 	spimReservedReg	"\$v[01]"
syn match 	spimReservedReg	"\$a[0-3]"
syn match 	spimReservedReg	"\$r0" 
syn match 	spimReservedReg	"\$at" 
syn match 	spimReservedReg	"\$gp" 
syn match 	spimReservedReg	"\$sp" 
syn match 	spimReservedReg	"\$ra"
syn match	spimLabel		"^[A-Za-z0-9_]\+:"
syn keyword	spimDone		done
syn keyword spimDeclSection	data text

hi link	spimInt				Number
hi link spimReal			Float
hi link	spimType			Type
hi link spimConditional		Conditional
hi link spimFunction		Function
hi link spimIdentifier		Identifier
hi link spimReservedReg		Special
hi link spimLabel			Operator
hi link spimDone			Todo
hi link spimDeclSection		Todo
hi link spimComment			Comment
