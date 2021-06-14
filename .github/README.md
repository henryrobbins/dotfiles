# dotfiles

This repo contains my dotfiles for macOS (Big Sur 11.4). This
dotfile management solution was inspired by [this
article](https://www.atlassian.com/git/tutorials/dotfiles). See Derek Taylor's
[video summary](https://youtu.be/tBoLDpTWVOM) of the article.

## Installation

To install these dotfiles on a new system, follow these steps. First, clone the
repo:
```
git clone --bare https://github.com/henryrobbins/dotfiles.git $HOME/git/dotfiles
```
Define the alias in the current shell scope:
```
alias config='/usr/bin/git --git-dir=$HOME/git/dotfiles --work-tree=$HOME'
```
Checkout the actual content from the bare repository to your `$HOME`:
```
config checkout
```
It is likely this will result in an error. In this case, you need to remove the
files which will be overwritten by Git. Re-run `config checkout` if needed. Set
the flag `showUntrackedFiles` to `no` on this specific (local) repository. This
prevents your entire untracked file system from showing up in `git status`.
```
config config --local status.showUntrackedFiles no
```
You can then use the `config` alias with normal `git` commands!
```
config status
config add .vimrc
config commit -m "Add vimrc"
config push origin master
```

## Configuration Files

| Application | Files | Summary |
|-------------|-------|---------|
| [Terminal](https://en.wikipedia.org/wiki/Terminal_(macOS)) | [com.apple.Terminal.plist](../Library/Preferences/com.apple.Terminal.plist) | Terminal emulator included in macOS |
| [Vim](https://www.vim.org/download.php) | [.vimrc](../.vimrc) </br> [.vim](../.vim) | Highly configurable text editor |
| [Bash](https://www.gnu.org/software/bash/) | [.bashrc](../.bashrc) </br> [.bash_profile](../.bash_profile) | Unix shell and command language |
| [VS Code](https://code.visualstudio.com/) | [settings.json](<../Library/Application Support/Code/User/settings.json>) | Source Code Editor |
| [Amethyst](https://ianyh.com/amethyst/) | [com.amethyst.Amethyst.plist](../Library/Preferences/com.amethyst.Amethyst.plist) | Tiling window manager for macOS |
| [Karabiner-Elements](https://karabiner-elements.pqrs.org/) | [.config/karabiner](../.config/karabiner) | Key remapper for macOS |

## License

Licensed under the [MIT License](https://choosealicense.com/licenses/mit/)
