# My personal dotfiles

## Starting up on a new machine
use `brew bundle` if using brew to install necessary plugins specified in `Brewfile`. If not using `brew`, download the plugins specified there.

## Use stow to symlink
Run `stow` for necessary directories in this repo.
```
stow --no-folding nvim
stow --no-folding git
stow --no-folding tmux
...
```


