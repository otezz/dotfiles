main() {
    echo "Setting up vim.."
    cd ~
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    curl -sO https://raw.githubusercontent.com/otezz/dotfiles/master/.vimrc
    mkdir -p ~/.vim/swap
    mkdir -p ~/.vim/backup
    vim +PluginInstall +qall
    echo "Done!"
}

main