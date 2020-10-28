#!/bin/bash
# REV03 Wed Oct 28 11:13:07 WIB 2020
# REV02 Sun 25 Oct 2020 11:36:35 AM WIB
# REV01 Sat 24 Oct 2020 07:34:58 PM WIB
# START Sun 18 Oct 2020 06:19:53 AM WIB (rms)

# (Fixing f* git-flow bugs)
git config --global gitflow.prefix.hotfix  "hotfix/"
git config --global gitflow.prefix.feature "feature/"
git config --global gitflow.prefix.bugfix  "bugfix/"
git config --global gitflow.prefix.release "release/"
git config --global gitflow.prefix.support "support/"

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
cat > README.md << NNNN
\`\`\`
# This is HOW ME DO IT!
## By $(echo $USER) ($(date +"%Y-%m-%d-%H:%M:%S"))

* do not forget to install: apt-get install git-flow

* this model is about "WHERE to do WHAT" with git-flow

  * Repo (folder) type 'remote/' can be replaced with a github.com repo.

  * Repo (folder) type 'master/' is related with the 'master branch'.

  * Repo (folder) type 'develop/' is related with all branches. All merges/rebases should be done is this type.

  * Repo (folder) type 'userX/' is related with the 'feature/userX branch'.
\`\`\`
NNNN
git pull;git add -A;git commit -m "cbkadal OSP";git push;
cd ..

git clone remote/ develop
cd develop
git flow init -d
git push --set-upstream origin develop

for II in $USERS ; do
    git flow feature start $II
    git push --set-upstream origin feature/$II
    git checkout develop
done
cd ..

for II in $USERS ; do
    git clone remote/ --branch feature/$II --single-branch $II
done

exit

