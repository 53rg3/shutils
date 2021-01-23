 -------------------------------------------
#                  _
#                 (_)
#  _ __ ___   __ _ _ _ __  ____
# | '_ ` _ \ / _` | | '_ \|_  /
# | | | | | | (_| | | | | |/ /
# |_| |_| |_|\__,_|_|_| |_/___|
# -------------------------------------------


export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

alias ll='ls -al'
alias gitquick="/home/cc/Desktop/Programming/Software/Scripts/gitquick.sh"
alias playnew="sbt new playframework/play-java-seed.g8"
alias eshead="npm run start --prefix /home/cc/Desktop/Programming/Software/Elastic/elasticsearch-head"
alias ff='f(){ realpath "$1" | xclip -selection c;  unset -f f; }; f'
alias parcon_new="/home/cc/Desktop/Programming/JWS/Prj/UC/lib/ubercrawler/uc_docs/tools/scripts/parcon_n>

export PATH=$PATH:/home/cc/Desktop/Programming/JWS/Lts/stuff/bin
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
