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
echo ���b�N�A�ȳ]�m�����...
sc config wuauserv start= demand
sc config WaaSMedicSvc start= demand
sc config UsoSvc start= demand
echo ���b�ҥΪA��...
net start wuauserv
net start WaaSMedicSvc
net start UsoSvc
echo �����ާ@�C
pause
