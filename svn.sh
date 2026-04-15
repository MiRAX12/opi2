#!/bin/bash

commit(){
unzip ../commits/commit$1.zip -d .
svn add *
svn commit -m "Коммит $1" --username=$2
}

rm -rf repo wc
echo "Удалены лишние файлы"

svnadmin create repo
REPO_URL="file:///$(pwd -W)/repo"
echo "Создан репозиторий"

svn mkdir $REPO_URL/trunk $REPO_URL/branches -m "Создана структура проекта"

svn checkout $REPO_URL/trunk/ wc
cd wc

commit 0 red

svn copy $REPO_URL/trunk $REPO_URL/branches/branch2 -m "Branch2 создан"
svn switch $REPO_URL/branches/branch2

commit 1 blue
commit 2 blue
commit 3 blue
commit 4 blue
 
svn copy $REPO_URL/trunk $REPO_URL/branches/branch3 -m "Branch3 создан"
svn switch $REPO_URL/branches/branch3

commit 5 blue
commit 6 blue

svn switch $REPO_URL/trunk
commit 7 red

svn switch $REPO_URL/branches/branch3
commit 8 blue

svn switch $REPO_URL/trunk
commit 9 red

svn switch $REPO_URL/branches/branch3
commit 10 blue

svn switch $REPO_URL/trunk
svn merge $REPO_URL/branches/branch3
