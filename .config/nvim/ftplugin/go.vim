set foldmethod=syntax
 
autocmd BufWritePre *.go :call CocAction('organizeImport')

