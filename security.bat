@echo off
::for password

ECHO ***WELCOME TO FILE ENCRIPTION AND DECRIPTION ***
ECHO POWERD BY:-ROYAL FAMILY

echo ************************************************
echo ************************************************

:choices
ECHO -----------------------
echo S: SET PASSWORD--------
ECHO E: ENCRIPT FILE--------
ECHO D: DECRIPT FILE--------
ECHO -----------------------
choice /c sed /m "WHAT YOU WANT :"
if %ERRORLEVEL%==1 (goto setpass)
if %ERRORLEVEL%==2 (goto encript)
if %ERRORLEVEL%==3 (goto decript)

echo ***********************
echo ***********************

:setpass
echo N: ENTER NEW PASSWORD
ECHO C: CHANGE YOUR PASSWORD
ECHO ----------------------   
choice /c nc /m "Choose Your Option :"
if %ERRORLEVEL%==1 goto newpass
if %ERRORLEVEL%==2 goto changepass

echo **********************
echo **********************

:newpass

if not defined new (
	set /p new="CREATE YOUR PASSWORD :"
	echo **password created sucessifully**
	goto choices
	) Else (goto changepass)

echo **********************
echo **********************

:changepass

if not defined new (
	echo SET YOUR PASSWORD FIRST..........
	goto newpass
)
set /p prev="ENTER YOUR PREVIOUS PASSWORD :"
IF %prev%==%new% (set /p new ="ENTER NEW PASSWORD :") Else (  
    echo R: RETRY
    ECHO M: GOTO MAIN MENU
    ECHO -----------------------
    choice /c rm /m "NOT MATCH,, WHAT YOU WANT :"
    IF %ERRORLEVEL%==1 goto changepass
    if %ERRORLEVEL%==2 goto choices
	)

echo **********************
echo **********************

::encript
:encript
	set /p e="ENTER FILE PATH FOR ENCRIPTION :"
    attrib +h +s %e%
    echo sucessifully encripted
    echo %e%>encript.txt
    pause
    goto choices

echo **********************
echo **********************

:decript

if defined new (
   set /p password="ENTER YOUR PASSWORD :"
   set /p filename="ENTER FILE PATH FOR DECRIPTION :"
) else (
   echo "CREATE PASSWORD FIRST......"
   goto newpass
   )
IF %password% == %new% if exist %filename% (
	attrib %filename% -h -s
    echo sucessifully decript
	) else (
   echo ** enter valid password and filename **
   echo -------------------------
   goto decript
   )

pause
