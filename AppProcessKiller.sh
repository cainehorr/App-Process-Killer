#!/bin/bash

##############################################################################
#
# SCRIPT FILENAME:
# 	AppProcessKiller.sh
#	https://github.com/cainehorr/App-Process-Killer/
#
##############################################################################
#
# SCRIPT SYNTAX AND EXAMPLE:
# 	Syntax: sudo AppProcessKiller.sh [AppName]
#
# 	Examples
#		sudo AppProcessKiller.sh "Microsoft Office"
#		sudo AppProcessKiller.sh zoom.us
#		sudo AppProcessKiller.sh calculator
#
##############################################################################
#
# DESCRIPTION:
# 	Use for killing a macOS app or process with extreme prejudice.
# 	Works on command line via $1 or within Jamf Pro via $4. 
#
# 	Jamf Variables
# 	https://www.jamf.com/jamf-nation/articles/146/script-parameters
# 		$1 - Predefined Variable (RESERVED) - Mount point of the target drive
# 		$2 - Predefined Variable (RESERVED) - Computer name
# 		$3 - Predefined Variable (RESERVED) - Username
# 		$4 - Custom Variable - Application Name to Terminate
#
##############################################################################
#
# USE CASE:
#	Use as a pre-flight script prior to software updates and upgrades, etc.
#
##############################################################################
#
# CHANGE LOG:
#   v1.4 - 2019-07-26
#       Updated by Caine Hörr <caine@cainehorr.com>
#           * Forcing Exit Code 0 to eliminate false positives... 
#	      ...in Jamf logs due to sudo kill -9 ${i} kicking out Exit Code 1
#
#   v1.3 - 2019-07-26
#       Updated by Caine Hörr <caine@cainehorr.com>
#           * Reverted back to sudo kill -9 but using an array
#
#   v1.2 - 2019-07-26
#       Updated by Caine Hörr <caine@cainehorr.com>
#           * Removed Line: echo "${appName} Process ID: ${processCheck}"
#           * Removed Line: pkill -f ${appName}
#           * Replaced With: killall "${appName}"
#
#   v1.1 - 2019-07-26
#       Updated by Caine Hörr <caine@cainehorr.com>
#           * Removed Line: sudo kill -9 ${processCheck}
#           * Replaced With: pkill -f ${appName}
#
#	v1.0 - 2019-07-09
#		Written by Caine Hörr <caine@cainehorr.com>
#			* Initial Script Creation
#
##############################################################################

##############################################################################
#
# CHOOSE YOUR RUN MODE (COMMENT/UNCOMMENT TO TASTE)
# appName="$(/bin/echo ${1})"		# Run Mode: Command Line
appName="$(/bin/echo ${4})"			# Run Mode: Jamf Pro
#
##############################################################################

##############################################################################
#
# THERE ARE NO USER SERVICABLE PARTS HERE...
# DO NOT EDIT BELOW THIS LINE!
#
##############################################################################

# Confirm the existance of the command line argument
if [ -z "${appName}" ]; then
	echo ""
	echo "ERROR: Missing Argument"
	echo ""
	echo "SYNTAX: sudo ${0} [appName]"
	echo ""
	echo "    EXAMPLES:"
	echo "        sudo ${0} \"Microsoft Office\""
	echo "        sudo ${0} zoom.us"
	echo ""
	exit 1
fi

main(){
	Run_as_Root
    Process_Killer
}

Run_as_Root(){
    # Check for admin/root permissions
    if [ "$(id -u)" != "0" ]; then
    	echo ""
        echo "ERROR: Script must be run as root or with sudo."
        echo ""
        exit 1
    fi
}

Process_Killer(){
    processCheck=$(pgrep -i ${appName})

    if [ "${processCheck}" = "" ]; then
        echo "${appName} is not running..."
        echo "Nothing to do..."
    else
        echo "${appName} is running..."
        echo "Proccess IDs Associated with ${appName}:"
        echo "${processCheck}"
        echo
        echo "Quiting ${appName}..."
        echo

        ARRAY=($processCheck)

        for i in "${ARRAY[@]}"
        do
            echo "Killing Process ID: ${i}"
            sudo kill -9 ${i}
        done
    fi
}

main

exit 0
