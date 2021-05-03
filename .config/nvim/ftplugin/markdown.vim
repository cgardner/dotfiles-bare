set spell spelllang=en_us
set conceallevel=2

augroup lexical
  call lexical#init()
augroup END

autocmd BufEnter markdown :MarkdownPreview

vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>
