#!/bin/bash

URL="www.set-ezine.org/ezines/set/txt/set"
EXTENSION=".zip" 
NEW_DIRECTORY="SetEzines-Directory"

function moveEzinesToSetEzineDirectory { mkdir $NEW_DIRECTORY; mv *.zip "./$NEW_DIRECTORY";}

function extractFiles {
	cd $NEW_DIRECTORY
	for file in *.zip
		do
			temp=${file%%.*}
			unzip $file -d $temp 
		done
}

function removeFilesDownloaded { rm -Rf *.zip; clear; }

function start {
	echo "Please wait...."
	for counter in {1..38}
		do
			wget ${URL}$counter${EXTENSION}	
		done
	moveEzinesToSetEzineDirectory
	extractFiles
	removeFilesDownloaded	
	echo -e "
		\n--------------------------------------
		\n S - E Z I N E S  D O W N L O A D E D
		\n--------------------------------------
		\n\n N E V E R   G I V E   U P !
		"
}

start
