THIS_DIR=$(cd $(dirname $0); pwd)
cd $THIS_DIR
TDCLI='https://valtman.name/files/telegram-cli-1222'
TDCLI_DIR="$THIS_DIR/data"
Bot_DIR="$THIS_DIR/data"
LUAROCKS_VER='2.4.2'
# echo the color
gray() {
  printf '\e[1;30m%s\n\e[0;39;49m' "$@"
}
red() {
  printf '\e[1;31m%s\n\e[0;39;49m' "$@"
}
green() {
  printf '\e[1;32m%s\n\e[0;39;49m' "$@"
}
brown() {
  printf '\e[1;33m%s\n\e[0;39;49m' "$@"
}
blue() {
  printf '\e[1;34m%s\n\e[0;39;49m' "$@"
}
pink() {
  printf '\e[1;35m%s\n\e[0;39;49m' "$@"
}
paleblue() {
  printf '\e[1;36m%s\n\e[0;39;49m' "$@"
}
white() {
  printf '\e[1;37m%s\n\e[0;39;49m' "$@"
}

function logo() {
green "          ____    | /  _____"
green "         |  _ \   |/  |_   _|___ ____   __  __"
white "         | |_) )  |\    | |/ .__|  _ \_|  \/  |"
red   "         |____/   | \   |_|\____/\_____|_/\/\_|"
}

#function logo2() {
#green " ____           _____            | / "
#white "|  _ \    /\   |_   _|    /\     |/"
#white "| |_) )  /__\    | |     /__\    |\"
#red   "|____/  /    \   |_|    /    \   | \"
#}

function logo1() {
green " ████████████  ██████████  ██████████████████ "
green " █          █  █        █  █                █"
green " █  ████    █  █  ████  █  ████████  ████████"
green " █  █  █    █  █  █  █  █         █  █" 
white " █  ████    █  █  █  █  █         █  █"
white " █          █  █  █  █  █         █  █" 
white " █  ██████  █  █  █  █  █         █  █" 
red   " █  █    █  █  █  █  █  █         █  █"
red   " █  ██████  █  █  ████  █         █  █" 
red   " █          █  █        █         █  █"
red   " ████████████  ██████████         ████"
}

update() {
  git pull
  install 
}
 
upstart() {
  printf '%s\n' "
description 'telegrambots upstart script.'

respawn
respawn limit 15 5

start on runlevel [2345]
stop on shutdown

setuid $(whoami)
exec /bin/sh $(pwd)/telegrambots
" | sudo tee /etc/init/telegrambots.conf > /dev/null

  [[ -f /etc/init/telegrambots.conf ]] && printf '%s\n' '

  Upstart script installed to /etc/init/telegrambots.conf.
  Now you can:
  Start telegrambots with     : sudo start telegrambots
  See telegrambots status with: sudo status telegrambots
  Stop telegrambots with      : sudo stop telegrambots

'
}

config() {
  mkdir -p "$TDCLI_DIR"/telegram-cli
  printf '%s\n' "
default_profile = \"Tabadolbot\";

Tabadolbot = {
  config_directory = \"$TDCLI_DIR/telegram-cli\";
  test = false;
  msg_num = true;
  log_level = 2;
  wait_dialog_list = true;
};
" > "$TDCLI_DIR"/tgcli.config
}

install() {
green 'Do you want me to install? (Yy/Nn): '
  read -rp ' ' install
  case "$install" in
    Y|y)
    echo '>> Create tg folder'
      mkdir -p tg data
      if [ -x "$(which apt-get)" ]; then
        echo '>> Updating packages'
        sudo apt-get update --yes && sudo apt-get upgrade
        echo '>> Installing dependencies'
        sudo apt-get --yes install wget libconfig9 libjansson4 lua5.2 liblua5.2 make unzip git redis-server g++ whois fortune fortunes
      else
        prtbrown " No apt-get found." " If you're on non Debian based systems, please manually install these following packages:"
        printf ' %s\n' wget libconfig9 libjansson4 lua5.2 liblua5.2 make unzip git redis-server g++ ''
        read -p " OK, I'll install those packages later [ENTER]..."
      fi
      echo '>> Fetching latest Tabadolbot source code'
      echo '>> Tabadolbot successfully installed!'
      echo ">> Change values in config file and run $0"
  esac
}

#luarocks() {
#blue 'Do you want me to install the luarocks? (Yy/Nn): '
  #read -rp ' ' install
  #case "$install" in
    #Y|y)
  #echo '>> Installing LuaRocks from sources'
  #git clone https://github.com/keplerproject/luarocks.git
  #cd luarocks || exit
  #git checkout tags/v"$LUAROCKS_VER"
  #PREFIX="$THIS_DIR/.luarocks"
  #./configure --prefix="$PREFIX" --sysconfdir="$PREFIX"/luarocks --force-config --lua-version=5.2
  #RET=$?
  #if [ $RET -ne 0 ]; then
    #echo 'Error. Exiting.'
   # exit $RET
  #fi
  #make build && make install
  #RET=$?
  #if [ $RET -ne 0 ]; then
    #cho 'Error. Exiting.'
    #exit $RET
  #fi
  #cd ..
  #rm -rf luarocks
  #esac
#}

#rocks() {
#pink 'Do you want me to install the rocks? (Yy/Nn): '
  #read -rp ' ' install
  #case "$install" in
   # Y|y)
  #echo '>> Installing rocks'
  #for i in luasec luasocket oauth redis-lua lua-cjson luautf8 fakeredis xml feedparser serpent multipart-post; do
    #./.luarocks/bin/luarocks install "$i"
    #RET=$?
    #if [ $RET -ne 0 ]; then
     # echo 'Error. Exiting.'
    #  exit $RET
   # fi
  #done
 # esac
#}

luarocks() {
blue 'Do you want me to install the luarocks? (Yy/Nn): '
  read -rp ' ' install
  case "$install" in
    Y|y)
echo "luarocks has been downloading..."
wget http://luarocks.org/releases/luarocks-2.2.2.tar.gz
echo "Extracting luarocks-2.2.2.tar.gz..."
tar zxpf luarocks-2.2.2.tar.gz
echo "Change name has been luarocks..."
mv luarocks-2.2.2 luarocks
echo "Luarocks-2.2.2.tar.gz has been removed..."
rm -rf 'luarocks-2.2.2.tar.gz'
echo "Open folder luarocks"
cd luarocks
 ./configure; sudo make bootstrap
 echo "Installing rocks"
 sudo apt-get install lua-lgi
 sudo apt-get install libnotify-dev
 sudo luarocks install luasocket
 sudo luarocks install luasec
 sudo luarocks install redis-lua
 sudo luarocks install lua-term
 sudo luarocks install serpent
 sudo luarocks install dkjson
 sudo luarocks install lanes
 sudo luarocks install Lua-cURL
 echo ""
cd ..
esac
config
}

telegram-cli() {
red 'Do you want me to install the telegram-cli? (Yy/Nn): '
  read -rp ' ' install
  case "$install" in
    Y|y)
 echo "telegram-cli-1222 has been downloading..."
 wget "$TDCLI" -O "$TDCLI_DIR"/telegram-cli-1222
 cd "$TDCLI_DIR"
 mv telegram-cli-1222 tgcli
 echo "Chmoded tgcli"
 sudo chmod +x tgcli
 cd ..
 esac
 config
}

commands() {
  cat <<EOF

  Usage: $0 [options]

    Options:
      install           Install ${0##*/}
      update            Update ${0##*/}
      start             Start ${0##*/}
	  upstart           upstart ${0##*/}
	  on                Dont off your bot
	  help              Print this message
	  logo              Show logo

EOF
}

if [ "$1" = "install" ]; then
logo
logo1
install
luarocks
#rocks
telegram-cli
elif [ "$1" = "update" ]; then
  logo
  logo1
  update
  elif [[ "$1" = "upstart" ]]; then
  logo
  logo1
  upstart
  elif [[ "$1" = "help" ]]; then
  logo
  logo1
  commands
  elif [[ "$1" = "logo" ]]; then
  logo
  logo1
  elif [[ "$1" = "on" ]]; then
  logo
  logo1
  while true; do
  screen "$TDCLI_DIR"/telegram-cli -WRs "$Bot_DIR"/bot.lua -c "$TDCLI_DIR"/tgcli.lua -p Tabadolbot "$@"
  done
  elif [[ "$1" = "start" ]]; then
  if [ ! -f ./data/tgcli ]; then
    echo "tg not found"
    echo "Run $0 install"
    exit 1
 fi
 logo
 logo1
  config
  "$TDCLI_DIR"/tgcli -WRs "$Bot_DIR"/bot.lua -c "$TDCLI_DIR"/tgcli.config -p Tabadolbot "$@"
  else
  logo
  logo1
  commands
fi
