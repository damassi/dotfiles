# Dotfiles

My dotfile setup, managed with [chezmoi](https://www.chezmoi.io).

## Setup

First, install `chezmoi`:

```sh
brew install chezmoi
```

Then clone and apply dotfiles:

```sh
chezmoi init https://github.com/damassi/dotfiles.git
chezmoi apply
```

## Use

Add files:

```sh
chezmoi add ~/.bashrc
```

Edit and apply:

```sh
chezmoi edit ~/.bashrc
chezmoi diff
chezmoi -v apply
```

Commit files and return to prompt:
```
chezmoi cd
git add dot_bashrc
git commit -m "Add .bashrc"
exit
```

Update latest with:

```sh
chezmoi update
```

> NOTE: Once dotfiles are cloned and applied, `chezmoi` has been aliased to `ch`.

### NeoVim

This repo contains a fairly complete NeoVim reproduction of all core VSCode Editor/LSP features, including robust mouse support for getting from symbol to symbol, and keybindings that map to common VSCode commands.

See [dotfiles/nvim/KEYBINDINGS.md](dotfiles/nvim/KEYBINDINGS.md) for keybindings.

AI completions via [windsurf.nvim](https://github.com/Exafunction/windsurf.nvim) - run `:Codeium Auth` to login.
