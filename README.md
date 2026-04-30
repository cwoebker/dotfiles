# cwoebker's dotfiles

Personal macOS dotfiles, installed via [dotbot](https://github.com/anishathalye/dotbot).

Public so they can be referenced; not designed for fork-and-use.

## Install

Clone to `~/.dotfiles` and run from inside that directory:

```
git clone --recursive https://github.com/cwoebker/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install
brew bundle install
```

## Architecture

### Layout

```
.
├── install              # dotbot bootstrap
├── install.conf.yaml    # dotbot config — declares symlinks
├── Brewfile             # public homebrew bundle
├── dotbot/              # submodule
├── oh-my-zsh/           # submodule
└── shell/
    ├── zshenv           # env vars (sourced by every zsh invocation)
    ├── zshrc            # interactive setup (oh-my-zsh, history, aliases)
    ├── path.zsh         # PATH + tool roots
    ├── xdg.zsh          # XDG base-dir env vars
    ├── config.zsh       # interactive zsh options + history
    ├── aliases.zsh      # public aliases
    ├── functions.zsh    # shell functions
    ├── custom-oh-my-zsh/themes/cwoebker.zsh-theme
    ├── git/             # gitconfig, gitignore, git aliases
    ├── tmux/            # tmux.conf, theme.sh
    ├── vim/             # vim config, vim-plug
    └── sublime/         # sublime settings
```

### Load order

Zsh sources files in this order:

1. `~/.zshenv` → `shell/zshenv` — every shell, including scripts
2. `~/.zprofile` — machine-local, untracked (brew shellenv etc.)
3. `~/.zshrc` → `shell/zshrc` — interactive shells only
4. `~/.zshlocalrc` — machine-local, untracked (work overrides, secrets, machine-specific paths)

### Public/private split

Anything machine-specific, work-related, or sensitive lives in `~/.zshlocalrc` (sourced last by `zshrc`, never tracked). A parallel `~/.Brewfile.local` (untracked) holds work-specific Homebrew packages.

Convention: anything ending in `.local.zsh` is gitignored.

## License

MIT — see [LICENSE](LICENSE).
