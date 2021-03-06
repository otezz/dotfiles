main() {
    echo "Setting up vim.."
    cd ~
    sudo apt-get install -y vim git
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    wget https://raw.githubusercontent.com/otezz/dotfiles/master/.vimrc
    mkdir -p ~/.vim/swap
    mkdir -p ~/.vim/backup
    vim +PluginInstall +qall
    echo "Done!"
}

main
