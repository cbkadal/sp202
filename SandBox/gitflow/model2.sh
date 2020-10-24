#!/bin/bash
# Sun 18 Oct 2020 07:24:57 AM WIB (rms)
# Sun 18 Oct 2020 06:19:53 AM WIB (rms)
# additional package: git-flow.deb

# master is the master
# remote can be replaced with github.com or others
# user1 will work in branch user1
# user2 will work in branch user2
# user3 will work in branch user3

USERS="user1 user2 user3"
# This will NUKE ALL user1, user2, user2, remote, master
rm -rf $USERS remote master

# Create a new remote
git init remote --bare

# Create a master plus init all branches
git init master

cd master
git commit -am "Initial Commit" --allow-empty
git remote add origin ../remote/
git push --set-upstream origin master
echo "#####    #####     This is branch master..."  | tee README.md | tee master.md
git pull; git add -A; git commit -m "master"; git push;
git flow init -d
git push --set-upstream origin develop
echo "#####    #####     This is branch develop..." | tee README.md | tee develop.md
git pull; git add -A; git commit -m "develop"; git push;
for II in $USERS ; do
    echo "$II"
    git flow feature start $II
    git push --set-upstream origin $II
    echo "#####    #####     This is branch $II..." | tee README.md | tee $II.md
    git pull; git add -A; git commit -m "$II"; git push;
done
git checkout master
cd ..

for II in $USERS ; do
    git clone remote/ $II
    cd $II
    git flow init -d
    git pull origin $II
    git checkout $II
    cd ..
done
exit

