# Dotfiles with uv Integration

This repository contains configuration files for customizing your shell environment (bash, zsh, tmux, etc.).  It now includes optional integration with **[uv](https://github.com/astral-sh/uv)**, a modern Python toolchain that replaces `pip`, `pip‑tools`, `pipx`, `virtualenv`, and more.

## Why uv?

> uv is “an extremely fast Python package installer and resolver, written in Rust”【845617082850170†L23-L28】 and is **much faster than pip**【845617082850170†L23-L28】.  It introduces a workflow based on `uv pip compile` and `uv pip sync`【845617082850170†L23-L28】, which lock your dependencies and then synchronise your environment, and it enforces the use of isolated virtual environments【845617082850170†L52-L55】.

## Installing uv

The uv project provides standalone installers, PyPI packages and Homebrew formulas.  On macOS and Linux, the recommended approach is to run:

```
curl -LsSf https://astral.sh/uv/install.sh | sh
```

This downloads and runs the official installer【498235778560565†L137-L151】.  You can also install via `pipx install uv` or `pip install uv`【498235778560565†L187-L199】, or using Homebrew (`brew install uv`)【498235778560565†L207-L213】.

After installing uv, run:

```
uv tool update-shell
```

This command inserts the uv tool `bin` directory into your `PATH` so that executables provided by uv‑installed tools are available【256313700523018†L397-L403】.  Restart your shell after running this command.

### Shell completion

For command‑line completion, append the following to your shell configuration file:

- **Bash**: `eval "$(uv generate-shell-completion bash)"`【498235778560565†L274-L280】  
- **Zsh**: `eval "$(uv generate-shell-completion zsh)"`【498235778560565†L279-L301】

There are analogous commands for other shells【498235778560565†L274-L304】.

## Using uv with these dotfiles

These dotfiles define two convenience aliases that wrap common uv workflows:

```
alias uvinit='uv venv && source .venv/bin/activate'
alias uvsync='uv pip compile requirements.in --quiet --output-file requirements.txt && uv pip sync requirements.txt'
```

- **uvinit**: creates a new uv‑managed virtual environment in `.venv` and activates it.  
- **uvsync**: compiles a `requirements.in` file into a locked `requirements.txt` and then synchronises your environment to match.  This workflow is recommended because it identifies all transitive dependencies and enforces them【845617082850170†L23-L28】【845617082850170†L52-L55】.

These aliases were inspired by Sam Edwardes’ uv workflow【845617082850170†L37-L41】【845617082850170†L212-L218】.  When starting a new project you can run:

```
uvinit
echo "package-name" > requirements.in
uvsync
```

to create and populate your environment.  Whenever you modify `requirements.in`, run `uvsync` again to update your environment【845617082850170†L205-L217】.

## Tips

- Consider aliasing `pip` to `python -m pip` or `uv pip` only if you are comfortable with uv’s differences from pip.  The uv `pip` commands aim to be compatible but are not identical to pip【752188399402514†L214-L219】.
- To update uv itself, run `uv self update`【498235778560565†L251-L258】.
See the [official uv documentation](https://docs.astral.sh/uv/) for more details on projects, tools and Python version management.
  
## Installing these dotfiles

1. **Clone this repository** to your machine:

   ```sh
   git clone https://github.com/datavistics/Dotfiles.git
   ```

2. **Back up existing configuration files** in your home directory (e.g., `~/.bashrc`, `~/.zshrc`) to avoid overwriting them.

3. **Copy or symlink** the files from this repository into your home directory. For example:

   ```sh
   # Copy files
   cp bashrc ~/.bashrc
   cp zshrc ~/.zshrc
   cp dotfilesrc ~/.dotfilesrc

   # Or create symlinks so updates to this repository propagate automatically
   ln -s $(pwd)/bashrc ~/.bashrc
   ln -s $(pwd)/zshrc ~/.zshrc
   ln -s $(pwd)/dotfilesrc ~/.dotfilesrc
   ```

   Adjust the commands for any additional dotfiles (such as `.gitconfig` or `custom.js`) you wish to use.

4. **Reload your shell** to apply the new configuration:

   ```sh
   source ~/.bashrc    # for Bash users
   source ~/.zshrc     # for Zsh users
   ```

These dotfiles are designed for Linux/macOS systems and include helpful aliases, prompt customisations, fzf integration and more. Feel free to tailor them to your needs.
