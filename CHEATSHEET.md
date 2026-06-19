# Dotfiles Cheatsheet

A practical reference for getting the most out of this setup.

---

## Shell (zsh)

### Vi Mode

The shell runs in vi mode. The escape sequence is `jk` (no reaching for Esc).

| Key | Mode | Action |
|-----|------|--------|
| `jk` | insert | Switch to normal mode |
| `i` | normal | Back to insert mode |
| `v` | normal | Open current command in `$EDITOR` |
| `/` | normal | Search forward through history |
| `?` | normal | Search backward through history |
| `gg` | normal | Jump to oldest history entry |
| `G` | normal | Jump to newest history entry |
| `^R` | either | Incremental history search |

### Navigation & Editing (insert mode)

| Key | Action |
|-----|--------|
| `↑` / `↓` | History search by prefix (what you've already typed) |
| `^w` | Forward one word |
| `^b` | Backward one word |
| `^;` | Accept autosuggestion (full line) |
| `^R` | Fuzzy search history via fzf |

### FZF Integration

`fzf` is wired into the shell via the oh-my-zsh plugin. Key bindings:

| Key | Action |
|-----|--------|
| `^R` | Fuzzy search shell history |
| `^T` | Fuzzy find file, paste path at cursor |
| `Alt+C` | Fuzzy cd into a subdirectory |

### Git Aliases (oh-my-zsh `git` plugin)

A few high-value ones — run `alias \| grep "^g"` to see all of them.

| Alias | Expands to |
|-------|-----------|
| `g` | `git` |
| `ga` | `git add` |
| `gc` | `git commit` |
| `gca` | `git commit --all` |
| `gco` | `git checkout` |
| `gd` | `git diff` |
| `gl` | `git pull` |
| `gp` | `git push` |
| `gst` | `git status` |
| `glog` | `git log --oneline --decorate --graph` |

### Machine-Specific Config

Put anything machine-specific in `~/.zshrc.local` — it is sourced at the end of `.zshrc` and is not tracked in git. Good candidates: conda init, custom PATH entries, work-specific aliases, API keys.

---

## Vim

**Leader key:** `Space`

### File Navigation

| Key | Action |
|-----|--------|
| `:NERDTreeToggle` or map it | Toggle file tree |
| `Ctrl+p` (via fzf.vim) | Fuzzy find files in project |
| `:Files` | fzf file finder |
| `:Buffers` | fzf buffer switcher |
| `:Rg` | fzf ripgrep search across project |
| `:GFiles` | fzf git-tracked files only |

### Editing

| Key | Action |
|-----|--------|
| `jk` | Exit insert mode (no Esc needed) |
| `Enter` | Clear search highlight |
| `Space + l` | Toggle visible tabs and newlines |
| `w!!` (command mode) | Write file with sudo |

### Surround (vim-surround)

Operate on surrounding characters: quotes, parens, tags.

| Key | Action |
|-----|--------|
| `ys<motion><char>` | Add surrounding. e.g. `ysiw"` wraps word in `"` |
| `cs<old><new>` | Change surrounding. e.g. `cs"'` changes `"` to `'` |
| `ds<char>` | Delete surrounding. e.g. `ds"` removes `"` around cursor |
| `S<char>` (visual) | Surround selection |

### Auto-Pairs

Brackets, parens, and quotes are auto-closed on insert. When you type `(`, you get `()` with cursor inside. Backspace removes the pair.

### NERDCommenter

| Key | Action |
|-----|--------|
| `Space + cc` | Comment line / selection |
| `Space + cu` | Uncomment line / selection |
| `Space + ci` | Toggle comment |
| `Space + cs` | Sexy (block) comment |

### FZF in Vim

| Command | Action |
|---------|--------|
| `:Files [path]` | File finder |
| `:GFiles` | Git-tracked files |
| `:Buffers` | Open buffers |
| `:Lines` | Search lines in open buffers |
| `:Rg <pattern>` | Ripgrep across project |
| `:History` | Recently opened files |
| `:History:` | Command history |
| `:Maps` | Normal-mode mappings |

### Searching

Search uses `\v` (very magic) mode by default — regex special chars work without escaping.

| Key | Action |
|-----|--------|
| `/pattern` | Search (very magic) |
| `n` / `N` | Next / previous match |
| `Enter` | Clear highlight |
| `*` | Search word under cursor |

---

## Tmux

**Prefix:** `Ctrl+a`

### Sessions & Windows

| Key | Action |
|-----|--------|
| `prefix + c` | New window (in current path) |
| `prefix + ,` | Rename window |
| `prefix + n` / `p` | Next / previous window |
| `prefix + [0-9]` | Jump to window by number |
| `prefix + $` | Rename session |
| `prefix + s` | List and switch sessions |
| `prefix + d` | Detach from session |

### Panes

| Key | Action |
|-----|--------|
| `prefix + \|` | Split vertically (in current path) |
| `prefix + -` | Split horizontally (in current path) |
| `prefix + h/j/k/l` | Navigate panes (vim-style) |
| `prefix + z` | Zoom pane / unzoom |
| `prefix + x` | Close pane |
| `prefix + {` / `}` | Swap pane left / right |

### Copy Mode (vi bindings)

| Key | Action |
|-----|--------|
| `prefix + [` | Enter copy mode |
| `v` | Begin selection |
| `y` | Copy selection to clipboard (pbcopy) |
| `q` | Exit copy mode |
| `/` | Search forward in buffer |
| `?` | Search backward in buffer |

### Mouse

Mouse is enabled. You can click to select panes, scroll to scroll buffers, and drag pane borders to resize.

### Other

| Key | Action |
|-----|--------|
| `prefix + r` | Reload tmux config live |
| `prefix + ?` | List all key bindings |

---

## IdeaVim (JetBrains)

**Leader key:** `Space`

### EasyMotion

| Key | Action |
|-----|--------|
| `Space + e` | Jump to any word (bidirectional) |
| `Space + f` | Jump to 2-char match anywhere |
| `Space + j` | Jump to line below |
| `Space + k` | Jump to line above |

### Navigation

| Key | Action |
|-----|--------|
| `Space + g` | Go to line number |
| `Space + o` | File structure popup |
| `Space + S` | Reveal file in project view |
| `Space + h` | Type hierarchy |
| `Space + u` | Go to super method |
| `Space + [` | Jump to start of code block |
| `Space + ]` | Jump to end of code block |

### Refactoring & Code Actions

| Key | Action |
|-----|--------|
| `Space + r` | Rename element |
| `Space + i` | Implement methods |
| `Space + d` | Debug |
| `Space + b` | Toggle breakpoint |
| `Space + t` | Git update project |
| `Space + p` | Parameter info |
| `Space + q` | Quick Javadoc |

### Editing

| Key | Action |
|-----|--------|
| `Space + y` | Delete line |
| `Space + w` | Extend selection by word |
| `Space + m` | Scroll editor to center |
| `Space + z` | Toggle distraction-free mode |
| `Q` | Replay last macro (`@q`) |
| `Enter` | Clear search highlighting |
| `gc` (visual) | Comment / uncomment (commentary) |
| `jk` | Exit insert mode |

### Text Objects

The `argtextobj` plugin adds `ia` / `aa` for function arguments:

| Key | Action |
|-----|--------|
| `cia` | Change inside argument |
| `dia` | Delete inside argument |
| `vie` | Select entire file (textobj-entire) |

### AutoComplete

| Key | Action |
|-----|--------|
| `Ctrl+n` | Next hippie completion |
| `Ctrl+p` | Previous hippie completion |

---

## New Machine Setup

```bash
git clone git@github.com:datavistics/Dotfiles.git ~/Dotfiles
cd ~/Dotfiles && ./install.sh
```

Then:
1. Create `~/.zshrc.local` with machine-specific config (conda, PATH, etc.)
2. Open vim and run `:PlugInstall`
3. Run `p10k configure` to set up the prompt
