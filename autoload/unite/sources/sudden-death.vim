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
function! unite#sources#sudden-death#define()
    return s:source
endfunction

" source
let s:source = {"name" : "sudden-death"}
function! s:source.change_candidates(args, context)
  let width = strlen(substitute(substitute(a:context.input, "[ -~｡-ﾟ]", 's', 'g'), "[^s]", 'mm', 'g')) / 2
  let top = '＿' . join(map(range(width + 2), '"人"'),'') . "＿\n"
  let content = '＞　' . a:context.input . "　＜\n"
  let bottom = '￣' . join(map(range(width + 2), '"Ｙ"'),'') . '￣'
  let list = [{
        \"word" : top . content . bottom, 
        \"is_multiline" : 1,
        \"kind" : "word"
        \}]
  return list 
endfunction
