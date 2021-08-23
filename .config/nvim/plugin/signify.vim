set updatetime=100

let g:signify_sign_add = "+"
let g:signify_sign_delete = "_"
let g:signify_sign_change = "~"
let g:signify_sign_delete_first_line = '‾'

" Turn off numbers
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1

" Jump through hunks of diffs
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
