ORIGIN_URL="git@github.com:jjsullivan5196/dotfiles.git"

cd ${HOME}

git init
git remote add origin "${ORIGIN_URL}"
git fetch
git checkout -f master
