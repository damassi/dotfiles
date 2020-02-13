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
