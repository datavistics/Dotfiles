#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

step() { echo ""; echo "==> $*"; }
ok()   { echo "  already present, skipping"; }

# ── dotfiles tool ────────────────────────────────────────────────────────────
step "Installing dotfiles tool..."
if ! command -v dotfiles &>/dev/null; then
  pip install dotfiles
else
  ok
fi

# ── oh-my-zsh ────────────────────────────────────────────────────────────────
step "Installing oh-my-zsh..."
if [ ! -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]; then
  KEEP_ZSHRC=yes RUNZSH=no \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  ok
fi

# ── zsh plugins & theme ──────────────────────────────────────────────────────
step "Installing zsh-autosuggestions..."
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions \
    "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
  ok
fi

step "Installing powerlevel10k..."
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    "$ZSH_CUSTOM/themes/powerlevel10k"
else
  ok
fi

# ── vim-plug ─────────────────────────────────────────────────────────────────
step "Installing vim-plug..."
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
  curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
  ok
fi

# ── symlinks via dotfiles tool ───────────────────────────────────────────────
step "Syncing dotfile symlinks..."
dotfiles --repo "$DOTFILES" --sync --force

# ── machine-specific config ──────────────────────────────────────────────────
if [ ! -f "$HOME/.zshrc.local" ]; then
  echo ""
  echo "NOTE: ~/.zshrc.local not found."
  echo "      Create it for machine-specific config (conda, PATH tweaks, etc.)."
  echo "      It is sourced at the end of ~/.zshrc and is not tracked in git."
  echo ""
  echo "      Example contents:"
  echo "        export PATH=\"/opt/homebrew/bin:\$PATH\""
  echo "        # conda initialize block goes here"
fi

# ── post-install ─────────────────────────────────────────────────────────────
echo ""
echo "==> Done! Next steps:"
echo "    1. Open a new shell (exec zsh)"
echo "    2. Open vim and run :PlugInstall"
echo "    3. If prompt looks wrong, run: p10k configure"
