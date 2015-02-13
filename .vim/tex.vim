syn region texMathZone	start="\\begin{align}"	end="\\end{align}"	keepend contains=texTypeStyle,texTypeSize,texStatement,texDelimiter,texComment,texLength,texMathMatcher,texMathParen,texMathOper,texError,TexMathDelim,texComment,texRefZone
syn region texMathZone	start="\\begin{align\*}"	end="\\end{align\*}"	keepend contains=texTypeStyle,texTypeSize,texStatement,texDelimiter,texComment,texLength,texMathMatcher,texMathParen,texMathOper,texError,TexMathDelim,texComment,texRefZone
abc
ab \B \begin
ab \E \end
