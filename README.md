# yankmatches.vim

This is my modified version of Damian Conway's [yankmatches][] vim plugin.

The main reason for this repo is to make it easier to use with a vim plugin
manager, and to add or modify code as needed.

## Installation

Install with your favourite plugin manager, or add the plugin folder to your
`.vim/` folder.

## Usage

To use this plugin, add the following lines (or some variant of them) to your
`.vimrc` file (or, add a subset of these lines if you do not want all of the
features).

```vimscript
nnoremap <silent> dm  :     call ForAllMatches('delete', {})<CR>
nnoremap <silent> dM  :     call ForAllMatches('delete', {'inverse':1})<CR>
nnoremap <silent> ym  :     call ForAllMatches('yank',   {})<CR>
nnoremap <silent> yM  :     call ForAllMatches('yank',   {'inverse':1})<CR>
vnoremap <silent> Dm  :<C-U>call ForAllMatches('delete', {'visual':1})<CR>
vnoremap <silent> DM  :<C-U>call ForAllMatches('delete', {'visual':1, 'inverse':1})<CR>
vnoremap <silent> Ym  :<C-U>call ForAllMatches('yank',   {'visual':1})<CR>
vnoremap <silent> YM  :<C-U>call ForAllMatches('yank',   {'visual':1, 'inverse':1})<CR>
```

### Explanation of the Above Mappings

It is important to first note that these commands operate on search matches. So,
before you issue these commands you must have done a search in vim.

`dm`: Will delete all lines in the current file that contain a match for your
search. It will then save the deleted lines into the register that is defined by
your `clipboard` setting, or it will revert to the default register `"` (which
is often used by a normal `y`, `d`, or `p` command).

`dM`: Will delete all lines in the current file that **DO NOT** contain a match for
your search. It will then save the deleted lines into the register that is
defined by your `clipboard` setting, or it will revert to the default register
`"` (which is often used by a normal `y`, `d`, or `p` command).

`ym`: is the same as `dm` except that it yanks instead of deletes.

`yM`: is the same as `dM` except that it yanks instead of deletes.

All the visual mappings work the same, except that they will only yank or delete
from the visually selected text instead of the whole file.
[yankmatches]: https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/blob/master/plugin/yankmatches.vim
