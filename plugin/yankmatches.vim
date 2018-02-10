" Vim global plugin for yanking or deleting all lines with a match
" Maintainer: Steven Hall
" Original Creator: Damian Conway
" License: This file is placed in the public domain.

if exists("loaded_delete_matches")
    finish
endif
let loaded_delete_matches = 1

" Preserve external compatibility options, then enable full vim compatibility...
let s:save_cpo = &cpo
set cpo&vim


function! ForAllMatches (command, options)
    " Remember where we parked...
    let orig_pos = getpos('.')

    " Work out the implied range of lines to consider...
    let in_visual = get(a:options, 'visual', 0)
    let start_line = in_visual ? getpos("'<'")[1] : 1
    let end_line   = in_visual ? getpos("'>'")[1] : line('$')

    " Are we inverting the selection???
    let inverted = get(a:options, 'inverse', 0)

    " Are we modifying the buffer???
    let deleting = a:command == 'delete'

    " Honour smartcase (which :lvimgrep doesn't, by default)
    let sensitive = &ignorecase && &smartcase && @/ =~ '\u' ? '\C' : ''

    " Identify the lines to be operated on...
    exec 'silent lvimgrep /' . sensitive . @/ . '/j %'
    let matched_line_nums
    \ = reverse(filter(map(getloclist(0), 'v:val.lnum'), 'start_line <= v:val && v:val <= end_line'))

    " Invert the list of lines, if requested...
    if inverted
        let inverted_line_nums = range(start_line, end_line)
        for line_num in matched_line_nums
            call remove(inverted_line_nums, line_num-1)
        endfor
        let matched_line_nums = reverse(inverted_line_nums)
    endif

    " Filter the original lines...
    let yanked = ""
    for line_num in matched_line_nums
        " Remember yanks or deletions...
        let yanked = getline(line_num) . "\n" . yanked

        " Delete buffer lines if necessary...
        if deleting
            exec line_num . 'delete'
        endif
    endfor

    " Make yanked lines available for putting...
    let @" = yanked

    " Return to original position...
    call setpos('.', orig_pos)

    " Report results...
    redraw
    let match_count = len(matched_line_nums)
    if match_count == 0
        unsilent echo 'Nothing to ' . a:command . ' (no matches found)'
    elseif deleting
        unsilent echo match_count . (match_count > 1 ? ' fewer lines' : ' less line')
    else
        unsilent echo match_count . ' line' . (match_count > 1 ? 's' : '') . ' yanked'
    endif
endfunction
