#!/bin/sh
# This script was copied with love from https://gist.githubusercontent.com/stefansundin/d465f1e331fc5c632088/raw/install-pre-push.sh 

# curl -fL -s https://raw.githubusercontent.com/johnhaup/git-master-of-metal/master/install-git-master-of-metal.sh | sh
# Uninstall:
# rm .git/hooks/pre-push

GIT_DIR=`git rev-parse --git-common-dir 2> /dev/null`

echo
echo

if [ "$GIT_DIR" == "" ]; then
	echo This does not appear to be a git repo.
	exit 1
fi

if [ -f "$GIT_DIR/hooks/pre-push" ]; then
	echo There is already a pre-push hook installed. Delete it first.
	echo
	echo "    rm '$GIT_DIR/hooks/pre-push'"
	echo
	exit 2
fi

echo Downloading pre-push hook from https://github.com/johnhaup/git-master-of-metal
echo

curl -fL -o "$GIT_DIR/hooks/pre-push" "https://raw.githubusercontent.com/johnhaup/git-master-of-metal/master/pre-push"
mkdir $GIT_DIR/hooks/pre-push-files


curl "$GIT_DIR/hooks/pre-push-files/master_master.mp3" -o "https://raw.githubusercontent.com/johnhaup/git-master-of-metal/master/pre-push-files/master_master.mp3"
curl "$GIT_DIR/hooks/pre-push-files/metallica.txt" -o "https://raw.githubusercontent.com/johnhaup/git-master-of-metal/master/pre-push-files/metallica.txt"
curl "$GIT_DIR/hooks/pre-push-files/pantera.txt" -o "https://raw.githubusercontent.com/johnhaup/git-master-of-metal/master/pre-push-files/pantera.txt"
curl "$GIT_DIR/hooks/pre-push-files/second_prompt.mp3" -o "https://raw.githubusercontent.com/johnhaup/git-master-of-metal/master/pre-push-files/second_prompt.mp3"
curl "$GIT_DIR/hooks/pre-push-files/first_prompt.mp3" -o "https://raw.githubusercontent.com/johnhaup/git-master-of-metal/master/pre-push-files/first_prompt.mp3"
curl "$GIT_DIR/hooks/pre-push-files/force_push_master.mp3" -o "https://raw.githubusercontent.com/johnhaup/git-master-of-metal/master/pre-push-files/force_push_master.mp3"
# # if [ ! -f "$GIT_DIR/hooks/pre-push" ]; then
# 	echo Error downloading pre-push script!
# 	exit 3
# fi

chmod +x "$GIT_DIR/hooks/pre-push"

echo "Git Master of Metal installed in project!!"

exit 0