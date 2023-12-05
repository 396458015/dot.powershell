# 安装powershell
    双击ps安装程序.

# 配置powershell
  1. powershell配置文件'Microsoft.PowerShell_profile.ps1'  
     路径：'C:\Users\ThinkPad\Documents\PowerShell\Microsoft.PowerShell_profile.ps1'  
     快捷命令'psconfig'  
  2. 安装scoop, 通过scoop安装插件  
     2.1 Open powershell  
     2.2 Input 'Set-ExecutionPolicy RemoteSigned -scope CurrentUser' 输入y  
     2.3 Input 'iwr -useb https://gitee.com/glsnames/scoop-installer/raw/master/bin/install.ps1 | iex'  
  3. 安装 Icons  
     通过scoop安装 (推荐),Open powershell  
         'scoop bucket add extras'  
         'scoop install terminal-icons'  
     或通过PSGallery安装  
         Open powershell  
         Input 'Install-Module -Name Terminal-Icons -Repository PSGallery -Force'  
  4. 通过scoop安装winfetch  
         'scoop bucket add extras'  
         'scoop install winfetch'  
     * alias wf (winfetch)  
     * 配置文件路径:'C:\Users\ThinkPad\.config\winfetch\config.ps1'  
     * 配置文件快捷键:'wfconfig'  
     * winfetch仓库:https://github.com/lptstr/winfetch  
     * winfetch安装介绍:https://github.com/lptstr/winfetch/wiki/Installation  
  5. 安装 starship  
     4.1 Open powershell  
     4.2 Input  'scoop install starship'(推荐) 或者 'winget install starship'  
     4.3 系统变量,设置变量名:'STARSHIP_CONFIG', 变量值:'C:\Users\ThinkPad\Documents\PowerShell\starship.toml'  
     4.4 配置文件'starship.toml'.  
         路径：'C:\Users\ThinkPad\Documents\PowerShell\starship.toml'  
     4.5 快捷命令'ssconfig'  
  6. 安装lf  
     5.1 Open powershell  
     5.2 Input 'scoop install lf'  
     5.3 将仓库'dot.lf'内的文件复制到'cd C:\Users\ThinkPad\AppData\Local\lf\'  
     注意:有且只有wt为'1.16.10231.0'的版本能够正常显示lf中的中文。  
  7. install Directory jumper z (通过scoop)  
     6.1 Open powershell  
     6.2 Input 'scoop install z'  
  8. 由于版本自带命令提示插件'PSReadLine',无需安装.  

# usage
## z
  - cd xx/xx/xx/a1
  - cd yy/yy/yy/b1
  - z a1
  - z b1
  - z a
  - z b

## lf
  :maps 查看快捷键  

  - a: 新建文件  
  - A: 新建文件夹  

  - yy: 复制文件  
  - dd: 剪切文件  
  - c: 取消复制或剪切  

  - yp: 复制路径  

  - x: 删除到\Trash  
  - X: 彻底删除  

  - rename  
     r: 更改文件名（光标在文件名与后缀之间）  
     i: 更改文件名（光标在文件名最前面）  
     I: 更改文件名（光标在后缀处）  

  - V: 全选  
  - spacebar: 选择文件  
  - u: 取消选择  

  - 书签  
    ,: 跳转标记文件夹  
    <: 删除标记文件夹  
    m: 新建标记文件  

  - <c-o>: 在terminal emulator打开该路径  
  - o: 在资源管理器中打开当前文件夹  
  - O: openwith  
  - v: nvim打开  

  - .: 切换显示隐藏文件  

  - R: 重新加载  

  - 压缩  
    zz: 压缩文件  
    zu: 解压文件  

## scoop

   - 搜索软件  
     scoop search [packageName]

   - 下载软件  
     scoop install [packageName]

   - 移除软件  
     scoop uninstall [packageName]

   - To update all installed packages:  
     scoop update *

   - To list installed packages:  
     scoop list

   - To display information about a package:  
     scoop info [packageName]

   - To list all known buckets (a bucket is an application repository):  
     scoop bucket known

   - To add a bucket by its alias or a Git repository URL:  
     scoop bucket add [bucket]

   - 删除仓库  
     scoop bucket rm main

   --

   - To install scoop (requires powershell >= 3):  
   iex (new-object net.webclient).downloadstring('https://get.scoop.sh')

   - To uninstall scoop:  
   scoop uninstall scoop

   - To update scoop:  
   scoop update

   - To install several utils at once:  
   scoop install 7zip curl sudo git openssh coreutils grep sed less

   - To install several programming languages at once:  
   scoop install python ruby go nodejs

   - To install php (see https://github.com/lukesampson/scoop/wiki/Custom-PHP-configuration for persisting php.ini settings through updates):  
   scoop install php

   - To install an app (Git) globally:  
   sudo scoop install git --global

   - To update a globally installed app (Git):  
   sudo scoop update git --global

## winfetch
  - wf (winfetch)









