@echo off
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
