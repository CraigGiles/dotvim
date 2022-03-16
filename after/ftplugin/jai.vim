compiler jai

" Basic items

" 	%f		file name (finds a string)
" 	%o		module name (finds a string)
" 	%l		line number (finds a number)
" 	%e		end line number (finds a number)
" 	%c		column number (finds a number representing character
" 			column of the error, byte index, a <tab> is 1
" 			character column)
" 	%v		virtual column number (finds a number representing
" 			screen column of the error (1 <tab> == 8 screen
" 			columns))
" 	%k		end column number (finds a number representing
" 			the character column of the error, byte index, or a
" 			number representing screen end column of the error if
" 			it's used with %v)
" 	%t		error type (finds a single character):
" 			    e - error message
" 			    w - warning message
" 			    i - info message
" 			    n - note message
" 	%n		error number (finds a number)
" 	%m		error message (finds a string)
" 	%r		matches the "rest" of a single-line file message %O/P/Q
" 	%p		pointer line (finds a sequence of '-', '.', ' ' or
" 			tabs and uses the length for the column number)
" 	%*{conv}	any scanf non-assignable conversion
" 	%%		the single '%' character
" 	%s		search text (finds a string)
