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
echo 正在停止服務...
net stop wuauserv
net stop WaaSMedicSvc
net stop UsoSvc
echo 正在將服務設置為已停用...
sc config wuauserv start= disabled
sc config WaaSMedicSvc start= disabled
sc config UsoSvc start= disabled
echo 完成操作。
pause
