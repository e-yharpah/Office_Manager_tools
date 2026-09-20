@echo off

@setlocal EnableExtensions EnableDelayedExpansion

@chcp 437 >nul
title Microsoft Office Manager V1.0

:: =========================
:: Self elevate
:: =========================
net session >nul 2>&1
if not "%errorlevel%"=="0" (
  powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
  exit /b
)
cd /d "%~dp0"
set "ROOT=%~dp0"
set "ODT=%ROOT%setup.exe"

call :EnsureODT
if errorlevel 1 (
  echo.
  echo Office Deployment Tool could not be prepared.
  pause
  exit /b 1
)

goto MAIN

:MAIN
cls
call :DetectOffice
echo ============================================================
echo                 MICROSOFT OFFICE MANAGER V1.0
echo ============================================================
if /I "!CURPRODUCT!"=="Not detected" (
  echo Current Office : NOT INSTALLED
  echo Architecture   : -
  echo Channel        : -
  echo Activation     : -
) else (
  echo Current Office : !CURPRODUCT!
  echo Architecture   : !CURARCH!
  echo Channel        : !CURCHANNEL!
)
echo ODT            : READY
echo ============================================================
echo [1] Install Office / Project / Visio
echo [2] Convert / Migrate Office
echo [3] Activation ^& Product Key
echo [4] Language Packs
echo [5] Office Information
echo [6] Uninstall Office
echo [7] Update Office Deployment Tool
echo [0] Exit
echo ============================================================
set /p "M=Select: "
if "%M%"=="1" goto INSTALLMENU
if "%M%"=="2" goto CONVERTMENU
if "%M%"=="3" goto ACTMENU
if "%M%"=="4" goto LANGMENU
if "%M%"=="5" goto INFO
if "%M%"=="6" goto UNINSTALL
if "%M%"=="7" (call :UpdateODT & pause & goto MAIN)
if "%M%"=="0" exit /b
goto MAIN

:INSTALLMENU
cls
echo ============================================================
echo                       INSTALL OFFICE
echo ============================================================
echo [1] Office 2019 - All Editions
echo [2] Office 2021 - All Editions
echo [3] Office 2024 - All Editions
echo.
echo [P] Project 2019 / 2021 / 2024
echo [V] Visio 2019 / 2021 / 2024
echo [0] Back
echo ============================================================
set /p "I=Select: "
if "%I%"=="1" goto OFFICE2019
if "%I%"=="2" goto OFFICE2021
if "%I%"=="3" goto OFFICE2024
if /I "%I%"=="P" goto PROJECTMENU
if /I "%I%"=="V" goto VISIOMENU
if "%I%"=="0" goto MAIN
goto INSTALLMENU

:OFFICE2019
cls
echo ============================================================
echo                         OFFICE 2019
echo ============================================================
echo SUITES
echo [1] Professional Plus 2019 - Volume
echo [2] Professional 2019 - Retail
echo [3] Standard 2019 - Volume
echo [4] Home ^& Business 2019 - Retail
echo [5] Home ^& Student 2019 - Retail
echo [6] Personal 2019 - Retail
echo.
echo INDIVIDUAL APPLICATIONS
echo [7]  Access 2019 - Retail
echo [8]  Access 2019 - Volume
echo [9]  Excel 2019 - Retail
echo [10] Excel 2019 - Volume
echo [11] Outlook 2019 - Retail
echo [12] Outlook 2019 - Volume
echo [13] PowerPoint 2019 - Retail
echo [14] PowerPoint 2019 - Volume
echo [15] Publisher 2019 - Retail
echo [16] Publisher 2019 - Volume
echo [17] Word 2019 - Retail
echo [18] Word 2019 - Volume
echo.
echo [P] Project 2019
echo [V] Visio 2019
echo [0] Back
set /p "I=Select: "
if "%I%"=="1" (call :SetProduct "Professional Plus 2019 - Volume" "ProPlus2019Volume" "PerpetualVL2019" & goto INSTALL_OPTIONS)
if "%I%"=="2" (call :SetProduct "Professional 2019 - Retail" "Professional2019Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="3" (call :SetProduct "Standard 2019 - Volume" "Standard2019Volume" "PerpetualVL2019" & goto INSTALL_OPTIONS)
if "%I%"=="4" (call :SetProduct "Home and Business 2019 - Retail" "HomeBusiness2019Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="5" (call :SetProduct "Home and Student 2019 - Retail" "HomeStudent2019Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="6" (call :SetProduct "Personal 2019 - Retail" "Personal2019Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="7" (call :SetProduct "Access 2019 - Retail" "Access2019Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="8" (call :SetProduct "Access 2019 - Volume" "Access2019Volume" "PerpetualVL2019" & goto INSTALL_OPTIONS)
if "%I%"=="9" (call :SetProduct "Excel 2019 - Retail" "Excel2019Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="10" (call :SetProduct "Excel 2019 - Volume" "Excel2019Volume" "PerpetualVL2019" & goto INSTALL_OPTIONS)
if "%I%"=="11" (call :SetProduct "Outlook 2019 - Retail" "Outlook2019Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="12" (call :SetProduct "Outlook 2019 - Volume" "Outlook2019Volume" "PerpetualVL2019" & goto INSTALL_OPTIONS)
if "%I%"=="13" (call :SetProduct "PowerPoint 2019 - Retail" "PowerPoint2019Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="14" (call :SetProduct "PowerPoint 2019 - Volume" "PowerPoint2019Volume" "PerpetualVL2019" & goto INSTALL_OPTIONS)
if "%I%"=="15" (call :SetProduct "Publisher 2019 - Retail" "Publisher2019Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="16" (call :SetProduct "Publisher 2019 - Volume" "Publisher2019Volume" "PerpetualVL2019" & goto INSTALL_OPTIONS)
if "%I%"=="17" (call :SetProduct "Word 2019 - Retail" "Word2019Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="18" (call :SetProduct "Word 2019 - Volume" "Word2019Volume" "PerpetualVL2019" & goto INSTALL_OPTIONS)
if /I "%I%"=="P" goto PROJECTMENU
if /I "%I%"=="V" goto VISIOMENU
if "%I%"=="0" goto INSTALLMENU
goto OFFICE2019

:OFFICE2021
cls
echo ============================================================
echo                         OFFICE 2021
echo ============================================================
echo SUITES
echo [1] Professional Plus 2021 - Retail
echo [2] Professional Plus / LTSC 2021 - Volume
echo [3] Professional 2021 - Retail
echo [4] Standard / LTSC 2021 - Volume
echo [5] Home ^& Business 2021 - Retail
echo [6] Home ^& Student 2021 - Retail
echo [7] Personal 2021 - Retail
echo.
echo INDIVIDUAL APPLICATIONS
echo [8]  Access 2021 - Retail
echo [9]  Access 2021 - Volume
echo [10] Excel 2021 - Retail
echo [11] Excel 2021 - Volume
echo [12] Outlook 2021 - Retail
echo [13] Outlook 2021 - Volume
echo [14] PowerPoint 2021 - Retail
echo [15] PowerPoint 2021 - Volume
echo [16] Publisher 2021 - Retail
echo [17] Publisher 2021 - Volume
echo [18] Word 2021 - Retail
echo [19] Word 2021 - Volume
echo [20] OneNote 2021 - Volume
echo.
echo [P] Project 2021
echo [V] Visio 2021
echo [0] Back
set /p "I=Select: "
if "%I%"=="1" (call :SetProduct "Professional Plus 2021 - Retail" "ProPlus2021Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="2" (call :SetProduct "Professional Plus LTSC 2021 - Volume" "ProPlus2021Volume" "PerpetualVL2021" & goto INSTALL_OPTIONS)
if "%I%"=="3" (call :SetProduct "Professional 2021 - Retail" "Professional2021Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="4" (call :SetProduct "Standard LTSC 2021 - Volume" "Standard2021Volume" "PerpetualVL2021" & goto INSTALL_OPTIONS)
if "%I%"=="5" (call :SetProduct "Home and Business 2021 - Retail" "HomeBusiness2021Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="6" (call :SetProduct "Home and Student 2021 - Retail" "HomeStudent2021Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="7" (call :SetProduct "Personal 2021 - Retail" "Personal2021Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="8" (call :SetProduct "Access 2021 - Retail" "Access2021Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="9" (call :SetProduct "Access 2021 - Volume" "Access2021Volume" "PerpetualVL2021" & goto INSTALL_OPTIONS)
if "%I%"=="10" (call :SetProduct "Excel 2021 - Retail" "Excel2021Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="11" (call :SetProduct "Excel 2021 - Volume" "Excel2021Volume" "PerpetualVL2021" & goto INSTALL_OPTIONS)
if "%I%"=="12" (call :SetProduct "Outlook 2021 - Retail" "Outlook2021Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="13" (call :SetProduct "Outlook 2021 - Volume" "Outlook2021Volume" "PerpetualVL2021" & goto INSTALL_OPTIONS)
if "%I%"=="14" (call :SetProduct "PowerPoint 2021 - Retail" "PowerPoint2021Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="15" (call :SetProduct "PowerPoint 2021 - Volume" "PowerPoint2021Volume" "PerpetualVL2021" & goto INSTALL_OPTIONS)
if "%I%"=="16" (call :SetProduct "Publisher 2021 - Retail" "Publisher2021Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="17" (call :SetProduct "Publisher 2021 - Volume" "Publisher2021Volume" "PerpetualVL2021" & goto INSTALL_OPTIONS)
if "%I%"=="18" (call :SetProduct "Word 2021 - Retail" "Word2021Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="19" (call :SetProduct "Word 2021 - Volume" "Word2021Volume" "PerpetualVL2021" & goto INSTALL_OPTIONS)
if "%I%"=="20" (call :SetProduct "OneNote 2021 - Volume" "OneNote2021Volume" "PerpetualVL2021" & goto INSTALL_OPTIONS)
if /I "%I%"=="P" goto PROJECTMENU
if /I "%I%"=="V" goto VISIOMENU
if "%I%"=="0" goto INSTALLMENU
goto OFFICE2021

:OFFICE2024
cls
echo ============================================================
echo                         OFFICE 2024
echo ============================================================
echo SUITES
echo [1] Professional Plus 2024 - Retail
echo [2] Professional Plus / LTSC 2024 - Volume
echo [3] Professional 2024 - Retail
echo [4] Standard / LTSC 2024 - Volume
echo [5] Home ^& Business 2024 - Retail
echo [6] Home 2024 - Retail
echo.
echo INDIVIDUAL APPLICATIONS
echo [7]  Access 2024 - Retail
echo [8]  Access 2024 - Volume
echo [9]  Excel 2024 - Retail
echo [10] Excel 2024 - Volume
echo [11] Outlook 2024 - Retail
echo [12] Outlook 2024 - Volume
echo [13] PowerPoint 2024 - Retail
echo [14] PowerPoint 2024 - Volume
echo [15] Word 2024 - Retail
echo [16] Word 2024 - Volume
echo [17] OneNote 2024 - Volume
echo.
echo [P] Project 2024
echo [V] Visio 2024
echo [0] Back
set /p "I=Select: "
if "%I%"=="1" (call :SetProduct "Professional Plus 2024 - Retail" "ProPlus2024Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="2" (call :SetProduct "Professional Plus LTSC 2024 - Volume" "ProPlus2024Volume" "PerpetualVL2024" & goto INSTALL_OPTIONS)
if "%I%"=="3" (call :SetProduct "Professional 2024 - Retail" "Professional2024Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="4" (call :SetProduct "Standard LTSC 2024 - Volume" "Standard2024Volume" "PerpetualVL2024" & goto INSTALL_OPTIONS)
if "%I%"=="5" (call :SetProduct "Home and Business 2024 - Retail" "HomeBusiness2024Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="6" (call :SetProduct "Home 2024 - Retail" "Home2024Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="7" (call :SetProduct "Access 2024 - Retail" "Access2024Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="8" (call :SetProduct "Access 2024 - Volume" "Access2024Volume" "PerpetualVL2024" & goto INSTALL_OPTIONS)
if "%I%"=="9" (call :SetProduct "Excel 2024 - Retail" "Excel2024Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="10" (call :SetProduct "Excel 2024 - Volume" "Excel2024Volume" "PerpetualVL2024" & goto INSTALL_OPTIONS)
if "%I%"=="11" (call :SetProduct "Outlook 2024 - Retail" "Outlook2024Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="12" (call :SetProduct "Outlook 2024 - Volume" "Outlook2024Volume" "PerpetualVL2024" & goto INSTALL_OPTIONS)
if "%I%"=="13" (call :SetProduct "PowerPoint 2024 - Retail" "PowerPoint2024Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="14" (call :SetProduct "PowerPoint 2024 - Volume" "PowerPoint2024Volume" "PerpetualVL2024" & goto INSTALL_OPTIONS)
if "%I%"=="15" (call :SetProduct "Word 2024 - Retail" "Word2024Retail" "Current" & goto INSTALL_OPTIONS)
if "%I%"=="16" (call :SetProduct "Word 2024 - Volume" "Word2024Volume" "PerpetualVL2024" & goto INSTALL_OPTIONS)
if "%I%"=="17" (call :SetProduct "OneNote 2024 - Volume" "OneNote2024Volume" "PerpetualVL2024" & goto INSTALL_OPTIONS)
if /I "%I%"=="P" goto PROJECTMENU
if /I "%I%"=="V" goto VISIOMENU
if "%I%"=="0" goto INSTALLMENU
goto OFFICE2024

:PROJECTMENU
cls
echo ====================== PROJECT ======================
echo [1] Project Professional 2019 - Retail
echo [2] Project Professional 2019 - Volume
echo [3] Project Standard 2019 - Retail
echo [4] Project Standard 2019 - Volume
echo [5] Project Professional 2021 - Retail
echo [6] Project Professional 2021 - Volume
echo [7] Project Standard 2021 - Retail
echo [8] Project Standard 2021 - Volume
echo [9] Project Professional 2024 - Retail
echo [10] Project Professional 2024 - Volume
echo [11] Project Standard 2024 - Retail
echo [12] Project Standard 2024 - Volume
echo [0] Back
set /p "I=Select: "
if "%I%"=="1" (set "PN=Project Professional 2019 Retail"&set "PID=ProjectPro2019Retail"&set "CH=Current"&goto INSTALL_OPTIONS)
if "%I%"=="2" (set "PN=Project Professional 2019 Volume"&set "PID=ProjectPro2019Volume"&set "CH=PerpetualVL2019"&goto INSTALL_OPTIONS)
if "%I%"=="3" (set "PN=Project Standard 2019 Retail"&set "PID=ProjectStd2019Retail"&set "CH=Current"&goto INSTALL_OPTIONS)
if "%I%"=="4" (set "PN=Project Standard 2019 Volume"&set "PID=ProjectStd2019Volume"&set "CH=PerpetualVL2019"&goto INSTALL_OPTIONS)
if "%I%"=="5" (set "PN=Project Professional 2021 Retail"&set "PID=ProjectPro2021Retail"&set "CH=Current"&goto INSTALL_OPTIONS)
if "%I%"=="6" (set "PN=Project Professional 2021 Volume"&set "PID=ProjectPro2021Volume"&set "CH=PerpetualVL2021"&goto INSTALL_OPTIONS)
if "%I%"=="7" (set "PN=Project Standard 2021 Retail"&set "PID=ProjectStd2021Retail"&set "CH=Current"&goto INSTALL_OPTIONS)
if "%I%"=="8" (set "PN=Project Standard 2021 Volume"&set "PID=ProjectStd2021Volume"&set "CH=PerpetualVL2021"&goto INSTALL_OPTIONS)
if "%I%"=="9" (set "PN=Project Professional 2024 Retail"&set "PID=ProjectPro2024Retail"&set "CH=Current"&goto INSTALL_OPTIONS)
if "%I%"=="10" (set "PN=Project Professional 2024 Volume"&set "PID=ProjectPro2024Volume"&set "CH=PerpetualVL2024"&goto INSTALL_OPTIONS)
if "%I%"=="11" (set "PN=Project Standard 2024 Retail"&set "PID=ProjectStd2024Retail"&set "CH=Current"&goto INSTALL_OPTIONS)
if "%I%"=="12" (set "PN=Project Standard 2024 Volume"&set "PID=ProjectStd2024Volume"&set "CH=PerpetualVL2024"&goto INSTALL_OPTIONS)
if "%I%"=="0" goto INSTALLMENU
goto PROJECTMENU

:VISIOMENU
cls
echo ======================= VISIO =======================
echo [1] Visio Professional 2019 - Retail
echo [2] Visio Professional 2019 - Volume
echo [3] Visio Standard 2019 - Retail
echo [4] Visio Standard 2019 - Volume
echo [5] Visio Professional 2021 - Retail
echo [6] Visio Professional 2021 - Volume
echo [7] Visio Standard 2021 - Retail
echo [8] Visio Standard 2021 - Volume
echo [9] Visio Professional 2024 - Retail
echo [10] Visio Professional 2024 - Volume
echo [11] Visio Standard 2024 - Retail
echo [12] Visio Standard 2024 - Volume
echo [0] Back
set /p "I=Select: "
if "%I%"=="1" (set "PN=Visio Professional 2019 Retail"&set "PID=VisioPro2019Retail"&set "CH=Current"&goto INSTALL_OPTIONS)
if "%I%"=="2" (set "PN=Visio Professional 2019 Volume"&set "PID=VisioPro2019Volume"&set "CH=PerpetualVL2019"&goto INSTALL_OPTIONS)
if "%I%"=="3" (set "PN=Visio Standard 2019 Retail"&set "PID=VisioStd2019Retail"&set "CH=Current"&goto INSTALL_OPTIONS)
if "%I%"=="4" (set "PN=Visio Standard 2019 Volume"&set "PID=VisioStd2019Volume"&set "CH=PerpetualVL2019"&goto INSTALL_OPTIONS)
if "%I%"=="5" (set "PN=Visio Professional 2021 Retail"&set "PID=VisioPro2021Retail"&set "CH=Current"&goto INSTALL_OPTIONS)
if "%I%"=="6" (set "PN=Visio Professional 2021 Volume"&set "PID=VisioPro2021Volume"&set "CH=PerpetualVL2021"&goto INSTALL_OPTIONS)
if "%I%"=="7" (set "PN=Visio Standard 2021 Retail"&set "PID=VisioStd2021Retail"&set "CH=Current"&goto INSTALL_OPTIONS)
if "%I%"=="8" (set "PN=Visio Standard 2021 Volume"&set "PID=VisioStd2021Volume"&set "CH=PerpetualVL2021"&goto INSTALL_OPTIONS)
if "%I%"=="9" (set "PN=Visio Professional 2024 Retail"&set "PID=VisioPro2024Retail"&set "CH=Current"&goto INSTALL_OPTIONS)
if "%I%"=="10" (set "PN=Visio Professional 2024 Volume"&set "PID=VisioPro2024Volume"&set "CH=PerpetualVL2024"&goto INSTALL_OPTIONS)
if "%I%"=="11" (set "PN=Visio Standard 2024 Retail"&set "PID=VisioStd2024Retail"&set "CH=Current"&goto INSTALL_OPTIONS)
if "%I%"=="12" (set "PN=Visio Standard 2024 Volume"&set "PID=VisioStd2024Volume"&set "CH=PerpetualVL2024"&goto INSTALL_OPTIONS)
if "%I%"=="0" goto INSTALLMENU
goto VISIOMENU

:INSTALL_OPTIONS
cls
call :DetectOffice
set "ARCH=64"
if /I "!CURARCH!"=="x86" set "ARCH=32"
echo ============================================================
echo Product: %PN%
echo Product ID: %PID%
echo Channel: %CH%
echo ============================================================
echo Architecture:
echo [1] 64-bit
echo [2] 32-bit
echo [3] Match currently installed Office (!CURARCH!)
set /p "A=Select [1]: "
if "%A%"=="2" set "ARCH=32"
if "%A%"=="3" if /I "!CURARCH!"=="x86" set "ARCH=32"
if "%A%"=="3" if /I "!CURARCH!"=="x64" set "ARCH=64"
echo.
echo Language:
echo [1] English
echo [2] Arabic
echo [3] English + Arabic
echo [4] Turkish
echo [5] Match Windows language
set /p "L=Select [1]: "
set "LANGXML=      ^<Language ID="en-us" /^>"
if "%L%"=="2" set "LANGXML=      ^<Language ID="ar-sa" /^>"
if "%L%"=="3" set "LANGXML=      ^<Language ID="en-us" /^>!LF!      ^<Language ID="ar-sa" /^>"
if "%L%"=="4" set "LANGXML=      ^<Language ID="tr-tr" /^>"
if "%L%"=="5" set "LANGXML=      ^<Language ID="MatchOS" /^>"
if "%ISSUITE%"=="1" goto APPMODE
set "EXCLUDES="
goto INSTALL_SUMMARY

:APPMODE
cls
echo ============================================================
echo                    SELECT OFFICE APPS
echo ============================================================
echo [1] Recommended - Word Excel PowerPoint Outlook Access OneNote
echo     Skips Skype, OneDrive, Teams and Publisher
echo [2] Install all applications included with this edition
echo [3] Custom selection
echo [0] Cancel
set /p "AM=Select: "
if "%AM%"=="1" (set "EXCLUDES=Lync Groove OneDrive Teams Publisher"&goto INSTALL_SUMMARY)
if "%AM%"=="2" (set "EXCLUDES="&goto INSTALL_SUMMARY)
if "%AM%"=="3" goto CUSTOMAPPS
if "%AM%"=="0" goto MAIN
goto APPMODE

:CUSTOMAPPS
set "APP_Word=1"
set "APP_Excel=1"
set "APP_PowerPoint=1"
set "APP_Outlook=1"
set "APP_Access=1"
set "APP_OneNote=1"
set "APP_Publisher=0"
set "APP_Lync=0"
set "APP_OneDrive=0"
set "APP_Teams=0"
:CUSTOMLOOP
cls
echo ============================================================
echo                  CUSTOM OFFICE INSTALLATION
echo ============================================================
call :ShowApp 1 Word APP_Word
call :ShowApp 2 Excel APP_Excel
call :ShowApp 3 PowerPoint APP_PowerPoint
call :ShowApp 4 Outlook APP_Outlook
call :ShowApp 5 Access APP_Access
call :ShowApp 6 OneNote APP_OneNote
call :ShowApp 7 Publisher APP_Publisher
call :ShowApp 8 Skype APP_Lync
call :ShowApp 9 OneDrive APP_OneDrive
call :ShowApp 10 Teams APP_Teams
echo.
echo Enter a number to toggle INSTALL/SKIP.
echo [S] Start  [R] Recommended  [A] All  [N] None  [0] Cancel
set /p "AP=Select: "
if "%AP%"=="1" (call :Toggle APP_Word&goto CUSTOMLOOP)
if "%AP%"=="2" (call :Toggle APP_Excel&goto CUSTOMLOOP)
if "%AP%"=="3" (call :Toggle APP_PowerPoint&goto CUSTOMLOOP)
if "%AP%"=="4" (call :Toggle APP_Outlook&goto CUSTOMLOOP)
if "%AP%"=="5" (call :Toggle APP_Access&goto CUSTOMLOOP)
if "%AP%"=="6" (call :Toggle APP_OneNote&goto CUSTOMLOOP)
if "%AP%"=="7" (call :Toggle APP_Publisher&goto CUSTOMLOOP)
if "%AP%"=="8" (call :Toggle APP_Lync&goto CUSTOMLOOP)
if "%AP%"=="9" (call :Toggle APP_OneDrive&goto CUSTOMLOOP)
if "%AP%"=="10" (call :Toggle APP_Teams&goto CUSTOMLOOP)
if /I "%AP%"=="R" (set "APP_Word=1"&set "APP_Excel=1"&set "APP_PowerPoint=1"&set "APP_Outlook=1"&set "APP_Access=1"&set "APP_OneNote=1"&set "APP_Publisher=0"&set "APP_Lync=0"&set "APP_OneDrive=0"&set "APP_Teams=0"&goto CUSTOMLOOP)
if /I "%AP%"=="A" (for %%Z in (Word Excel PowerPoint Outlook Access OneNote Publisher Lync OneDrive Teams) do set "APP_%%Z=1"&goto CUSTOMLOOP)
if /I "%AP%"=="N" (for %%Z in (Word Excel PowerPoint Outlook Access OneNote Publisher Lync OneDrive Teams) do set "APP_%%Z=0"&goto CUSTOMLOOP)
if /I "%AP%"=="S" goto BUILDEXCLUDES
if "%AP%"=="0" goto MAIN
goto CUSTOMLOOP

:BUILDEXCLUDES
set "EXCLUDES="
for %%Z in (Word Excel PowerPoint Outlook Access OneNote Publisher Lync Teams) do if "!APP_%%Z!"=="0" set "EXCLUDES=!EXCLUDES! %%Z"
if "%APP_OneDrive%"=="0" set "EXCLUDES=%EXCLUDES% Groove OneDrive"
goto INSTALL_SUMMARY

:INSTALL_SUMMARY
cls
echo ============================================================
echo                    INSTALLATION SUMMARY
echo ============================================================
echo Product      : %PN%
echo Product ID   : %PID%
echo Channel      : %CH%
echo Architecture : %ARCH%-bit
echo Excluded     : %EXCLUDES%
echo.
echo [1] Start Installation
echo [0] Cancel
set /p "IS=Select: "
if "%IS%"=="1" (call :InstallSelected&pause&goto MAIN)
if "%IS%"=="0" goto MAIN
goto INSTALL_SUMMARY

:CONVERTMENU
cls
call :DetectOffice
set "EXCLUDES="
echo ============================================================
echo                  CONVERT / MIGRATE OFFICE
echo ============================================================
echo Current product : !CURPRODUCT!
echo Architecture    : !CURARCH!
echo Channel         : !CURCHANNEL!
echo.
echo Select target generation:
echo [1] Office 2019 - All Suite Editions
echo [2] Office 2021 - All Suite Editions
echo [3] Office 2024 - All Suite Editions
echo [0] Back
set /p "C=Select: "
if "%C%"=="1" goto CONVERT2019
if "%C%"=="2" goto CONVERT2021
if "%C%"=="3" goto CONVERT2024
if "%C%"=="0" goto MAIN
goto CONVERTMENU

:CONVERT2019
cls
echo =================== TARGET OFFICE 2019 ===================
echo [1] Professional Plus 2019 - Volume
echo [2] Professional 2019 - Retail
echo [3] Standard 2019 - Volume
echo [4] Home ^& Business 2019 - Retail
echo [5] Home ^& Student 2019 - Retail
echo [6] Personal 2019 - Retail
echo [0] Back
set /p "C=Select: "
if "%C%"=="1" (call :SetProduct "Professional Plus 2019 - Volume" "ProPlus2019Volume" "PerpetualVL2019" & goto CONVERT_CONFIRM)
if "%C%"=="2" (call :SetProduct "Professional 2019 - Retail" "Professional2019Retail" "Current" & goto CONVERT_CONFIRM)
if "%C%"=="3" (call :SetProduct "Standard 2019 - Volume" "Standard2019Volume" "PerpetualVL2019" & goto CONVERT_CONFIRM)
if "%C%"=="4" (call :SetProduct "Home and Business 2019 - Retail" "HomeBusiness2019Retail" "Current" & goto CONVERT_CONFIRM)
if "%C%"=="5" (call :SetProduct "Home and Student 2019 - Retail" "HomeStudent2019Retail" "Current" & goto CONVERT_CONFIRM)
if "%C%"=="6" (call :SetProduct "Personal 2019 - Retail" "Personal2019Retail" "Current" & goto CONVERT_CONFIRM)
if "%C%"=="0" goto CONVERTMENU
goto CONVERT2019

:CONVERT2021
cls
echo =================== TARGET OFFICE 2021 ===================
echo [1] Professional Plus 2021 - Retail
echo [2] Professional Plus / LTSC 2021 - Volume
echo [3] Professional 2021 - Retail
echo [4] Standard / LTSC 2021 - Volume
echo [5] Home ^& Business 2021 - Retail
echo [6] Home ^& Student 2021 - Retail
echo [7] Personal 2021 - Retail
echo [0] Back
set /p "C=Select: "
if "%C%"=="1" (call :SetProduct "Professional Plus 2021 - Retail" "ProPlus2021Retail" "Current" & goto CONVERT_CONFIRM)
if "%C%"=="2" (call :SetProduct "Professional Plus LTSC 2021 - Volume" "ProPlus2021Volume" "PerpetualVL2021" & goto CONVERT_CONFIRM)
if "%C%"=="3" (call :SetProduct "Professional 2021 - Retail" "Professional2021Retail" "Current" & goto CONVERT_CONFIRM)
if "%C%"=="4" (call :SetProduct "Standard LTSC 2021 - Volume" "Standard2021Volume" "PerpetualVL2021" & goto CONVERT_CONFIRM)
if "%C%"=="5" (call :SetProduct "Home and Business 2021 - Retail" "HomeBusiness2021Retail" "Current" & goto CONVERT_CONFIRM)
if "%C%"=="6" (call :SetProduct "Home and Student 2021 - Retail" "HomeStudent2021Retail" "Current" & goto CONVERT_CONFIRM)
if "%C%"=="7" (call :SetProduct "Personal 2021 - Retail" "Personal2021Retail" "Current" & goto CONVERT_CONFIRM)
if "%C%"=="0" goto CONVERTMENU
goto CONVERT2021

:CONVERT2024
cls
echo =================== TARGET OFFICE 2024 ===================
echo [1] Professional Plus 2024 - Retail
echo [2] Professional Plus / LTSC 2024 - Volume
echo [3] Professional 2024 - Retail
echo [4] Standard / LTSC 2024 - Volume
echo [5] Home ^& Business 2024 - Retail
echo [6] Home 2024 - Retail
echo [0] Back
set /p "C=Select: "
if "%C%"=="1" (call :SetProduct "Professional Plus 2024 - Retail" "ProPlus2024Retail" "Current" & goto CONVERT_CONFIRM)
if "%C%"=="2" (call :SetProduct "Professional Plus LTSC 2024 - Volume" "ProPlus2024Volume" "PerpetualVL2024" & goto CONVERT_CONFIRM)
if "%C%"=="3" (call :SetProduct "Professional 2024 - Retail" "Professional2024Retail" "Current" & goto CONVERT_CONFIRM)
if "%C%"=="4" (call :SetProduct "Standard LTSC 2024 - Volume" "Standard2024Volume" "PerpetualVL2024" & goto CONVERT_CONFIRM)
if "%C%"=="5" (call :SetProduct "Home and Business 2024 - Retail" "HomeBusiness2024Retail" "Current" & goto CONVERT_CONFIRM)
if "%C%"=="6" (call :SetProduct "Home 2024 - Retail" "Home2024Retail" "Current" & goto CONVERT_CONFIRM)
if "%C%"=="0" goto CONVERTMENU
goto CONVERT2024

:CONVERT_CONFIRM
cls
echo ============================================================
echo                    MIGRATION SUMMARY
echo ============================================================
echo FROM : !CURPRODUCT!
echo TO   : %PN%
echo Arch : !CURARCH!
echo.
echo This V1 uses ODT Remove All + target installation.
echo It does NOT delete PST/OST files or Office registry manually.
echo Close Outlook and all Office apps before continuing.
echo.
echo [1] Start migration
echo [0] Cancel
set /p "X=Select: "
if not "%X%"=="1" goto CONVERTMENU
set "ARCH=64"
if /I "!CURARCH!"=="x86" set "ARCH=32"
set "CFG=%TEMP%\OfficeManager_Convert_%RANDOM%.xml"
> "%CFG%" (
 echo ^<Configuration^>
 echo   ^<Remove All="TRUE" /^>
 echo   ^<Add OfficeClientEdition="%ARCH%" Channel="%CH%"^>
 echo     ^<Product ID="%PID%"^>
 echo       ^<Language ID="MatchOS" /^>
 for %%E in (%EXCLUDES%) do echo       ^<ExcludeApp ID="%%E" /^>
 echo     ^</Product^>
 echo   ^</Add^>
 echo   ^<Property Name="FORCEAPPSHUTDOWN" Value="TRUE" /^>
 echo   ^<Display Level="Full" AcceptEULA="TRUE" /^>
 echo ^</Configuration^>
)
"%ODT%" /configure "%CFG%"
set "RC=%errorlevel%"
del /q "%CFG%" >nul 2>&1
echo.
if "%RC%"=="0" (echo Migration command completed.) else echo Migration returned error code %RC%.
pause
goto MAIN

:ACTMENU
cls
echo ============================================================
echo                ACTIVATION ^& PRODUCT KEY
echo ============================================================
echo [1] Show license status
echo [2] Install / Change product key
echo [3] Activate Office
echo [0] Back
set /p "A=Select: "
call :FindOSPP
if "%A%"=="0" goto MAIN
if not defined OSPP (
 echo OSPP.VBS was not found. Office may not be installed.
 pause
 goto ACTMENU
)
if "%A%"=="1" (cscript //nologo "%OSPP%" /dstatus & pause & goto ACTMENU)
if "%A%"=="2" (
 set /p "KEY=Enter your legitimate Office product key: "
 cscript //nologo "%OSPP%" /inpkey:!KEY!
 set "KEY="
 pause
 goto ACTMENU
)
if "%A%"=="3" (cscript //nologo "%OSPP%" /act & pause & goto ACTMENU)
goto ACTMENU

:LANGMENU
cls
call :DetectOffice
echo ============================================================
echo                     LANGUAGE PACKS
echo ============================================================
echo Current channel : !CURCHANNEL!
echo Architecture    : !CURARCH!
echo.
echo [1] Arabic  (ar-sa)
echo [2] English (en-us)
echo [3] Turkish (tr-tr)
echo [4] Match Windows language
echo [0] Back
set /p "L=Select: "
if "%L%"=="0" goto MAIN
if "%L%"=="1" set "LC=ar-sa"
if "%L%"=="2" set "LC=en-us"
if "%L%"=="3" set "LC=tr-tr"
if "%L%"=="4" set "LC=MatchOS"
if not defined LC goto LANGMENU
call :InstallLanguage
set "LC="
pause
goto LANGMENU

:INFO
cls
call :DetectOffice
echo ============================================================
echo                      OFFICE INFORMATION
echo ============================================================
echo Product IDs     : !CURPRODUCT!
echo Architecture    : !CURARCH!
echo Channel         : !CURCHANNEL!
echo Version         : !CURVERSION!
echo CDN URL         : !CURCDN!
echo.
call :FindOSPP
if defined OSPP (
 echo License information:
 cscript //nologo "%OSPP%" /dstatus
) else (
 echo OSPP.VBS not found.
)
pause
goto MAIN

:UNINSTALL
cls
echo ============================================================
echo                       UNINSTALL OFFICE
echo ============================================================
echo [1] Normal ODT removal - all Click-to-Run Office products
echo [0] Back
echo.
echo This V1 does NOT perform aggressive registry cleanup.
set /p "U=Select: "
if "%U%"=="0" goto MAIN
if not "%U%"=="1" goto UNINSTALL
set "CFG=%TEMP%\OfficeManager_Remove_%RANDOM%.xml"
> "%CFG%" (
 echo ^<Configuration^>
 echo   ^<Remove All="TRUE" /^>
 echo   ^<Property Name="FORCEAPPSHUTDOWN" Value="TRUE" /^>
 echo   ^<Display Level="Full" AcceptEULA="TRUE" /^>
 echo ^</Configuration^>
)
"%ODT%" /configure "%CFG%"
set "RC=%errorlevel%"
del /q "%CFG%" >nul 2>&1
echo Removal returned code %RC%.
pause
goto MAIN

:: ============================================================
:: FUNCTIONS
:: ============================================================


:ShowApp
set "STATE=SKIP"
for /f "tokens=2 delims==" %%Q in ('set %~3 2^>nul') do if "%%Q"=="1" set "STATE=INSTALL"
echo [%~1] %~2 : !STATE!
exit /b

:Toggle
for /f "tokens=2 delims==" %%Q in ('set %~1 2^>nul') do set "TV=%%Q"
if "!TV!"=="1" (set "%~1=0") else (set "%~1=1")
exit /b

:SetProduct
set "PN=%~1"
set "PID=%~2"
set "CH=%~3"
set "ISSUITE=0"
for %%S in (ProPlus Professional Standard HomeBusiness HomeStudent Home2024 Personal) do (
 echo %PID% | findstr /I /B /C:"%%S" >nul && set "ISSUITE=1"
)
exit /b

:EnsureODT
if exist "%ODT%" exit /b 0
cls
echo ============================================================
echo              OFFICE DEPLOYMENT TOOL NOT FOUND
echo ============================================================
echo setup.exe is not beside Office Manager.
echo.
echo [1] Download Microsoft ODT setup.exe automatically
echo [0] Exit
set /p "E=Select: "
if "%E%"=="0" exit /b 1
if not "%E%"=="1" goto EnsureODT
call :UpdateODT
if exist "%ODT%" exit /b 0
echo Failed to prepare Office Deployment Tool.
pause
exit /b 1

:UpdateODT
echo.
echo Downloading the latest Office Deployment Tool setup.exe...
echo Source: Microsoft Office CDN
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
 "$ErrorActionPreference='Stop';" ^
 "[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12;" ^
 "$u='https://officecdn.microsoft.com/pr/wsus/setup.exe';" ^
 "$o='%ODT%.new';" ^
 "Invoke-WebRequest -UseBasicParsing -Uri $u -OutFile $o;" ^
 "if((Get-Item $o).Length -lt 500000){throw 'Downloaded file is unexpectedly small'}"
if errorlevel 1 (
 echo ERROR: ODT download failed.
 del /q "%ODT%.new" >nul 2>&1
 exit /b 1
)
move /y "%ODT%.new" "%ODT%" >nul
echo ODT is ready: %ODT%
exit /b 0

:DetectOffice
set "CURPRODUCT=Not detected"
set "CURARCH=Not detected"
set "CURCHANNEL=Not detected"
set "CURVERSION=Not detected"
set "CURCDN=Not detected"
for /f "usebackq tokens=1,* delims==" %%A in (`powershell -NoProfile -Command "$p='HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Configuration';if(Test-Path $p){$x=Get-ItemProperty $p;'ProductReleaseIds='+$x.ProductReleaseIds;'Platform='+$x.Platform;'UpdateChannel='+$x.UpdateChannel;'VersionToReport='+$x.VersionToReport;'CDNBaseUrl='+$x.CDNBaseUrl}"`) do (
 if /I "%%A"=="ProductReleaseIds" set "CURPRODUCT=%%B"
 if /I "%%A"=="Platform" set "CURARCH=%%B"
 if /I "%%A"=="UpdateChannel" set "CURCHANNEL=%%B"
 if /I "%%A"=="VersionToReport" set "CURVERSION=%%B"
 if /I "%%A"=="CDNBaseUrl" set "CURCDN=%%B"
)
exit /b

:FindOSPP
set "OSPP="
if exist "%ProgramFiles%\Microsoft Office\root\Office16\OSPP.VBS" set "OSPP=%ProgramFiles%\Microsoft Office\root\Office16\OSPP.VBS"
if not defined OSPP if exist "%ProgramFiles(x86)%\Microsoft Office\root\Office16\OSPP.VBS" set "OSPP=%ProgramFiles(x86)%\Microsoft Office\root\Office16\OSPP.VBS"
if not defined OSPP if exist "%ProgramFiles%\Microsoft Office\Office16\OSPP.VBS" set "OSPP=%ProgramFiles%\Microsoft Office\Office16\OSPP.VBS"
if not defined OSPP if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\OSPP.VBS" set "OSPP=%ProgramFiles(x86)%\Microsoft Office\Office16\OSPP.VBS"
exit /b

:InstallSelected
set "CFG=%TEMP%\OfficeManager_Install_%RANDOM%.xml"
> "%CFG%" (
 echo ^<Configuration^>
 echo   ^<Add OfficeClientEdition="%ARCH%" Channel="%CH%"^>
 echo     ^<Product ID="%PID%"^>
 if "%L%"=="3" (
 echo       ^<Language ID="en-us" /^>
 echo       ^<Language ID="ar-sa" /^>
 ) else if "%L%"=="2" (
 echo       ^<Language ID="ar-sa" /^>
 ) else if "%L%"=="4" (
 echo       ^<Language ID="tr-tr" /^>
 ) else if "%L%"=="5" (
 echo       ^<Language ID="MatchOS" /^>
 ) else (
 echo       ^<Language ID="en-us" /^>
 )
 for %%E in (%EXCLUDES%) do echo       ^<ExcludeApp ID="%%E" /^>
 echo     ^</Product^>
 echo   ^</Add^>
 echo   ^<Display Level="Full" AcceptEULA="TRUE" /^>
 echo ^</Configuration^>
)
echo.
echo Installing %PN%...
echo ODT will download required Office files automatically.
"%ODT%" /configure "%CFG%"
set "RC=%errorlevel%"
del /q "%CFG%" >nul 2>&1
echo.
if "%RC%"=="0" (echo Installation command completed.) else echo Installation returned error code %RC%.
exit /b

:InstallLanguage
call :DetectOffice
set "ARCH=64"
if /I "!CURARCH!"=="x86" set "ARCH=32"
set "LCH=!CURCHANNEL!"
:: Map CDN URLs / unknown values to known perpetual channels from installed product IDs
echo !CURPRODUCT! | find /I "2024Volume" >nul && set "LCH=PerpetualVL2024"
echo !CURPRODUCT! | find /I "2021Volume" >nul && set "LCH=PerpetualVL2021"
echo !CURPRODUCT! | find /I "2019Volume" >nul && set "LCH=PerpetualVL2019"
if "!LCH!"=="Not detected" (
 echo Could not determine the installed Office channel.
 exit /b 1
)
set "CFG=%TEMP%\OfficeManager_Lang_%RANDOM%.xml"
> "%CFG%" (
 echo ^<Configuration^>
 echo   ^<Add OfficeClientEdition="!ARCH!" Channel="!LCH!"^>
 echo     ^<Product ID="LanguagePack"^>
 echo       ^<Language ID="%LC%" /^>
 echo     ^</Product^>
 echo   ^</Add^>
 echo   ^<Display Level="Full" AcceptEULA="TRUE" /^>
 echo ^</Configuration^>
)
echo Installing language %LC% using channel !LCH!...
"%ODT%" /configure "%CFG%"
set "RC=%errorlevel%"
del /q "%CFG%" >nul 2>&1
echo Language installation returned code %RC%.
exit /b
