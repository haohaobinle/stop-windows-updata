@echo off
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
