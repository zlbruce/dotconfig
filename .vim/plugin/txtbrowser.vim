" txtbrowser.vim:	Utilities to browser plain text file.
" Version:		1.1.1
" Maintainer:		ypguo<guoyoooping@163.com>
" Last modified:	2010.1.23
" License:		This script is released under the Vim License.

" ****************** Do not modify after this line ************************

" Line continuation used here
let s:cpo_save = &cpo
set cpo&vim

if exists("g:loaded_txtbrowser")
	finish "stop loading the script
endif
let g:loaded_txtbrowser=1


" Define the user commands to manage the taglist window
command! -nargs=0 -bar TxtBrowseWord call TxtbrowserLookupWords("<cword>")
command! -nargs=0 -bar TxtBrowseUrl call TxtbrowserOpenUrl(getline("."))
"command! -nargs=0 -bar TxtBrowseSearch call TxtbrowserSearchWord(getline("."))
:map <Leader>f :call TxtbrowserLookupWords("<cword>")<CR>
:map <Leader>g :call TxtbrowserOpenUrl(getline("."))<CR>

" User defined dict url
if exists('g:txtbrowser_dict_url')
let s:txtbrowser_dict_url = g:txtbrowser_dict_url
else
let s:txtbrowser_dict_url = 'http://www.google.cn/dictionary?aq=f&langpair=en|zh-CN&q=text&hl=zh-CN'
"let s:txtbrowser_dict_url = 'http://dict.cn/txtbrowser'
endif

" variable myscript_indent
"if !exists("myscript_indent")
"	let s:myscript_indent = 4
"else
"	let s:myscript_indent = myscript_indent
"	unlet myscript_indent
"endif

" Function to open the url gvien.
" @line: input line that need to open.
" return: 0 if sucess, -1 if error.
function! s:TxtbrowserBrowser (url)
	if (has("mac"))
		exec "!open \"" . a:url . "\""
	elseif (has("win32") || has("win32unix"))
		exec ':silent !cmd /q /c start "\""dummy title"\"" ' . "\"" . a:url . "\""
	elseif (has("unix"))
		exec ':silent !firefox ' . "\"" . a:url . "\" & "
	endif
	return 0
endfunction

" Function to parse the line gvien.
" @line: input line that need to open.
" return: no.
function! TxtbrowserOpenUrl(line)
	" line
	"let url = matchstr(getline("."), '[filehtp]*:\/\/[^>,;]*')
	let url = matchstr(a:line, "http:\/\/[^ ]*")
	:if url==""
	let url = matchstr(a:line, "ftp:\/\/[^ ]*")
	:endif
	:if url==""
	let url = matchstr(a:line, "file:\/\/[^,;>]*")
	:endif
	:if url==""
	let url = matchstr(a:line, "mailto:[^ ]*")
	:endif
	:if url==""
	let url = matchstr(a:line, "www\.[^ ]*")
	:endif
	:if url==""
	let url = matchstr(a:line, "[^,:\> ]*@[^ ,:]*")
	:if url!=""
	:let url = "mailto:" . url
	:endif
	:endif
	let url = escape (url, "\"#;%")

	if url == ""
		echo "No url found in the cursor."
		return -1
	endif

	"echo "Opening " . url
	call s:TxtbrowserBrowser(url)
endfunction

" Function to lookup the words.
" @words: input line that need to open.
" return: no.
function! TxtbrowserLookupWords(words)
	"call s:TxtbrowserBrowser("http://www.google.cn/dictionary?langpair=en\|zh-CN&q=" . a:words . "&hl=zh-CN&aq=f")
	":map <Leader>f : silent !stardict "<cword>" & <CR>
	call s:TxtbrowserBrowser(substitute(s:txtbrowser_dict_url, "text", a:words, "g"))
endfunction

" restore 'cpo'
let &cpo = s:cpo_save
unlet s:cpo_save

