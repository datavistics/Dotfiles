# 🗂️ My Dotfiles

Personal config for macOS & Linux managed with the [`dotfiles`](https://pypi.org/project/dotfiles/) CLI.

---

## Why uv?

[`uv`](https://github.com/astral-sh/uv) is a Rust-based drop‑in replacement for `pip`, `pip-tools`, and `virtualenv`.  
It gives you:

* ⚡ **~10× faster** dependency resolution & installs  
* 🛠️ Reproducible builds without a lock‑file dance  
* 🌎 Binary wheels for Apple Silicon & musl (handy on Docker/alpine)

Using `uv` keeps the bootstrap for `dotfiles` lightning‑quick and self‑contained.

---

## Prerequisites

| Tool | Why | Install |
|------|-----|---------|
| `git` | clone the repo | `brew install git` / `sudo apt install git` |
| `curl` | grab install scripts | usually pre‑installed |

1. Install fzf
`sudo apt install fzf`
2. Install Vim
`sudo apt install vim`
3. Install Vim-Plug
```shell
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

---

## 1 · Install `uv`

```bash
curl -Ls https://astral.sh/uv/install.sh | bash
# The script adds ~/.cargo/bin to PATH; re‑source your shell or:
export PATH="$HOME/.cargo/bin:$PATH"
```

> **Tip:** On macOS with Homebrew you can also  
> `brew install uv` (the formula is upstreamed).

Verify:

```bash
uv --version     # should print a semver
```

---

## 2 · Install the `dotfiles` CLI (with uv)

```bash
# Install into user site‑packages (no venv needed)
uv pip install dotfiles

# Ensure ~/.local/bin is on PATH
export PATH="$HOME/.local/bin:$PATH"
```

Check:

```bash
cd ~/Dotfiles
source .venv/bin/activate
dotfiles --version
```

---

## 3 · Clone and bootstrap

```bash
git clone https://github.com/datavistics/Dotfiles.git ~/Dotfiles
cd ~/Dotfiles

# Tell dotfiles where the repo lives (one‑time)
export DOTFILES_DIR="$HOME/.dotfiles"

# Symlink everything that is tracked under ~/.dotfiles
dotfiles --sync   # or just `dotfiles` (sync is default)
```

*Files listed in `.config/dotfilesrc` are now symlinked into `$HOME`.*

---

## Common tasks

| Task | Command |
|------|---------|
| Add a new file to tracking | `dotfiles --add ~/.config/kitty/kitty.conf` |
| Remove a tracked file      | `dotfiles --remove ~/.vimrc` |
| Re‑sync after edits        | `dotfiles --sync` |
| See what’s tracked         | `dotfiles --list` |
| Show link status           | `dotfiles --status` |

---

## Updating

```bash
cd ~/.dotfiles
git pull          # get latest changes
uv pip install --upgrade --user dotfiles  # update CLI if needed
dotfiles --sync   # apply new links
```

---
