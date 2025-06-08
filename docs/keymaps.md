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
| `<leader>gd`  | Normal | Execute `git diff`                        |
| `<leader>gp`  | Normal | Execute `git push`                        |
| `<leader>gl`  | Normal | Execute `git pull`                        |
| `<leader>gs`  | Normal | Execute `git status`                      |
| `<leader>gc`  | Normal | Execute `git commit`                      |
| `<leader>gb`  | Normal | Open in browser at hosting provider       |
| `]c`          | Normal | Jump to next hunk                         |
| `[c`          | Normal | Jump to previous hunk                     |
| `<leader>hs`  | Normal | Stage hunk under cursor                   |
| `<leader>hs`  | Visual | Stage selected hunk(s)                    |
| `<leader>hr`  | Normal | Reset hunk under cursor                   |
| `<leader>hr`  | Visual | Reset selected hunk(s)                    |
| `<leader>hS`  | Normal | Stage buffer                              |
| `<leader>hu`  | Normal | Unstage hunk under cursor                 |
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

| Mapping     | Mode   | Description    |
| ----------- | ------ | -------------- |
| `<leader>e` | Normal | Search files   |
| `<leader>E` | Normal | Search buffers |

## TODO comments

| Mapping | Mode   | Description                           |
| ------- | ------ | ------------------------------------- |
| `]T`    | Normal | Jump to next (any) `TODO` comment     |
| `[T`    | Normal | Jump to previous (any) `TODO` comment |

## HTTP request

| Mapping      | Mode   | Description                       |
| ------------ | ------ | --------------------------------- |
| `<leader>rr` | Normal | Run HTTP request under the cursor |
| `<leader>rl` | Normal | Re-run the last HTTP request      |

## Markdown

| Mapping      | Mode        | Description              |
| ------------ | ----------- | ------------------------ |
| `<leader>mo` | Normal (\*) | Start Markdwon preview   |
| `<leader>mc` | Normal (\*) | Stop Markdown preview    |
| `<leader>mt` | Normal      | Toggle Markdown renderer |

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

## File explorer

| Mapping     | Mode   | Description                               |
| ----------- | ------ | ----------------------------------------- |
| `-`         | Normal | Open mini.files at current file path      |
| `<leader>-` | Normal | Open mini.files at last used path         |
| `<leader>_` | Normal | Open mini.files at root path of workspace |

## Zen mode

| Mapping     | Mode   | Description     |
| ----------- | ------ | --------------- |
| `<leader>z` | Normal | Toggle Zen Mode |

## Replace matching text

| Mapping     | Mode   | Description                           |
| ----------- | ------ | ------------------------------------- |
| `<leader>r` | Visual | Replace selected text in current file |
| `<leader>R` | Visual | Replace selected text in all files    |

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

## Nvim-qt

| Mapping      | Mode   | Description        |
| ------------ | ------ | ------------------ |
| `<leader>fs` | Normal | Enable Fullscreen  |
| `<leader>Fs` | Normal | Disable Fullscreen |

## Neovide

| Mapping | Mode   | Description       |
| ------- | ------ | ----------------- |
| `<F11>` | Normal | Toggle Fullscreen |

## Temporary disabled

### Supermaven

| Mapping | Mode   | Description             |
| ------- | ------ | ----------------------- |
| `<c-a>` | Insert | Insert suggestion       |
| `<c-j>` | Insert | Accept word suggestion  |
| `<c-q>` | Insert | Clear/Cancel suggestion |
