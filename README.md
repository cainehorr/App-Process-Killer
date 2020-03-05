# App-Process-Killer

Use for killing a macOS app or process with extreme prejudice.

Works on command line via $1 or within Jamf Pro via $4.

## CHOOSE YOUR RUN MODE

Edit lines 69 and 70 of [AppProcessKiller.sh](AppProcessKiller.sh) to choose your desired run mode.

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
