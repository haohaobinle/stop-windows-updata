@echo off
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
