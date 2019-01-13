@ECHO OFF:: No command line parameters requiredIF NOT "%1"=="" GOTO Syntax :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :::: Adjust the LANDesk server name and the drive and directory if necessary :::: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: :: ::SET LANDeskServer=MyLDServerC:CD\LDClient ECHO Removing old LANDesk agent ID :: Delete old ID file (adjust drive if necessary)IF EXIST C:\LDIScan.cfg ATTRIB -h -r -s C:\LDIScan.cfgIF EXIST C:\LDIScan.cfg DEL C:\LDIScan.cfg :: Delete old ID from the registry (Local Machine):: Create a temporary REG file> %TEMP%.\UniqueID.reg ECHO REGEDIT4>>%TEMP%.\UniqueID.reg ECHO.>>%TEMP%.\UniqueID.reg ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Intel\LANDesk\Common Api]>>%TEMP%.\UniqueID.reg ECHO "UniqueID"=->>%TEMP%.\UniqueID.reg ECHO. :: Check if previous ID was stored for Current User and if so, delete itIF EXIST %TEMP%.\_Unique_.REG DEL %TEMP%.\_Unique_.REGREGEDIT /E %TEMP%.\_Unique_.REG "HKEY_CURRENT_USER\SOFTWARE\Intel\LANDesk\LDWM\LDIScan32"TYPE %TEMP%.\_Unique_.REG | FIND /I "Last Device ID" >NUL 2>&1IF ERRORLEVEL 1 GOTO Next>>%TEMP%.\UniqueID.reg ECHO [HKEY_CURRENT_USER\SOFTWARE\Intel\LANDesk\LDWM\LDIScan32]>>%TEMP%.\UniqueID.reg ECHO "Last Device ID"=->>%TEMP%.\UniqueID.reg ECHO. :: Repeat for Default User:NextIF EXIST %TEMP%.\_Unique_.REG DEL %TEMP%.\_Unique_.REGREGEDIT /E %TEMP%.\_Unique_.REG "HKEY_USERS\.Default\SOFTWARE\Intel\LANDesk\LDWM\LDIScan32"TYPE %TEMP%.\_Unique_.REG | FIND /I "Last Device ID" >NUL 2>&1IF ERRORLEVEL 1 GOTO MergeDEL %TEMP%.\_Unique_.REG>>%TEMP%.\UniqueID.reg ECHO [HKEY_USERS\.Default\SOFTWARE\Intel\LANDesk\LDWM\LDIScan32]>>%TEMP%.\UniqueID.reg ECHO "Last Device ID"=->>%TEMP%.\UniqueID.reg ECHO. :: Merge (import) the REG file to delete the UniqueID entry:MergeREGEDIT /S %TEMP%.\UniqueID.reg:: Delete the temporary REG fileDEL %TEMP%.\UniqueID.reg ECHO Creating new LANDesk agent ID :: Start inventory scan to create new IDLDISCN32.EXE /NTT=%LANDeskServer%:5007 /S="%LANDeskServer%" /I=\\%LANDeskServer%\LDLOGON\ldappl.ini /V ECHO DoneIF EXIST %TEMP%.\_Unique_.REG DEL %TEMP%.\_Unique_.REGSET LANDeskServer=CD\GOTO End :SyntaxECHO UniqueID.bat,  Version 2.00 for 32-bit WindowsECHO Create a new unique ID for Intel LANDesk agentECHO.ECHO If a computer is installed using a harddisk image (like Norton GhostECHO or PowerQuest's Drive Image) all "clones" will have the same LANDeskECHO agent ID if LANDesk agent was installed when the image was created.ECHO However, the LANDesk agent needs a unique ID to function properly.ECHO You can force a new ID by reinstalling the LANDesk agent software,ECHO but running this batch file can force a new unique ID just as well.ECHO.ECHO Written by Rob van der WoudeECHO http://www.robvanderwoude.com :End