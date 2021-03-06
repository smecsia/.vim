" Vim syntax file
" Language:     hl7
" Maintainer:   niquola 
" Filenames:    *.hl7

"if exists("b:current_syntax")
  "finish
"endif

syn match comment '|'
syn match string '\^'
syn match Special  '\r[A-Z0-9]*'
syn match Special  '\\r[A-Z0-9]*'
syn match Special  'MSH'
syn match Special  '^[0-9A-Z][0-9A-Z][0-9A-Z]|'
syn match Special  '|\\r[0-9A-Z][0-9A-Z][0-9A-Z]|'
syn region  Comment     start="^--" end="$"
syn match Identifier '|ADT^A[0-1][0-9]|'
syn match Search '|ORM^O01|'
syn match SpellBad '|ORU^R01|'
syn match Identifier   '|ORU^[^|]|'
syn match ModeMsg  '|200[0-9]\{11,13}'
