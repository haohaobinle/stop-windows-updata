@echo off
echo 正在停止服務...
net stop wuauserv
net stop WaaSMedicSvc
net stop UsoSvc
echo 正在將服務設置為已停用...
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UsoSvc" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v Start /t REG_DWORD /d 3 /f
echo 完成操作。
echo 電腦須重啟即可完成設定。
pause
