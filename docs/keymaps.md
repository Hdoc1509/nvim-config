# Keymaps

Used mapleader is `<space>` key.

## File handling

| Mapping     | Mode   | Description                     |
| ----------- | ------ | ------------------------------- |
| `<leader>w` | Normal | Save file                       |
| `<leader>W` | Normal | Save all files                  |
| `<leader>q` | Normal | Save and close file             |
| `<leader>Q` | Normal | Save all files and close Neovim |

## Tab handling

| Mapping      | Mode       | Description                |
| ------------ | ---------- | -------------------------- |
| `<leader>tq` | Normal     | Close current tab          |
| `<leader>to` | Normal     | Close all other tabs       |
| `<leader>th` | Normal [N] | Move tab to left           |
| `<leader>tH` | Normal     | Move tab to first position |
| `<leader>tl` | Normal [N] | Move tab to right          |
| `<leader>tL` | Normal     | Move tab to last position  |
| `<leader>tn` | Normal     | Open a new empty tab       |

**[N]: Mappings that can receive a count.**

## Tab navigation

| Mapping      | Mode       | Description             |
| ------------ | ---------- | ----------------------- |
| `<leader>tj` | Normal [N] | Go to previous tab(s)   |
| `<leader>tJ` | Normal     | Go to first tab         |
| `<leader>tk` | Normal [N] | Go to next tab(s)       |
| `<leader>tK` | Normal     | Go to last tab          |
| `<leader>tt` | Normal     | Go to last accessed tab |

**[N]: Mappings that can receive a count.**

## Tag jumping

| Mapping     | Mode   | Description                           |
| ----------- | ------ | ------------------------------------- |
| `<leader>[` | Normal | Jump to tag under cursor in a split   |
| `<leader>]` | Normal | Jump to tag under cursor in a new tab |

## Scrolling

| Mapping      | Mode            | Description                                 |
| ------------ | --------------- | ------------------------------------------- |
| `<leader>j`  | Normal / Visual | Scroll down 10 lines                        |
| `<leader>J`  | Normal / Visual | Scroll down 20 lines                        |
| `<leader>k`  | Normal / Visual | Scroll up 10 lines                          |
| `<leader>K`  | Normal / Visual | Scroll up 20 lines                          |
| `<leader>sb` | Normal          | Toggle scrollbind in windows of current tab |

## Split resize

| Mapping     | Mode   | Description                             |
| ----------- | ------ | --------------------------------------- |
| `<leader>>` | Normal | Resize current split 10 pixels to left  |
| `<leader><` | Normal | Resize current split 10 pixels to right |

## Split navigation

| Mapping | Mode   | Description          |
| ------- | ------ | -------------------- |
| `<c-h>` | Normal | Jump to left split   |
| `<c-j>` | Normal | Jump to bottom split |
| `<c-k>` | Normal | Jump to top split    |
| `<c-l>` | Normal | Jump to right split  |

## Split handling

| Mapping     | Mode   | Description                |
| ----------- | ------ | -------------------------- |
| `<leader>H` | Normal | Move split to previous tab |
| `<leader>L` | Normal | Move split to next tab     |

## Git

| Mapping       | Mode   | Description                               |
| ------------- | ------ | ----------------------------------------- |
| `<leader>gG`  | Normal | Open git summary window                   |
| `<leader>gV`  | Normal | Open git summary window in vertical split |
| `<leader>gT`  | Normal | Open git summary window in new tab        |
| `<leader>gaa` | Normal | Execute `git add --all`                   |
| `<leader>gp`  | Normal | Execute `git push`                        |
| `<leader>gl`  | Normal | Execute `git pull`                        |
| `<leader>gc`  | Normal | Execute `git commit`                      |
| `<leader>gC`  | Normal | Execute `git commit verbose`              |
| `<leader>gb`  | Normal | Open in browser at hosting provider       |
| `]c`          | Normal | Jump to next hunk                         |
| `[c`          | Normal | Jump to previous hunk                     |
| `<leader>hs`  | Normal | Stage/unstage hunk under cursor           |
| `<leader>hs`  | Visual | Stage/unstage selected hunk(s)            |
| `<leader>hr`  | Normal | Reset hunk under cursor                   |
| `<leader>hr`  | Visual | Reset selected hunk(s)                    |
| `<leader>hS`  | Normal | Stage buffer                              |
| `<leader>hR`  | Normal | Reset buffer                              |
| `<leader>hp`  | Normal | Preview hunk under cursor                 |
| `<leader>hP`  | Normal | Preview hunk under cursor but inline      |
| `<leader>hv`  | Normal | Select hunk under cursor                  |

## Word case

| Mapping | Mode            | Description                            |
| ------- | --------------- | -------------------------------------- |
| `<c-u>` | Normal / Insert | Toggle Uppercase of word under cursor  |
| `<c-t>` | Normal / Insert | Toggle Title Case of word under cursor |

## FZF

| Mapping     | Mode   | Description     |
| ----------- | ------ | --------------- |
| `<leader>e` | Normal | Search files    |
| `<leader>E` | Normal | Search buffers  |
| `<leader>?` | Normal | Search helptags |

## TODO comments

| Mapping      | Mode   | Description                       |
| ------------ | ------ | --------------------------------- |
| `]T]`        | Normal | Jump to any next todo comment     |
| `[T[`        | Normal | Jump to any previous todo comment |
| `]TF`        | Normal | Jump to next `FIX` comment        |
| `[TF`        | Normal | Jump to previous `FIX` comment    |
| `]TH`        | Normal | Jump to next `HACK` comment       |
| `[TH`        | Normal | Jump to previous `HACK` comment   |
| `]TW`        | Normal | Jump to next `WARN` comment       |
| `[TW`        | Normal | Jump to previous `WARN` comment   |
| `]TP`        | Normal | Jump to next `PERF` comment       |
| `[TP`        | Normal | Jump to previous `PERF` comment   |
| `]TN`        | Normal | Jump to next `NOTE` comment       |
| `[TN`        | Normal | Jump to previous `NOTE` comment   |
| `]TD`        | Normal | Jump to next `TODO` comment       |
| `[TD`        | Normal | Jump to previous `TODO` comment   |
| `]TS`        | Normal | Jump to next `TEST` comment       |
| `[TS`        | Normal | Jump to previous `TEST` comment   |
| `<leader>TL` | Normal | List all todo comments            |
| `<leader>TF` | Normal | List `FIX` comments               |
| `<leader>TH` | Normal | List `HACK` comments              |
| `<leader>TW` | Normal | List `WARN` comments              |
| `<leader>TP` | Normal | List `PERF` comments              |
| `<leader>TN` | Normal | List `NOTE` comments              |
| `<leader>TD` | Normal | List `TODO` comments              |
| `<leader>TS` | Normal | List `TEST` comments              |

## HTTP request

| Mapping      | Mode   | Description                       |
| ------------ | ------ | --------------------------------- |
| `<leader>rr` | Normal | Run HTTP request under the cursor |
| `<leader>rl` | Normal | Re-run the last HTTP request      |

## Markdown

| Mapping      | Mode        | Description            |
| ------------ | ----------- | ---------------------- |
| `<leader>mo` | Normal (\*) | Start Markdwon preview |
| `<leader>mc` | Normal (\*) | Stop Markdown preview  |

**(\*): Mappings that show a notify window.**

## Formatting

| Mapping     | Mode   | Description                         |
| ----------- | ------ | ----------------------------------- |
| `<leader>f` | Normal | Format current file                 |
| `<leader>f` | Visual | Format selected lines               |
| `<leader>F` | Normal | Format and save current file        |
| `<leader>F` | Visual | Format selected lines and save file |

## Blankline

| Mapping     | Mode       | Description                       |
| ----------- | ---------- | --------------------------------- |
| `<leader>o` | Normal [N] | Add blanklines below current line |
| `<leader>O` | Normal [N] | Add blanklines above current line |

**[N]: Mappings that can receive a count.**

## mini.files

| Mapping     | Mode   | Description                               |
| ----------- | ------ | ----------------------------------------- |
| `-`         | Normal | Open mini.files at current file path      |
| `<leader>-` | Normal | Open mini.files at last used path         |
| `<leader>_` | Normal | Open mini.files at root path of workspace |

### mini.files window

| Mapping | Mode       | Description            |
| ------- | ---------- | ---------------------- |
| `gj`    | Normal     | Split below (silent)   |
| `gJ`    | Normal     | Split below            |
| `gk`    | Normal     | Split above (silent)   |
| `gK`    | Normal     | Split above            |
| `gh`    | Normal     | Split left (silent)    |
| `gH`    | Normal     | Split left             |
| `gl`    | Normal     | Split right (silent)   |
| `gL`    | Normal     | Split right            |
| `gt`    | Normal     | New tab (silent)       |
| `gT`    | Normal [D] | New tab                |
| `gy`    | Normal     | Copy path to clipboard |

**(silent): Mappings that don't jump to file nor close the explorer.**

**[D]: Mappings that are disabled right now.**

### mini.files marks

| Mark | Description               |
| ---- | ------------------------- |
| `c`  | Neovim config             |
| `w`  | Current working directory |
| `~`  | Home directory            |

## Zen mode

| Mapping     | Mode   | Description     |
| ----------- | ------ | --------------- |
| `<leader>z` | Normal | Toggle Zen Mode |

## Replace matching text

| Mapping     | Mode   | Description                           |
| ----------- | ------ | ------------------------------------- |
| `<leader>r` | Visual | Replace selected text in current file |
| `<leader>R` | Visual | Replace selected text in all files    |

## Markdown-only

| Mapping       | Mode        | Description                                                         |
| ------------- | ----------- | ------------------------------------------------------------------- |
| `<leader>sat` | Visual Line | Create a table from shell aliases definitions and run `FormatWrite` |

## Quickfix window

| Mapping | Mode   | Description                           |
| ------- | ------ | ------------------------------------- |
| `e`     | Normal | Select item and close quickfix window |
| `gt`    | Normal | Open item in new tab (silent)         |
| `gT`    | Normal | Open item in new tab                  |
| `gs`    | Normal | Open item in new split (silent)       |
| `gS`    | Normal | Open item in new split                |

**(silent): Mappings that don't jump to file nor close the quickfix window.**

## Misc

| Mapping       | Mode            | Description                                |
| ------------- | --------------- | ------------------------------------------ |
| `<leader>chh` | Normal          | Run `:checkhealth`                         |
| `<c-d>`       | Normal / Insert | Remove current line                        |
| `<leader>ya`  | Normal          | Copy all text of current file to clipboard |
| `<leader>/`   | Normal          | Clear search highlighting                  |
| `<F3>`        | Insert / Normal | Toggle spell checking                      |
| `<leader>x`   | Normal          | Source current file                        |
| `H`           | Normal          | Preview folded lines                       |

## Abbreviations

| Abbreviation | Mode    | Expansion     |
| ------------ | ------- | ------------- |
| vh           | Command | vertical help |
| th           | Command | tab help      |

## Temporary disabled

### Supermaven

| Mapping | Mode   | Description             |
| ------- | ------ | ----------------------- |
| `<c-a>` | Insert | Insert suggestion       |
| `<c-j>` | Insert | Accept word suggestion  |
| `<c-q>` | Insert | Clear/Cancel suggestion |
