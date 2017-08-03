#!/bin/bash

curDate=`date +%Y-%m-%d`
backupDir="backup-$curDate"

if [ -d "$backupDir" ]; then
	mv "$backupDir" "${backupDir}-old"
else
	mkdir "$backupDir"
fi

baseDir=~
echo baseDir: $baseDir


backup(){
	dir=$1
	if [ -f "$dir" ]; then
		echo -e "\e[34m[Backuping]\e[0m Backuping file: $dir..."
		cp "$dir" "$backupDir/"
		echo -e "\e[33m[OK]\e[0m Backup OK."
	else
		if [ -d "$dir" ]; then
			echo -e "\e[34m[Backuping]\e[0m Backuping dir: $dir..."
			cp -r "$dir" "$backupDir"
			echo -e "\e[33m[OK]\e[0m Backup OK."
		else
			echo -e "\e[31m[Error]\e[0m $dir is not a directory."
		fi
	fi
}


backup "$baseDir/javaProject"
backup "$baseDir/knowledgeBase"
backup "$baseDir/learn"
backup "$baseDir/learnJava"
backup "$baseDir/learnKeras"
backup "$baseDir/littlePrograms"
backup "$baseDir/tmp"
backup "$baseDir/vim-javacomplete2"
backup "$baseDir/.vim"
backup "$baseDir/.bashrc"
backup "$baseDir/.tmux*"

echo -e "\e[33m[Compress]\e[0m Compressing the backup directory"
backupDirTgz="${backupDir}.tgz" 
tar -cvzf "$backupDirTgz" "$backupDir"
echo -e "\e[34m[OK]\e[0mBackup Compressed File is saved in `pwd`/$backupDirTgz"
echo "Finish."
