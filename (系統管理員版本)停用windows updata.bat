@echo off
:: �ˬd�޲z���v��
net session >nul 2>&1
if %errorLevel% == 0 (
    echo �{���H�t�κ޲z������
) else (
    echo �ШD�޲z���v��...
    goto UACPrompt
)

:: �H�޲z�v���B����~����檺�R�O
goto AdminTasks

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B

:AdminTasks
echo ���b����A��...
net stop wuauserv
net stop WaaSMedicSvc
net stop UsoSvc
echo ���b�N�A�ȳ]�m���w����...
sc config wuauserv start= disabled
sc config WaaSMedicSvc start= disabled
sc config UsoSvc start= disabled
echo �����ާ@�C
pause
