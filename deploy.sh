#!/bin/bash
# use the correct node version for below path
PATH="$PATH:/home/ubuntu/.nvm/versions/node/v16.13.2/bin/"
# mkdir -p ~/awesome-nextapp
cd ~/awesome-nextapp
git pull
yarn install
yarn build

#pm2 start npm --name "nextapp" -- start
pm2 restart nextapp