au BufRead,BufNewFile *.json	setf javascript
au BufWritePost *.json call JSLint()
