# App-Process-Killer

Use for killing a macOS app or process with extreme prejudice.

Use as a pre-flight script prior to software updates and upgrades, etc.

Works on command line via $1 or within Jamf Pro via $4.

## CHOOSE YOUR RUN MODE

Edit lines 69 and 70 of [AppProcessKiller.sh](AppProcessKiller.sh) to choose your desired run mode.

_The default Run Mode is `Jamf Pro`_


#### RUN MODE: COMMAND LINE ####
- Uncomment line 69
- Comment out line 70
```
appName="$(/bin/echo ${1})"     # Run Mode: Command Line
# appName="$(/bin/echo ${4})"   # Run Mode: Jamf Pro
```


#### RUN MODE: JAMF PRO ####
- Comment out line 69
- Uncomment line 70
```
# appName="$(/bin/echo ${1})"   # Run Mode: Command Line
appName="$(/bin/echo ${4})"     # Run Mode: Jamf Pro
```

## RUNNING FROM THE COMMAND LINE
_Ensure that you have edited the script to be in the proper [Run Mode for Command Line](#choose-your-run-mode)_

**Syntax:** sudo AppProcessKiller.sh [AppName]

**Examples**
- `sudo AppProcessKiller.sh "Microsoft Office"`
- `sudo AppProcessKiller.sh zoom.us`
- `sudo AppProcessKiller.sh calculator`

## RUNNING FROM WITHIN JAMF PRO
### SCRIPT CONFIGURATION ###
_Ensure that you have edited the script to be in the proper [Run Mode for Jamf Pro](#choose-your-run-mode)_

1. Log into your Jamf Pro tenant
2. Navigate to **_Settings_** (Gear Icon)
3. Navigate to **_Computer Management_**
4. Click on the **_Scripts_** icon
5. Click on the **_+ New_** button
6. Navigate to the **_General_** tab
7. Set **_Display Name_** to ```AppProcessKiller.sh```
8. Navigate to the **_Script_** tab
9. Copy/Paste [AppProcessKiller.sh](AppProcessKiller.sh) into the **_Script Contents_** text box
10. Navigate to the **_Options_** tab
11. Set **_Priority_** to ```Before```
12. Set **_Paramater 4_** to ```Application Name (ie Google Chrome)```
13. Click on the **_Save_** button

### POLICY CONFIGURATION - SCRIPT USEAGE ###
1. Log into your Jamf Pro tenant
2. Navigate to **_Computers_**
3. Navigate to **_Policies_**
4. Click on the **_+ New_** button
5. Navigate to **_Options_** tab
6. Navigate to the **_Scripts_** sidebar option
7. Click the **_Configure_** button on the **_Configure Scripts_** page
8. Select **_AppProcessKiller.sh_** by clicking the **_Add_** button
9. Set **_Priority_** to ```Before```
10. Set **_Application Name_** to the name of the application or process you wish to terminate (ie Google Chrome)
11. Complete the remaining policy configuration details that you require
12. Click on the **_Save_** button
