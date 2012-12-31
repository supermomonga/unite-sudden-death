" sudden-death source for unite.vim
" Version:     0.0.1
" Last Change: 27 Dec 2012
" Author:      momonga
" Licence:     The MIT License {{{
"     Permission is hereby granted, free of charge, to any person obtaining a copy
"     of this software and associated documentation files (the "Software"), to deal
"     in the Software without restriction, including without limitation the rights
"     to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
"     copies of the Software, and to permit persons to whom the Software is
"     furnished to do so, subject to the following conditions:
"
"     The above copyright notice and this permission notice shall be included in
"     all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
"     IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
"     FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
"     AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
"     LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
"     OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
"     THE SOFTWARE.
" }}}

" define source
function! unite#sources#suddendeath#define()
  return s:source
endfunction

" source
let s:source = {"name" : "sudden-death"}

" 渡された文字列の横幅が全角文字で何文字相当かを返す
function! s:str_to_mb_width(str)
  return strlen(substitute(substitute(a:str, "[ -~｡-ﾟ]", 's', 'g'), "[^s]", 'mm', 'g')) / 2
endfunction

" 渡された文字列を突然の死なフキダシにして返す
function! s:sudden_death(str)
  let width = s:str_to_mb_width(a:str) + 2
  let top = '＿' . join(map(range(width), '"人"'),'') . '＿'
  let content = '＞　' . a:str . '　＜'
  let bottom = '￣' . join(map(range(width), '"Ｙ"'),'') . '￣'
  return join([top, content, bottom], "\n")
endfunction

" sudden-death
function! s:source.change_candidates(args, context)
  let list = [{
        \"word" : s:sudden_death(a:context.input)
        \"is_multiline" : 1,
        \"kind" : "word"
        \}]
  return list 
endfunction
