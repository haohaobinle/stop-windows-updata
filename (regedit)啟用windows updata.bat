@echo off
echo ���b����A��...
net stop wuauserv
net stop WaaSMedicSvc
net stop UsoSvc
echo ���b�N�A�ȳ]�m���w����...
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UsoSvc" /v Start /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v Start /t REG_DWORD /d 3 /f
echo �����ާ@�C
echo �q�������ҧY�i�����]�w�C
pause
