#!/bin/bash
# use the correct node version for below path

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

PATH="$PATH:/home/ubuntu/.nvm/versions/node/v16.14.2/bin/"
cd ~/

echo "Terminating the old app server."
pm2 kill 

echo "Delete the old code."
rm -rf ~/awesome-nextapp

echo "Cloning the Code."
git clone git@github.com:jerrybopara/awesome-nextapp.git

cd ~/awesome-nextapp/
echo "YARN Install & Build."
yarn install
yarn build

pm2 start npm --name "nextapp" -- start
# pm2 restart nextapp