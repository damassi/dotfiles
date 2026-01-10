# NeoVim Keybindings

Leader key: `,`

Configuration:

- General keymaps: `keymaps.lua`
- Plugin-specific keymaps: colocated in `plugins.lua`

### General

| Key           | Action                            | iTerm      |
| ------------- | --------------------------------- | ---------- |
| `jk`          | Exit insert mode                  |            |
| `Enter`       | Clear search highlight            |            |
| `Ctrl+D`      | Page down (Ctrl+F is tmux prefix) |            |
| `Cmd+S`       | Save file                         | Hex `0x13` |
| `Cmd+C`       | Copy (visual mode)                | Escape Sequence `c` |
| `Cmd+N`       | New file                          | Hex `0x0e` |
| `Cmd+Z`       | Undo                              | Hex `0x1a` |
| `Cmd+Y`       | Redo                              | Hex `0x19` |
| `Option+Down` | Move line down                    |            |
| `Option+Up`   | Move line up                      |            |
| `Cmd+/`       | Toggle comment                    | Hex `0x1e` |
| `,nf`         | New file                          |            |
| `,a`          | Toggle focus file tree / code     |            |
| `,n`          | Toggle file tree                  |            |
| `,r`          | Reveal file in tree               |            |
| `,b`          | Show buffers in tree              |            |

### Buffer Navigation

| Key      | Action                   | iTerm      |
| -------- | ------------------------ | ---------- |
| `Ctrl+h` | Previous buffer          |            |
| `Ctrl+l` | Next buffer              |            |
| `,1-9`   | Jump to buffer by number |            |
| `,x`     | Close buffer             |            |
| `Cmd+w`  | Close buffer             | Hex `0x17` |

### Window/Split Navigation

| Key              | Action                  |
| ---------------- | ----------------------- |
| `Ctrl+w h/j/k/l` | Navigate between splits |
| `Ctrl+w v`       | Vertical split          |
| `Ctrl+w s`       | Horizontal split        |

### File Search

[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) / [grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim)

| Key           | Action                      | iTerm      |
| ------------- | --------------------------- | ---------- |
| `Ctrl+p`      | Find files                  |            |
| `Cmd+Shift+F` | Global find and replace     | Hex `0x1f` |
| `,fr`         | Global find and replace     |            |
| `,fg`         | Live grep (search in files) |            |

In grug-far buffer (localleader = `\`):

| Key  | Action                |
| ---- | --------------------- |
| `\r` | Replace all           |
| `\s` | Sync all locations    |
| `\l` | Sync current line     |
| `\q` | Send to quickfix list |
| `\c` | Close                 |

### Find in File

[searchbox.nvim](https://github.com/VonHeikemen/searchbox.nvim)

| Key   | Action                      |
| ----- | --------------------------- |
| `/`   | Search in file              |
| `,sr` | Search and replace in file  |

In searchbox:

| Key      | Action         |
| -------- | -------------- |
| `Enter`  | Submit         |
| `Esc`    | Close          |
| `Ctrl+g` | Previous match |
| `Ctrl+l` | Next match     |

### Jump

[flash.nvim](https://github.com/folke/flash.nvim)

| Key | Action                              |
| --- | ----------------------------------- |
| `s` | Flash jump (type chars to jump)     |
| `S` | Flash treesitter (select by syntax) |

### Tab (Workspace) Navigation

| Key   | Action       |
| ----- | ------------ |
| `,tn` | New tab      |
| `,tc` | Close tab    |
| `,[`  | Previous tab |
| `,]`  | Next tab     |

### LSP

[lspsaga.nvim](https://github.com/nvimdev/lspsaga.nvim)

| Key            | Action                           |
| -------------- | -------------------------------- |
| `Cmd+Click`    | Go to definition                 |
| `Shift+Click`  | Show line diagnostics            |
| `K`            | Hover documentation              |
| `gd`           | Go to definition                 |
| `gD`           | Peek definition (inline preview) |
| `gr`           | Find references                  |
| `gi`           | Find implementations             |
| `gt`           | Go to type definition            |
| `,rn`          | Rename symbol                    |
| `,ca`          | Code actions                     |
| `,f`           | Format file (prettier)           |
| `,o`           | Toggle outline (symbols sidebar) |

In lspsaga finder (`gr`, `gi`):

| Key | Action                   |
| --- | ------------------------ |
| `o` | Open file                |
| `s` | Open in horizontal split |
| `v` | Open in vertical split   |
| `q` | Close finder             |

### Diagnostics / Problems Pane

[trouble.nvim](https://github.com/folke/trouble.nvim)

| Key     | Action                         | iTerm      |
| ------- | ------------------------------ | ---------- |
| `Cmd+J` | Toggle problems pane           | Hex `0x0a` |
| `,xx`   | Toggle problems pane           |            |
| `,xd`   | Problems for current file only |            |
| `[d`    | Previous diagnostic            |            |
| `]d`    | Next diagnostic                |            |
| `,e`    | Show line diagnostics          |            |

### File Tree

[neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)

| Key         | Action               |
| ----------- | -------------------- |
| `a`         | New file             |
| `A`         | New folder           |
| `r` or `mm` | Rename               |
| `d`         | Delete               |
| `y`         | Copy to clipboard    |
| `x`         | Cut to clipboard     |
| `p`         | Paste from clipboard |

### Terminal

[toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)

| Key      | Action                     |
| -------- | -------------------------- |
| `,t`     | Toggle terminal            |
| `Ctrl+\` | Toggle terminal (any mode) |
| `,a`     | Leave terminal mode        |

### Claude Code

[claudecode.nvim](https://github.com/coder/claudecode.nvim)

| Key   | Action              |
| ----- | ------------------- |
| `,cc` | Toggle Claude Code  |
| `ca`  | Accept changes      |
| `cx`  | Reject changes      |
| `,a`  | Leave terminal mode |
