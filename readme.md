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
     5.1 Open powershell  
     5.2 Input  'scoop install starship'(推荐) 或者 'winget install starship'  
     5.3 系统变量,设置变量名:'STARSHIP_CONFIG', 变量值:'C:\Users\ThinkPad\Documents\PowerShell\starship.toml'  
     5.4 配置文件'starship.toml'.  
         路径：'C:\Users\ThinkPad\Documents\PowerShell\starship.toml'  
     5.5 快捷命令'ssconfig'  
  6. 安装lf  
     6.1 Open powershell  
     6.2 Input 'scoop install lf'  
     6.3 将仓库'dot.lf'内的文件复制到'cd C:\Users\ThinkPad\AppData\Local\lf\'  
     6.4 安装zip. Input 'scoop install zip'  
     快捷键 alt+f  
     注意:有且只有wt为'1.16.10231.0'的版本能够正常显示lf中的中文。  
  7. 安装fzf  
     7.1 Open powershell  
     7.2 Input 'scoop install fzf'  
     快捷键 ctrl+f ctrl+g  
     注意：fzf不能正确获得名称或路径含中文字符，将powershell设置为utf8格式可以解决该问题.  
  8. 安装bat  
     8.1 Open powershell  
     8.2 Input 'scoop install bat'  
     分别在powershell和lf配置文件添加代码预览bat的配置  
     采用bat实现lf和fzf的代码预览含高亮.ps:lf自身的预览不含高亮  
     查看bat配色主题,'bat --list-themes'
  9. install Directory jumper z (通过scoop)  
     9.1 Open powershell  
     9.2 Input 'scoop install z'  
  10. 由于版本自带命令提示插件'PSReadLine',无需安装.  
  11. 安装yazi.  
     11.1. Download Git from https://git-scm.com/download/win.  
     11.2. Append C:\Program Files\Git\usr\bin to the PATH environment variable, note that depends on your Git installation path.  
     例如将D:\Program Files\Git\usr\bin加入到环境变量，同时加入到'用户变量'和'系统变量'的path  
     11.3. scoop install yazi  
     11.4 for zip/rar preview  
        scoop install unar  
     11.5 for JSON preview  
        scoop install jq  
     11.6 search file name  
        scoop install fd  
     11.7 search file content  
        scoop install ripgrep  
     11.8 fuzzy search file  
        scoop install fzf  
     - 配置文件路径  
     'C:\Users\ThinkPad\AppData\Roaming\yazi\config'  
     - 自动代码预览，无需安装bat;wezterm自动图片预览  
     - 若要通过mpv播放视频,需要将mpv的安装路径增加到环境变量中的'用户变量'  
       如D:\Program Files\mpv-x86_64-20220424-git-9d133eb加入到'用户变量'  

# usage
## z
  - cd xx/xx/xx/a1
  - cd yy/yy/yy/b1
  - z a1
  - z b1
  - z a
  - z b

## lf
  - :maps 查看快捷键  
---
  - a: 新建文件  
  - A: 新建文件夹  
---
  - yy: 复制文件  
  - dd: 剪切文件  
  - c: 取消复制或剪切  
  - yp: 复制路径  
---
  - x: 删除到\Trash  
  - X: 彻底删除  
---
  - rename  
     r: 更改文件名（光标在文件名与后缀之间）  
     i: 更改文件名（光标在文件名最前面）  
     I: 更改文件名（光标在后缀处）  
---
  - V: 全选  
  - spacebar: 选择文件  
  - u: 取消选择  
---
  - 书签  
    ,: 跳转标记文件夹  
    <: 删除标记文件夹  
    m: 新建标记文件  
---
  - \<c-o>: 在terminal emulator打开该路径  
  - o: 在资源管理器中打开当前文件夹  
  - O: openwith  
  - v: nvim打开  
---
  - 压缩  
    zz: 压缩文件  
    zu: 解压文件  
---
  - .: 切换显示隐藏文件  
  - R: 重新加载  
## scoop

   - 搜索软件  
     scoop search [packageName]

   - 下载软件  
     scoop install [packageName]

   - 移除软件  
     scoop uninstall [packageName]

   - Show status and check for new app versions  
     scoop status  

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

## yazi

- a XX    创建XX文件  
- a XX/   创建XX文件夹  

---
- y    copy  
- d    cut  
- x    delete to 回收站  
- X    永久删除  
- r    rename  
       可以通过多选后，r重命名，批量化修改名字  

---
- g XX         移动到已存dir  
- g <space>    目录跳转  

---
- cd   copy parent directory  
- <A-PageUp>    预览上移动  
- <A-PageDown>  预览下移动  

---
- S  rg搜索文件内容  
- s  fd搜索文件名  
- Z  fzf模糊搜索  

---
- o        打开  
- Enter    打开  
- O        选择打开方式  
- C-Enter  选择打开方式  
  Reveal   用'我的电脑'打开  








