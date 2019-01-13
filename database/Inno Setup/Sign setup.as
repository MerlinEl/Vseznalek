InnoSetup is probably the most used setup creation utility out there and it includes support for digital signatures and code signing. Unfortunately it can be a bit hard to configure. Here are some quick instructions for getting code signing up and running using kSign, K Software’s free code signing utility. kSign is free, you can download kSign here. These instructions have been tested with InnoSetup version 5.4.2(a).     Open the InnoSetup IDE    Click Tools -> Configure Sign Tools    Click the Add button    For [Name of the Sign Tool] put kSign    Click OK    For [Command of the Sign Tool] put    "C:\PATH_TO_KSIGN\kSign\kSignCMD.exe" /f "C:\FULL_PATH\YourCert.pfx" /p YOUR_PFX_PASSWORD $p    ONLY INCLUDE THE QUOTES IF THE PATH(s) CONTAINS SPACES!    PFX Password only applies if you password protected your PFX file. Leave out the /p all together if you didn’t. Note that for 64-bit Windows users the PATH_TO_KSIGN will be C:\Program Files (x86)\kSign\ and for 32-bit Windows users the PATH_TO_KSIGN will be C:\Program Files\kSign\ – you always need quotes around any path that contains spaces.    Click OK, then OK again. Now open your setup .iss script file and somewhere in the [Setup] section, put : SignTool=kSign /d $qYOUR_DESCRIPTION$q /du $qhttp://www.example.com$q $f Replace YOUR_DESCRIPTION and www.example.com with your own values. Save the script and you're finished!