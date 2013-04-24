syn match error "[0-9,.]*\sERROR"
syn match warn "[0-9,.]*\sWARN"
syn match debug "[0-9,.,:,\s,-]*\sDEBUG"
syn match info "[0-9,.]*\sINFO"

hi error ctermfg=Red
hi warn ctermfg=Yellow
hi debug ctermfg=Blue
hi info ctermfg=Green

let b:current_syntax = "log"
