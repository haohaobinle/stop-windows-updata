# windows updata停用方法

參考網址：https://home.gamer.com.tw/artwork.php?sn=5650719

## 方法一 使用系統管理員執行CMD

### 停用依照以下順序執行
    net stop wuauserv
    net stop WaaSMedicSvc
    net stop UsoSvc
    sc config wuauserv start= disabled
    sc config WaaSMedicSvc start= disabled
    sc config UsoSvc start= disabled

### 恢復啟用依照以下順序執行
    sc config wuauserv start= demand
    sc config WaaSMedicSvc start= demand
    sc config UsoSvc start= demand
    net start wuauserv
    net start WaaSMedicSvc
    net start UsoSvc

## 方法二 使用bat檔執行
.bat程式指令  
內有中文，可使用ANSI編碼，txt另存時可以設定  
請使用**系統管理員的身分執行**
### sc指令停用啟用
#### 停止服務為下
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

#### 啟用服務為下
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
### 登入編輯程式(regedit)(註冊表)啟用停用
**該方法電腦需要進行重啟**
#### 停用服務為下
    @echo off
    echo 正在將服務設置為停用...
    REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv" /v Start /t REG_DWORD /d 4 /f
    REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UsoSvc" /v Start /t REG_DWORD /d 4 /f
    REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v Start /t REG_DWORD /d 4 /f
    echo 完成操作。
    echo 電腦須重啟即可完成設定。
    pause
#### 啟用服務為下
    @echo off
    echo 正在將服務設置為啟用...
    REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv" /v Start /t REG_DWORD /d 3 /f
    REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UsoSvc" /v Start /t REG_DWORD /d 3 /f
    REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v Start /t REG_DWORD /d 3 /f
    echo 完成操作。
    echo 電腦須重啟即可完成設定。
    pause
## 方法二 使用regedit的方式
### win+R輸入regedit
#### 停用windows updata
 [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv]
"Start"=dword:00000004
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UsoSvc]
"Start"=dword:00000004
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc]
"Start"=dword:00000004

#### 啟用windows updata
 [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv]
"Start"=dword:00000003
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UsoSvc]
"Start"=dword:00000003
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc]
"Start"=dword:00000003

## 🔗其他停止抓取更新的方法 參考網址如下
管理其他 Windows Update 設定
- 管理其他 Windows Update 設定(regedit): https://learn.microsoft.com/zh-tw/windows/deployment/update/waas-wu-settings
- 阻止Windows 10更新的所有方法: https://tw.easeus.com/backup-recovery/how-to-stop-windows-10-from-automatically-update.html
- 4種關閉Win11更新的方法: https://www.diskpart.com/tw/windows-11/stop-windows-11-update.html
