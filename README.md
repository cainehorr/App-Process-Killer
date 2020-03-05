# App-Process-Killer

Use for killing a macOS app or process with extreme prejudice.

Works on command line via $1 or within Jamf Pro via $4.

## CHOOSE YOUR RUN MODE

Edit the script to choose your desired run mode.

**RUN MODE: COMMAND LINE**
```
appName="$(/bin/echo ${1})"     # Run Mode: Command Line
# appName="$(/bin/echo ${4})"   # Run Mode: Jamf Pro
```

**RUN MODE: JAMF PRO**
```
# appName="$(/bin/echo ${1})"   # Run Mode: Command Line
appName="$(/bin/echo ${4})"     # Run Mode: Jamf Pro
```

## COMMAND LINE SYNTAX
**Syntax:** sudo AppProcessKiller.sh [AppName]

**Examples**

`sudo AppProcessKiller.sh "Microsoft Office"`

`sudo AppProcessKiller.sh zoom.us`

`sudo AppProcessKiller.sh calculator`
