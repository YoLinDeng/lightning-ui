rm -rf dist &&
yarn build &&
cd dist &&
git init &&
git add . &&
git commit -m 'update' &&
git branch -M master &&
git remote add origin https://gitee.com/YolinDeng/lightning-ui-website.git &&
git push -f -u origin master &&
cd -
echo https://yolindeng.github.io/lightning-ui-website