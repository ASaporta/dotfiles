## Setup

Clone to `~/dotfiles`:
```
git clone https://github.com/ASaporta/dotfiles.git ~/dotfiles
```

Symlink the dotfiles:
```
./setup.sh
```

Install vim-plug:
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Run `:PlugInstall` to install plugins.

:pray: Many thanks to [Andy Miller](https://github.com/andymiller) for sharing his vim wisdom with me. :raised_hands:
