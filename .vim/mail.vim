set comments=sr:/*,mb:*,el:*/,://,b:#,:%,:XCOMM,n:>,fb:-,n::
set textwidth=72

"include colon as a valid mail quoting letter, damnit!
syn match       mailQuoted1     "^\([A-Za-z]\+>\|[]:|}>]\).*$"
syn match       mailQuoted2     "^\(\([A-Za-z]\+>\|[]:|}>]\)[ \t]*\)\{2}.*$"
syn match       mailQuoted3     "^\(\([A-Za-z]\+>\|[]:|}>]\)[ \t]*\)\{3}.*$"
syn match       mailQuoted4     "^\(\([A-Za-z]\+>\|[]:|}>]\)[ \t]*\)\{4}.*$"
syn match       mailQuoted5     "^\(\([A-Za-z]\+>\|[]:|}>]\)[ \t]*\)\{5}.*$"
syn match       mailQuoted6     "^\(\([A-Za-z]\+>\|[]:|}>]\)[ \t]*\)\{6}.*$"

hi link mailQuoted1 Statement
hi link mailQuoted3 Statement
hi link mailQuoted5 Statement
