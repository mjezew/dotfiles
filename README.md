# My personal dotfiles

## Starting up on a new machine
### Install plugins, fonts, etc.
use `brew bundle` if using brew to install necessary plugins specified in `Brewfile`. If not using `brew`, download the plugins specified there.

### Use stow to symlink
Run `stow` for necessary directories in this repo.
```
stow --no-folding nvim
stow --no-folding git
stow --no-folding tmux
...
```

### Setup language server
Follow elixir-ls setup instructions.
Use the path specified in `lsp.lua` so that the ls is configured correctly.
