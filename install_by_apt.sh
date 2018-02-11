sudo apt-get install silversearcher-ag
sudo apt-get install git
sudo apt-get install subversion
sudo apt-get install dconf-cli
sudo apt-get install exuberant-ctags
sudo apt-get install fonts-hack-ttf

mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/undo
mkdir -p ~/.config/fontconfig/conf.d/
mkdir -p ~/.fonts

wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf -O ~/.fonts/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf -O ~/.config/fontconfig/conf.d/10-powerline-symbols.conf 

fc-cache -vf ~/.fonts/

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "When .vimrc is set, run :PlugInstall in vim"


# wget https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim -o ~/.vim/autoload/pathogen.vim


mkdir -p /tmp/gnome-terminal-colors-solarized
cd /tmp/gnome-terminal-colors-solarized
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
cd gnome-terminal-colors-solarized
./install.sh
cd
rm -rf /tmp/gnome-terminal-colors-solarized



