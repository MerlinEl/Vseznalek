"$(FrameworkSDKDir)bin\\x86\signtool.exe" sign /v /f "path-to-your-cert\yourcert.pfx" /p password "$(TargetPath)" > "$(OutDir)sign\$(ProjectName)-sign.out"