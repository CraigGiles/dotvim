set makeprg=build.bat

" error message formats

" -- Microsoft MSBuild
set errorformat+=\\\ %#%f(%l\\\,%c):\ %m

" -- Microsoft compiler: cl.exe
set errorformat+=\\\ %#%f(%l)\ :\ %#%t%[A-z]%#\ %m

" -- Microsoft HLSL compiler: fxc.exe
" set errorformat+=\\\ %#%f(%l\\\,%c-%*[0-9]):\ %#%t%[A-z]%#\ %m
set errorformat+=\\\ %#%f:%l\\,%c:\ %t%[A-z]%#:\ %m

