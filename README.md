# My personal dotfiles

## Starting up on a new machine

### Install terminal emulator + mise + homebrew 

### Install plugins, fonts, etc.
use `brew bundle` if using brew to install necessary plugins specified in `Brewfile`. If not using `brew`, download the plugins specified there.

### Use stow to symlink
Run `stow` for necessary directories in this repo.
```
stow shell
stow --no-folding nvim
stow --no-folding git
stow --no-folding tmux
stow --no-folding smug
...
```

### Setup language server
Follow elixir-ls setup instructions.
Use the path specified in `lsp.lua` so that the ls is configured correctly.
This is a guide I've liked in the past: https://www.mitchellhanberg.com/how-to-set-up-neovim-for-elixir-development/

### Install fzf tab
https://github.com/Aloxaf/fzf-tab 

### Install tpm (note non-default directory)
`git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm/`
https://github.com/tmux-plugins/tpm

### Install typescript ls
`npm install -g typescript typescript-language-server`
