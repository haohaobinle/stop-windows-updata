@echo off
:: 檢查管理員權限
net session >nul 2>&1
if %errorLevel% == 0 (
    echo 程式以系統管理員執行
) else (
    echo 請求管理員權限...
    goto UACPrompt
)

:: 以管理權限運行後繼續執行的命令
goto AdminTasks

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B

:AdminTasks
echo 正在將服務設置為手動...
sc config wuauserv start= demand
sc config WaaSMedicSvc start= demand
sc config UsoSvc start= demand
echo 正在啟用服務...
net start wuauserv
net start WaaSMedicSvc
net start UsoSvc
echo 完成操作。
pause
