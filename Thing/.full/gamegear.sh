#!/bin/bash
cat /home/pi/RetroPie/retropiemenu/Devils-Box/setup/txts/packs-launch.txt
wget --spider https://archive.org/download/thing-box/Retro-Devils-Gamegear.7z
echo "This Will Also Install Emulator(s)"
echo "Above Is File Size & Info"
read -p "Do You Wish To Continue (y/n)?" CONT
if [ "$CONT" = "y" ]; then
  echo "Starting Download";
else
  echo "Exiting Now";sudo reboot
fi
echo "Installing Emulator(s) Now"
sleep 2
sudo bash /home/pi/RetroPie-Setup/retropie_packages.sh lr-genesis-plusgx
echo "Installing & Cleaning Everything Else Now"
sleep 2
sudo rm -r /home/pi/RetroPie/roms/gamegear
cd
mkdir test
cd test
wget -c https://archive.org/download/thing-box/Retro-Devils-Gamegear.7z -q --show-progress
7z x -y -aoa /home/pi/test/Retro-Devils-Gamegear.7z
sudo mv gamegear /home/pi/RetroPie/roms
sudo rm "Retro-Devils-Gamegear.7z"
cd ..
sudo rm -R test
echo "Complete Rebooting Now"
sleep 5
sudo reboot


