#!/bin/bash
# REV02 Sun 25 Oct 2020 11:36:35 AM WIB
# REV01 Sat 24 Oct 2020 07:34:58 PM WIB
# START Sun 18 Oct 2020 06:19:53 AM WIB (rms)
# additional package: git-flow.deb

# master is the master
# remote can be replaced with github.com or others
# user1 will work in branch user1
# user2 will work in branch user2
# user3 will work in branch user3

git config gitflow.prefix.hotfix "hotfix/"
git config gitflow.prefix.feature "feature/"
git config gitflow.prefix.bugfix "bugfix/"
git config gitflow.prefix.release "release/"
git config gitflow.prefix.support "support/"

USERS="user1 user2 user3"
# This will NUKE ALL user1, user2, user2, remote, master, develop
rm -rf $USERS remote master develop

# Create a new remote
git init remote --bare

# Create a master plus init all branches
git init master

cd master
git commit -am "Initial Commit" --allow-empty
git remote add origin ../remote/
git push --set-upstream origin master
echo "#####    #####     This is branch master..."  | tee master.md
git pull; git add -A; git commit -m "master"; git push;
cd ..

git clone remote/ develop
cd develop
git flow init -d
git push --set-upstream origin develop
echo "#####    #####     This is branch develop..." | tee develop.md
git pull; git add -A; git commit -m "develop"; git push;
for II in $USERS ; do
    echo "$II"
    git flow feature start $II
    git push --set-upstream origin $II
    echo "#####    #####     This is branch $II..." | tee $II.md
    git pull; git add -A; git commit -m "$II"; git push;
    git checkout develop
done
cd ..

for II in $USERS ; do
    git clone remote/ --branch $II --single-branch $II
done

exit
