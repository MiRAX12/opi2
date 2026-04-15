#!bin/bash

commit(){
	unzip commits/commit$1.zip -d src
	git add .
	git commit -m "Revision (r$1)"
	echo "--- Коммит $1 (red)"
}

set_user(){
	git config user.name "$1"
	git config user.email "$2"
	echo "--- Установлен пользователь $1"
}

init(){
	rm -rf .git
	rm -rf .gitignore
	rm -rf src
	echo "--- Удалены лишние файлы"
	git init
	echo "--- Репозиторий инициализирован"
}

create_gitignore(){
	echo "commits" > .gitignore
	echo "git.sh" >> .gitignore
	echo "svn.sh" >> .gitignore
	git add .gitignore
	echo "--- Создан gitignore"
}

init
create_gitignore

git checkout -b branch1
set_user red red@biribiri.com
commit 0 

git checkout -b branch2
set_user blue blue@biribiri.com
commit 1 
commit 2
commit 3 
commit 4

git checkout -b branch3
commit 5
commit 6

git checkout branch1
set_user red red@biribiri.com
commit 7

git checkout branch3
set_user blue blue@biribiri.com
commit 8

git checkout branch1
set_user red red@biribiri.com
commit 9

git checkout branch3
set_user blue blue@biribiri.com
commit 10

git checkout branch1
set_user red red@biribiri.com
git merge branch3 --no-commit
commit 11

git checkout branch2
set_user blue blue@biribiri.com
commit 12 
commit 13

git checkout branch1
set_user red red@biribiri.com
git merge branch2 --no-commit
commit 14