#!/bin/zsh

#get target version of OS X Catalina and our currently installed OSX Version

targetversion=`softwareupdate --list-full-installers | grep 'Catalina' | cut -f2 -d"," | cut -f2 -d":" | tr -d ' ' | head -n1`
currentVersion=`sw_vers | grep ProductVersion | cut -f2 -d":" | tr -d "\t"`
currentMajorVersion=`sw_vers | grep ProductVersion | cut -f2 -d":" | tr -d "\t" | cut -f1 -d"."`
currentMinorVersion=`sw_vers | grep ProductVersion | cut -f2 -d":" | tr -d "\t" | cut -f2 -d"."`
echo "Target version is $targetversion"
echo "Current version is $currentVersion"

#if we are on OS X 9 or below, we definitely need an upgrade. use the software update utility to pull down the target version and begin the install.

if [ $currentMajorVersion -lt 10 ]
then
	echo "An OS X upgrade is needed"
	echo "Downloading Catalina installer..."
        softwareupdate --fetch-full-installer --full-installer-version $targetversion
        open -n /Applications/Install*Catalina*.app

#if we are on 10.4 or below, upgrade to target Catalina version

elif [ $currentMajorVersion -eq 10 ]
then
	
	if [ $currentMinorVersion -lt 4 ] 
	then
		echo "An OS X upgrade is needed"
		echo "Downloading Catalina installer..."
		softwareupdate --fetch-full-installer --full-installer-version $targetversion
		open -n /Applications/Install*Catalina*.app
	else
		echo "Everything is up to date!"
	fi
else 
	echo "Everything is up to date!"
fi
