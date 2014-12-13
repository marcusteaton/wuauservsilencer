@echo off

REM Set window title
title wuauservSilencer http://marcus.crisisresponseunit.com/

REM Send user back to here if choice was invalid
:menu

REM Tell user what they are doing
echo WARNING! This tool will stop Windows Update for running until the next reboot, are you SURE you want to do this?
echo Type "N" for no, "Y" for yes.

REM Clear "choice" variable
set choice=

REM Prompt user
set /p choice=Yes/No:

REM List of valid choices 
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='N' goto no
if '%choice%'=='n' goto no
if '%choice%'=='Y' goto yes
if '%choice%'=='y' goto yes

REM If choice was invalid, display message and go back to prompt
echo.
echo "%choice%" is not a valid choice. Please press a key to try again.
echo.
pause > NUL
goto menu
:yes

REM User picked yes, so we will go ahead
cls

REM Stop Windows Update Service
net stop wuauserv

REM Tell user we're done and wait for input, then quit
echo Done, press a key to quit.
pause > NUL
exit
:no

REM Tell user they canceled the task and wait for input, then quit
cls
echo Aborted. Press a key to quit.
pause > NUL
exit