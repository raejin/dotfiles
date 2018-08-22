#!/bash/zsh
./getPrezto;
./getFzf;
./getTmux;
./getNvim;
./copyThem;
cd ~/.zprezto;
git apply ~/dotfiles/zprezto_diff;
cd ~/;

