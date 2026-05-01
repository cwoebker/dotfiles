# CW .files ⚙️

Personal macOS dotfiles, installed via [dotbot](https://github.com/anishathalye/dotbot).

Public so they can be referenced; not designed for fork-and-use.

## Fork warning

If you want to give these dotfiles a try, fork the repository, read every file, and strip anything you don't want or need before running `./install` or `scripts/macos.sh`. The macOS script flips dozens of `defaults`, including locale (Germany), keyboard repeat, hot corners, and Dock orientation — running it blindly will reshape your system. Use at your own risk.

## Install

Prerequisite: [Homebrew](https://brew.sh). Then:

```sh
git clone --recursive https://github.com/cwoebker/dotfiles.git ~/.dotfiles
cd ~/.dotfiles && ./install
```

`./install` runs `brew bundle` to install the toolchain, symlinks every config in `install.conf.yaml`, fetches submodules (`dotbot`, `tpm`), runs TPM's headless plugin install, locks sheldon plugins, and tightens permissions on Homebrew's zsh dirs so `compinit` stops complaining.

## Stack

| Concern | Tool |
| --- | --- |
| Shell | zsh |
| Plugin manager | [sheldon](https://github.com/rossmacarthur/sheldon) (declarative TOML) |
| Prompt | [starship](https://starship.rs) — see `shell/starship/starship.toml` |
| Version manager | [mise](https://mise.jdx.dev) (single tool for node, python, ruby, etc.) |
| History | [atuin](https://atuin.sh) — SQLite-backed, fuzzy `Ctrl-R` |
| Directory jumping | [zoxide](https://github.com/ajeetdsouza/zoxide) (`z`, `zi`) |
| Fuzzy finder | [fzf](https://github.com/junegunn/fzf) |
| Modern CLI replacements | `eza` (ls), `bat` (cat), `delta` (git pager) |
| Terminal multiplexer | tmux + [TPM](https://github.com/tmux-plugins/tpm) (resurrect, continuum, sensible) |
| Editor | neovim (LazyVim) — vim kept as fallback |

## Architecture

### Layout

```
.
├── install                 # dotbot bootstrap
├── install.conf.yaml       # dotbot config — declares symlinks
├── Brewfile                # public homebrew bundle
├── dotbot/                 # submodule
├── tpm/                    # submodule (tmux plugin manager)
├── claude/CLAUDE.md        # global Claude Code instructions
└── shell/
    ├── zshenv              # env vars (sourced by every zsh invocation)
    ├── zshrc               # interactive setup (sheldon → compinit → starship)
    ├── path.zsh            # PATH and version-manager hooks
    ├── xdg.zsh             # XDG base-dir env vars
    ├── config.zsh          # interactive zsh options + history
    ├── aliases.zsh         # public aliases
    ├── functions.zsh       # shell functions
    ├── sheldon/plugins.toml    # zsh plugin declarations
    ├── starship/starship.toml  # powerline-style prompt config
    ├── mise/config.toml        # global mise tool versions
    ├── git/                # gitconfig, gitignore (delta as pager)
    ├── tmux/               # tmux.conf, theme.sh
    ├── nvim/               # neovim config (LazyVim)
    ├── vim/                # legacy vim config
    └── sublime/            # sublime settings
```

### Load order

Zsh sources files in this order:

1. `~/.zshenv` → `shell/zshenv` — every shell, including scripts
2. `~/.zprofile` — machine-local, untracked (brew shellenv etc.)
3. `~/.zshrc` → `shell/zshrc` — interactive shells only
4. `~/.zshlocalrc` — machine-local, untracked (work overrides, secrets, machine-specific paths)

`zshrc` runs in this sequence: brew completions on fpath → `compinit` → sheldon source (loads OMZ git/macos plugins) → mise → zoxide → fzf → starship → custom config → aliases → autosuggestions + syntax highlighting → atuin → `~/.zshlocalrc`.

### Public/private split

Anything machine-specific, work-related, or sensitive lives in `~/.zshlocalrc` (sourced last by `zshrc`, never tracked). A parallel `~/.Brewfile.local` (untracked) holds work-specific Homebrew packages.

Convention: anything ending in `.local.zsh` is gitignored.

## License

MIT — see [LICENSE](LICENSE).

## Thanks to…

- [Zach Holman](https://zachholman.com/) for [_Dotfiles Are Meant to Be Forked_](https://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/), the post that kicked off the genre for me
- [Anish Athalye](https://www.anishathalye.com/) for [dotbot](https://github.com/anishathalye/dotbot), the bootstrap that holds this repo together
- [Mathias Bynens](https://mathiasbynens.be/) for his [dotfiles](https://github.com/mathiasbynens/dotfiles) — `scripts/macos.sh` started life as a fork of his `.macos`
