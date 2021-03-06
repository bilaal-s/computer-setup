# Curl
sudo apt-get install curl

# Git
sudo apt install git

# SSH key setup
ssh-keygen -t rsa -b 4096 -C "bilaaldev@gmail.com"

# Meld
sudo apt-get update
sudo apt-get install meld

# VS Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code
ln -s ~/dotfiles/vscode/settings.json ~/.config/Code/User/settings.json
# Optional theme
ln -s ~/dotfiles/vscode/vscode-wal ~/.vscode/extensions

# Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update 
sudo apt-get install google-chrome-stable

# Zsh
sudo apt-get install zsh
chsh -s $(which zsh)

# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mkdir ~/.oh-my-zsh/custom/plugins/git-noalias
cp ~/dotfiles/zsh/git-noalias.plugin.zsh ~/.oh-my-zsh/custom/plugins/git-noalias/git-noalias.plugin.zsh

ln -s ~/dotfiles/.aliases ~/.aliases
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
source ~/.zshrc

# Fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Neovim
sudo apt-get install neovim
mkdir ~/.local/share/nvim/plugged
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir ~/.config/nvim
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/nvim/.nvimrc ~/.nvimrc
# Run :PlugInstall in nvim

# installing build tools
sudo apt-get install cmake

# tmux - get release tar from tmux github page
sudo apt-get install libevent-dev libncurses-dev
./configure && make
sudo make install
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

# ag
sudo apt-get install silversearcher-ag

# before installing i3 configure autorandr to create profiles if using multiple monitors,
# then update i3 config as nessecary

# ***********************
# ADD to this script: install nerd fonts
# ***********************

# For future fast ricing find ppas that have i3, pywal and polybar allready present, e.g. https://launchpad.net/~kgilmer/+archive/ubuntu/speed-ricer

# ***********************
#rofi
sudo apt-get install librsvg2-bin flex bison check libpango1.0-dev libstartup-notification0-dev librsvg2-dev
#download latest tar of check package and follow build instructions
# check unit test framework for c
autoreconf --install
./configure
make
make check
make install
sudo ldconfig
#download the tar from rofi github, extract and follow build instructions
mkdir build && cd build
../configure
make
sudo make install
# ***********************

# ***********************
# compton
sudo apt-get install compton
ln -s ~/dotfiles/compton/compton.conf ~/.config/compton.conf

# building the maintained version of compton
sudo apt-get install libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libxdg-basedir-dev libgl1-mesa-dev  libpcre2-dev  libevdev-dev uthash-dev libevdev2 libev-dev

git clone https://github.com/yshui/compton.git
cd compton
git submodule update --init --recursive
sudo apt-get install meson ninja-build
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
# ***********************

# ***********************
# i3-gaps
sudo add-apt-repository ppa:jonathonf/i3
sudo apt-get update
sudo apt-get install i3-gaps
mkdir ~/.config/i3
ln -s ~/dotfiles/i3/config ~/.config/i3/config
# ***********************

# ***********************
# polybar

# sxiv used for themeselect script
# tar is donwloaded and extracted cd into the folder and run
sudo apt-get install libimlib2-dev libxft-dev libexif-dev
make
sudo make install

# see polybar wiki on github for updated build instrcutions
#build dependencies
sudo apt-get install cmake clang python3-sphinx
sudo apt-get install libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev
sudo apt-get install libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev
# download the release tar from polybar github page
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install

mkdir ~/.config/polybar
ln -s ~/dotfiles/polybar/config ~/.config/polybar/config
ln -s ~/dotfiles/polybar/launch.sh ~/.config/polybar/launch.sh
# ***********************

#feh
sudo apt-get install feh

#i3lock-color
git clone git@github.com:PandorasFox/i3lock-color.git
sudo apt-get install libjpeg-turbo8 autoconf libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev libpam0g-dev libpam-abl
cd i3lock-color
rm -rf build
mkdir -p build && cd build/
autoreconf --force --install
../configure \
	--prefix=/usr \
	--sysconfdir=/etc \
	--disable-sanitizers
make
sudo make install

# i3lock - betterlockscreen
# clone multi monitor branch!
git clone https://github.com/pavanjadhaw/betterlockscreen
cd betterlockscreen
gch multi-monitor
mkdir ~/.local/bin 
cp betterlockscreen ~/.local/bin/

# PIP
sudo apt update
sudo apt-get install python-pip python3-pip

# ***********************
# wpgtk
sudo apt-get install python3-gi python3-gi-cairo gir1.2-gtk-3.0 python3-pil
sudo pip3 install pywal
sudo apt-get install xsettingsd
sudo pip3 install wpgtk

#install gtk theme and icons
mkdir ~/.themes #maybe not needed
sudo wpg-install.sh -ig
# if you get permission denied issue, run the following
sudo chown $USER:$USER -R /home/$USER/.config/wpg
sudo chown $USER:$USER -R /home/$USER/.cache/wal
sudo chown $USER:$USER -R /home/$USER/.local/share/icons
sudo chown $USER:$USER -R /home/$USER/.local/share/themes

ln -s ~/dotfiles/wpg/wpg.conf ~/.config/wpg/wpg.conf
#dunstrc
ln -s ~/dotfiles/dunst/dunstrc ~/.config/dunst/dunstrc
# setting up wpgtk/i3 integration
ln -s ~/.config/i3/config ~/.config/wpg/templates/i3
ln -s ~/.config/dunst/dunstrc ~/.config/wpg/templates/dunstrc
ln -s ~/.config/polybar/config ~/.config/wpg/templates/polybar
ln -s ~/.tmux.conf ~/.config/wpg/templates/tmux
ln -s ~/dotfiles/vscode/vscode-wal/themes/wal-color-theme.json ~/.config/wpg/templates/wal-color-theme.json

# symlink base files for wpgtk
ln -s ~/dotfiles/wpg/templates/i3.base ~/.config/wpg/templates/i3.base
ln -s ~/dotfiles/wpg/templates/polybar.base ~/.config/wpg/templates/polybar.base
ln -s ~/dotfiles/wpg/templates/gtk2.base ~/.config/wpg/templates/gtk2.base
ln -s ~/dotfiles/wpg/templates/gtk3.0.base ~/.config/wpg/templates/gtk3.0.base
ln -s ~/dotfiles/wpg/templates/gtk3.20.base ~/.config/wpg/templates/gtk3.20.base
ln -s ~/dotfiles/wpg/templates/tmux.base ~/.config/wpg/templates/tmux.base
ln -s ~/dotfiles/wpg/templates/wal-color-theme.json.base ~/.config/wpg/templates/wal-color-theme.json.base
ln -s ~/dotfiles/wpg/templates/dunstrc.base ~/.config/wpg/templates/dunstrc.base
# ***********************

# xbacklight
sudo apt-get install xbacklight

# xserver
ln -s ~/dotfiles/xserver/.Xresources ~/.Xresources
sudo ln -s ~/dotfiles/xserver/90-touchpad.conf /usr/share/X11/xorg.conf.d/
# xbacklight for intel drivers
sudo ln -s ~/dotfiles/xserver/20-intel.conf /usr/share/X11/xorg.conf.d/

# autorandr
sudo apt-get install autorandr 

#lxappearance
sudo apt-get install lxappearance # set theme to flatcolor and icons to flat icons
sudo apt install libcanberra-gtk-module libcanberra-gtk3-module # if error about canberra gtk module failed to load appears

# Iosevka nerd font complete - get from gh release
mkdir mkdir ~/.fonts
cp ~/Downloads/Iosevka/Iosevka\ Nerd\ Font\ Complete.ttf ~/.fonts

# neofetch
sudo apt-get install neofetch

#paper icon for rofi theme, donwload tar gz from GH page
meson "build" --prefix=$HOME/.local
sudo ninja -C "build" install

# urxvt
sudo apt install rxvt-unicode

#font config
sudo ln -s ~/dotfiles/fonts/conf.d/10-ab-Iosevka.conf /etc/fonts/conf.d/ 

#mpd
#download release tar and cd into untarred folder
sudo apt-get install g++ \
  libpcre3-dev \
  libmad0-dev libmpg123-dev libid3tag0-dev \
  libflac-dev libvorbis-dev libopus-dev \
  libadplug-dev libaudiofile-dev libsndfile1-dev libfaad-dev \
  libfluidsynth-dev libgme-dev libmikmod2-dev libmodplug-dev \
  libmpcdec-dev libwavpack-dev libwildmidi-dev \
  libsidplay2-dev libsidutils-dev libresid-builder-dev \
  libavcodec-dev libavformat-dev \
  libmp3lame-dev libtwolame-dev libshine-dev \
  libsamplerate0-dev libsoxr-dev \
  libbz2-dev libcdio-paranoia-dev libiso9660-dev libmms-dev \
  libzzip-dev \
  libcurl4-gnutls-dev libyajl-dev libexpat-dev \
  libasound2-dev libao-dev libjack-jackd2-dev libopenal-dev \
  libpulse-dev libshout3-dev \
  libsndio-dev \
  libmpdclient-dev \
  libnfs-dev libsmbclient-dev \
  libupnp-dev \
  libavahi-client-dev \
  libsqlite3-dev \
  libsystemd-dev \
  libgtest-dev \
  libboost-dev \
  libicu-dev
# note: local bin meson is because it was installed with pip3
~/.local/bin/meson . output/release --buildtype=debugoptimized -Db_ndebu=true
ninja -C output/release 
sudo ninja -C output/release install
mkdir ~/.config/mpd
ln -s ~/dotfiles/mpd/mpd.conf ~/.config/mpd
mkdir ~/quran
mkdir ~/quran/playlists
#once m~/.config/mpd check if files like db and pid file are autgenerated, if so just save the config and leave the other files and if not autgenerated copy the whole mpd config dir to dotfiles and symlink

#ncmpcpp
# get release tar and untar
./autogen.sh 
sudo apt-get install libboost-date-time-dev libboost-all-dev libreadline-dev libncursesw5-dev
./configure --enable-outputs --enable-visualizer --enable-clock
make
sudo make install
mkdir ~/.config/ncmpcpp
ln -s ~/dotfiles/ncmpcpp/config ~/.config/ncmpcpp

#termite
sudo apt-get install -y libgtk-3-dev libgtk2.0-dev git g++ libgtk-3-dev gtk-doc-tools gnutls-bin valac intltool libpcre2-dev libglib3.0-cil-dev libgnutls28-dev libgirepository1.0-dev libxml2-utils gperf
cd ~/Downloads
git clone https://github.com/thestinger/vte-ng.git
export LIBRARY_PATH="/usr/include/gtk-3.0:$LIBRARY_PATH"
cd vte-ng
./autogen.sh
make && sudo make install
cd ../termite
make
sudo make install
sudo ldconfig
sudo mkdir -p /lib/terminfo/x
sudo ln -s /usr/local/share/terminfo/x/xterm-termite /lib/terminfo/x/xterm-termite
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/termite 60
ln -s ~/dotfiles/termite/config ~/.config/termite
