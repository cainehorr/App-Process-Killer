# App-Process-Killer

Use for killing a macOS app or process with extreme prejudice.

Works on command line via $1 or within Jamf Pro via $4.

## CHOOSE YOUR RUN MODE

Edit lines 69 and 70 of [AppProcessKiller.sh](AppProcessKiller.sh) to choose your desired run mode.

_Default Run Mode is Jamf Pro_

**RUN MODE: COMMAND LINE**
- Uncomment line 69
- Comment out line 70
```
appName="$(/bin/echo ${1})"     # Run Mode: Command Line
# appName="$(/bin/echo ${4})"   # Run Mode: Jamf Pro
```

**RUN MODE: JAMF PRO**
- Comment out line 69
- Uncomment line 70
```
# appName="$(/bin/echo ${1})"   # Run Mode: Command Line
appName="$(/bin/echo ${4})"     # Run Mode: Jamf Pro
```

## RUNNING FROM THE COMMAND LINE
**Syntax:** sudo AppProcessKiller.sh [AppName]

**Examples**
- `sudo AppProcessKiller.sh "Microsoft Office"`
- `sudo AppProcessKiller.sh zoom.us`
- `sudo AppProcessKiller.sh calculator`

## RUNNING FROM WITHIN JAMF PRO
### CONFIGURATION ###
1. Log into your Jamf Pro tenant
2. Navigate to **_Settings_** (Gear Icon)
3. Navigate to **_Computer Management_**
4. Click on the **_Scripts_** icon
5. Click on the **_+ New_** button
6. Set **_Display Name_** to ```AppProcessKiller.sh```
7. Navigate to the **_Script_** tab
8. Copy/Paste [AppProcessKiller.sh](AppProcessKiller.sh) into the **_Script Contents_** text box
9. Navigate to the **_Options_** tab
10. Set **_Priority_** to ```Before```
11. Set **Paramater 4** to ```Application Name (ie Google Chrome)```
12. Click on the **_Save_** button
