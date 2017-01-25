cls
@ECHO OFF
Color A
title PowerOff

:BEGINNING
echo WOULD YOU LIKE TO TURN OFF THE COMPUTER?
echo Y/N
:CONFIRM11
set/p "cho=>"
if %cho%==Y goto POWEROFF
if %cho%==N goto QUESTION
echo INVALID CHOICE
goto CONFIRM1

:QUESTION
echo DO YOU WISH TO CANCEL ANY SCHEDULED SHUTDOWNS?
echo Y/N
:QUESTION2
set/p "ABORT=>"
if %cho%==Y goto CANCEL
if %cho%==N goto ENDSEQUENCE
echo INVALID CHOICE 
goto QUESTION2

:EXIT
echo DO YOU WISH TO EXIT THIS PROGRAM?
echo Y/N
:EXIT2
set/p "cho=>"
if %cho%==%Y% goto EXITSEQUENCE
if %cho%==%N% goto BEGINNING
echo INVALID CHOICE.
goto EXIT2

:POWEROFF
echo TELL ME HOW MANY MINUTES FROM NOW YOU WISH TO TURN IT OFF. 
echo Choices are: 1,5, 10,25,30,45,60,90, Custom
:choose
set/p "min=>"
if %min%==1 goto 1
if %min%==5 goto 5 
if %min%==10 goto 10 
if %min%==25 goto 25
if %min%==30 goto 30
if %min%==45 goto 45
if %min%==60 goto 60
if %min%==90 goto 90
if %min%==custom goto custom
if %min%==cancel goto cancel
echo Invalid Choice
goto choose       

:1 
echo TURNING OFF COMPUTER IN 1 MINUTE/60 SECONDS
shutdown.exe /s /t 60
goto exit

:5
echo Turning off computer in 5 Minutes/300 Seconds
shutdown.exe /s /t 300
goto exit

:10 
echo Turning off computer in 10 Minutes/600 Seconds
shutdown.exe /s /t 600
goto exit

:25
echo Turning off computer in 25 Minutes/1500 Seconds
shutdown.exe /s /t 1500
goto exit

:30
echo Turning off computer in 30 Minutes/1800 Seconds
shutdown.exe /s /t 1800
goto exit

:45
echo Turning off computer in 45 Minutes/2700 Seconds
shutdown.exe /s /t 2700
goto exit 

:60
echo Turning off the computer in 1 Hour/60 Minutes/3600 Seconds
shutdown.exe /s /t 3600
goto exit 

:90
echo Turning off the computer in 1 Hour 30 Minutes/90 Minutes/5400 Seconds
shutdown.exe /s /t 5400
goto exit

:custom
echo Please tell me how many seconds from now you wish for the computer to shut down
set/p "sec=>"
%sec%==%time%
shutdown.exe /s /t %sec%
Shutting down in %sec% seconds. 
goto exit

:cancel
echo Do you wish to cancel the scheduled shutdown?
:confirm1
set/p "cho=>"
if %cho%==Y goto yescancel
if %cho%==N goto nocancel
echo Invalid Choice.
goto confirm1

:yescancel
shutdown.exe -a 
echo shutdown canceled. 
goto Beginning

:nocancel 
goto Beginning
