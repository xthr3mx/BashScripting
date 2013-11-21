#!/bin/bash

URL="www.phrack.org/archives/tgz/phrack"
EXTENSION=".tar.gz" 
NEW_DIRECTORY="Ezines-Directory"

function moveEzinesToEzineDirectory { mkdir $NEW_DIRECTORY; mv *.tar.gz "./$NEW_DIRECTORY";}

function extractFiles {
	cd $NEW_DIRECTORY
	for file in *.tar.gz
		do
			tar -xzf $file
		done
}

function removeFilesDownloaded { rm -Rf *.tar.gz; clear; }

function start {
	echo "Please wait...."
	for counter in {1..68}
		do
			wget ${URL}$counter${EXTENSION}	
		done
	moveEzinesToEzineDirectory
	extractFiles
	removeFilesDownloaded	
	echo -e "
		\n--------------------------------------
		\n E Z I N E S  D O W N L O A D E D
		\n--------------------------------------
		\n\n N E V E R   G I V E   U P !
		"
}

start
