
@echo off
set SERVER=your.server.com
set USERNAME=your_username
set PASSWORD=your_password

:: Stop Server
plink.exe -ssh %USERNAME%@%SERVER% -pw %PASSWORD% "cd /appserver/OnlineChannel/ && ./stopHybris.sh"

:: Delete custom folder
plink.exe -ssh %USERNAME%@%SERVER% -pw %PASSWORD% "cd /appserver/OnlineChannel/hybris/bin && rm -rf custom/"

:: Unzip deployment package
plink.exe -ssh %USERNAME%@%SERVER% -pw %PASSWORD% "cd /appserver/OnlineChannel && unzip -o hybrisServer-AllExtensions.zip"

:: Execute build
plink.exe -ssh %USERNAME%@%SERVER% -pw %PASSWORD% "cd /appserver/OnlineChannel && ./antCleanAll.sh"

:: Start Server
plink.exe -ssh %USERNAME%@%SERVER% -pw %PASSWORD% "cd /appserver/OnlineChannel && ./startHybris.sh"

pause
