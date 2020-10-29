#!/bin/bash
# Thu Oct 29 07:21:10 WIB 2020

# (Fixing f* git-flow bugs)
git config --global gitflow.prefix.hotfix  "hotfix/"
git config --global gitflow.prefix.feature "feature/"
git config --global gitflow.prefix.bugfix  "bugfix/"
git config --global gitflow.prefix.release "release/"
git config --global gitflow.prefix.support "support/"

# In this example, 3 users with 3 features.
USERS="user1 user2 user3"
REPOS="     \
    master  \
    $USERS  \
"
rm -rf $REPOS

# REPLACE this REMOTE with YOUR REMOTE!
REMOTE1="git@github.com:rms46/gitFlow.git"
REMOTE2=.remote
REMOTE=$REMOTE2
[ "$REMOTE" == "$REMOTE2" ] && {
    rm -rf $REMOTE
    git init $REMOTE --bare
    git init master
    cd master
    git commit -am "Initial Commit" --allow-empty
    git remote add origin ../$REMOTE
    git push --set-upstream origin master 
    cd ..
}
[ "$REMOTE" == "$REMOTE1" ] && git clone $REMOTE master

cd master
echo "MASTER..."
[ -f ../.shsh ] && cp ../.shsh gitFlow.sh
cat > README.md << NNNN
\`\`\`
# This is HOW ME DO IT!
## By $(echo $USER) ($(date +"%Y-%m-%d-%H:%M:%S"))

* do not forget to install: apt-get install git-flow

* this is a gitFlow model with several 'independent' repos (folders).

May the fork() be with Jolan Tru!
\`\`\`
NNNN
sleep 1; echo "$(date +"%Y-%m-%d-%H:%M:%S") master" >> commit.txt;
git add -A;git commit -m "cbkadal OSP";
git push;
git flow init -d;
sleep 1; echo "$(date +"%Y-%m-%d-%H:%M:%S") develop" >> commit.txt;
git add -A;git commit -m "cbkadal OSP";
git push --set-upstream origin develop;
cd ..

for II in $USERS ; do
    echo "CLONE $II..."
    git clone $REMOTE $II
    cd $II
    git flow init -d
    git flow feature start   $II
    sleep 1; echo "$(date +"%Y-%m-%d-%H:%M:%S") $II" >> commit.txt;
    git add -A;git commit -m "cbkadal OSP";
    git flow feature publish $II
    git flow feature finish  $II
    sleep 1; echo "$(date +"%Y-%m-%d-%H:%M:%S") develop" >> commit.txt;
    git add -A;git commit -m "cbkadal OSP";
    git push --set-upstream origin develop;
    cd ..
done

cd master
git checkout master
git pull
git push
git checkout develop
git pull
git push
git flow release start   v1.0
sleep 1; echo "$(date +"%Y-%m-%d-%H:%M:%S") release v1.0" >> commit.txt;
git add -A;git commit -m "cbkadal OSP";
git flow release publish v1.0
git flow release finish  v1.0 -m "v1.0"
git push origin --tags
git push --all
git checkout master
git push
git flow hotfix start   v1.0.1
sleep 1; echo "$(date +"%Y-%m-%d-%H:%M:%S") hotfix v1.0.1" >> commit.txt;
git add -A;git commit -m "cbkadal OSP";
git flow hotfix publish v1.0.1
git flow hotfix finish  v1.0.1 -m "v1.0.1"
git push origin --tags

exit



