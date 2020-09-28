rm -rf dist &&
yarn build &&
cd dist &&
git init &&
git add . &&
git commit -m 'update' &&
git branch -M master &&
git remote add origin https://github.com/YoLinDeng/lightning-ui-website.git &&
git push -f -u origin master &&
cd -
echo https://yolindeng.github.io/lightning-ui-website/index.html