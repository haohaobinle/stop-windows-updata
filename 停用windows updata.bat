@echo off
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
