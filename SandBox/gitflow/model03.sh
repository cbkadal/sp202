#!/bin/bash
# REV04 Thu 29 Oct 2020 07:05:20 AM WIB
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
# This will NUKE ALL user1, user2, user2, .remote, master
rm -rf $USERS .remote master 

# Create a new .remote
git init .remote --bare

# Create a master plus init all branches
git init master

cd master
git commit -am "Initial Commit" --allow-empty
git remote add origin ../.remote/
git push --set-upstream origin master
cat > README.md << NNNN
\`\`\`
# This is HOW ME DO IT!
## By $(echo $USER) ($(date +"%Y-%m-%d-%H:%M:%S"))

* do not forget to install: apt-get install git-flow

* this model has several 'independent' repos (folders).

  * Repo '.remote/' can be replaced with a github.com repo.

  * Repos 'master/', 'user1/', etc.
\`\`\`
NNNN
git pull;git add -A;git commit -m "cbkadal OSP";git push;
git flow init -d
git push --set-upstream origin develop
cd ..

for II in $USERS ; do
    git clone .remote/ $II
    cd $II
    git flow init -d
    git flow feature start   $II
    git flow feature publish $II
    cd ..
done

for II in $(ls) ; do
    [ -d $II ] || continue
    cd $II
    git pull --all
    cd ..
done

cd master
git checkout develop
git flow release start   v1.0
git flow release publish v1.0 
git flow release finish  v1.0 -m "v1.0"
git push origin --tags
git pull
git flow hotfix start   v1.0.1
git flow hotfix publish v1.0.1
git flow hotfix finish  v1.0.1 -m "v1.0.1"
git push origin --tags
git checkout master

exit

