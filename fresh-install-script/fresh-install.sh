#!/usr/bin/env bash

sudo pacman -S --noconfirm figlet go
clear
figlet "Setting up your Arch setup"

echo " ********** Remove applications from Antergos repo ********** "
echo " ********** This is only if Antergos is installed isntead of Arch ********** "
sudo pacman -Rcns --noconfirm antergos-alerts antergos-alpm-hooks antergos-desktop-settings antergos-keyring antergos-midnight-timers antergos-mirrorlist grub2-theme-antergos kfaenza-icon-theme numix-icon-theme numix-icon-theme-square pamac

echo " ********** Overwriting pacman config ********** "
wget -P ~/Downloads https://raw.githubusercontent.com/shrestaz/linux-configs/master/fresh-install-script/configfiles/pacman.conf
sudo mv ~/Downloads/pacman.conf /etc/pacman.conf

echo " ********** Skip GRUB unless Shift key is held down ********** "
wget -P ~/Downloads https://github.com/shrestaz/linux-configs/blob/master/fresh-install-script/configfiles/grub
sudo mv ~/Downloads/grub /etc/default/grub
wget -P ~/Downloads/ https://gist.githubusercontent.com/anonymous/8eb2019db2e278ba99be/raw/257f15100fd46aeeb8e33a7629b209d0a14b9975/gistfile1.sh
sudo mv ~/Downloads/gistfile1.sh /etc/grub.d/31_hold_shift
sudo chmod a+x /etc/grub.d/31_hold_shift
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo " ********** Installing yay; An AUR helper ********** "
sudo pacman -S --noconfirm git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

echo " ********** Finished setting up yay. Cleaing up. ********** "
cd ..
rm -rf yay

echo " ********** Setting up bash profile and aliases ********** "
wget -P ~/Downloads https://raw.githubusercontent.com/shrestaz/linux-configs/master/fresh-install-script/dotfiles/.bashrc
mv ~/Downloads/.bashrc ~/.bashrc
wget -P ~/Downloads https://raw.githubusercontent.com/shrestaz/linux-configs/master/fresh-install-script/dotfiles/.bashrc.aliases
mv ~/Downloads/.bashrc.aliases ~/.bashrc.aliases
source ~/.bashrc

echo " ********** Update existing packages before setting up anything else ********** "
yay -Syyuu --noconfirm

echo " ********** Installing fonts and modify system font rendering ********** "
installaur --noconfirm ttf-google-fonts-git noto-fonts-emoji nerd-fonts-complete 
fc-cache -f
mkdir ~/.config
mkdir ~/.config/fontconfig
wget -P ~/Downloads https://raw.githubusercontent.com/shrestaz/linux-configs/master/fresh-install-script/configfiles/fonts.conf
mv ~/Downloads/fonts.conf ~/.config/fontconfig/fonts.conf

echo " ********** Installing applications ********** "
installaur --noconfirm guake libinput-gestures linux-headers slack-desktop windscribe-cli google-chrome visual-studio-code-bin android-sdk-platform-tools autokey em-keyboard insomnia mailspring megasync mongodb-compass otf-san-francisco pulseaudio-modules-bt-git spotify viber ark bash-completion docker docker-compose docker-machine kdeplasma-addons libreoffice-fresh lsof lsd os-prober p7zip partitionmanager redshift sddm syntax-highlighting unrar unzip virtualbox-host-dkms virtualbox kdialog gtk3-print-backends libunity ttf-liberation sni-qt capitaine-cursors sddm-kcm

echo " ********** Docker post install ********** "
# Read more here: https://docs.docker.com/install/linux/linux-postinstall/
sudo groupadd docker
sudo usermod -aG docker $USER

echo " ********** Libinput gesture post-install ********** "
sudo gpasswd -a $USER input
wget -P ~/.config/ https://raw.githubusercontent.com/shrestaz/linux-configs/master/fresh-install-script/configfiles/libinput-gestures.conf
libinput-gestures-setup autostart

echo " ********** Set SDDM as default lock screen ********** "
systemctl disable lightdm.service
systemctl enable sddm.service

echo " ********** Enable docker and windscribe ********** "
systemctl enable docker.service
systemctl enable windscribe.service

echo " ********** Redshift configuration ********** "
wget -P ~/.config/ https://raw.githubusercontent.com/shrestaz/linux-configs/master/fresh-install-script/configfiles/redshift.conf

echo " ********** NVM installation ********** "
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
source ~/.bashrc
command -v nvm
nvm install node

echo " ********** Install Eduroam for RUC network ********** "
xdg-open https://intra.ruc.dk/nc/en/employees/services-to-employees/ruc-digital/guides/internet-access/eduroam/setting-up-a-wireless-eduroam-profile-on-windows-apple-android-43-chromeos-and-linux/

echo " ********** Finishing up notes ********** "
echo "Sddm theme: Sugar dark"
echo "Settings > Workspace Theme > Look and Feel > Aritim-Dark"
echo "Settings > Workspace Theme > Plasma Theme > EQuilibrium Dark Flat"
echo "Settings > Colors > Cinereus - Dark/blue theme"
echo "Settings > Workspace Theme > Splash Screen > Simple Tux Splash"
echo "Settings > Window Management > Task Switcher > Large Icons"
echo "Settings > Shortcuts > Global Shortcuts > KWin > Toggle Present Windows (Ctrl + F10, Ctrl + Alt + Tab)"
echo "Edit Chrome Application Properties > Application > Command = /usr/bin/google-chrome-stable --remote-debugging-port=9222 %U"
echo "Install the downloaded eduroam python installer as `python ~/Downloads/eduroam...`"
