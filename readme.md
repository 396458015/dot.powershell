# 安装powershell
    双击ps安装程序.

# 配置powershell
  1. powershell配置文件'Microsoft.PowerShell_profile.ps1'  
     路径：'C:\Users\ThinkPad\Documents\PowerShell\Microsoft.PowerShell_profile.ps1'  
     快捷命令'psconfig'  
  2. install Directory jumper z  
     2.1 Open powershell  
     2.2 Input 'Install-Module -Name z -Force'  
  3. 安装 Icons  
     3.1 Open powershell  
     3.2 Input 'Install-Module -Name Terminal-Icons -Repository PSGallery -Force'  
  4. 安装 starship  
     4.1 Open powershell  
     4.2 Input 'winget install starship'  
     4.3 系统变量,设置变量名:'STARSHIP_CONFIG', 变量值:'C:\Users\ThinkPad\Documents\PowerShell\starship.toml'  
     4.4 配置文件'starship.toml'.  
         路径：'C:\Users\ThinkPad\Documents\PowerShell\starship.toml'  
     4.5 快捷命令'ssconfig'  
  5. 由于版本自带命令提示插件'PSReadLine',无需安装.  
  6. 安装scoop  
     6.1 Open powershell  
     6.2 Input 'Set-ExecutionPolicy RemoteSigned -scope CurrentUser' 输入y  
     6.3 Input 'iwr -useb https://gitee.com/glsnames/scoop-installer/raw/master/bin/install.ps1 | iex'  
  7. 安装lf (通过scoop)  
     7.1 Open powershell  
     7.2 Input 'scoop install lf'  
     7.3 将仓库'dot.lf'内的文件复制到'cd C:\Users\ThinkPad\AppData\Local\lf\'  
     注意:有且只有wt为'1.16.10231.0'的版本能够正常显示lf中的中文。 

# usage
## z
  - cd xx/xx/xx/a1
  - cd yy/yy/yy/b1
  - z a1
  - z b1
  - z a
  - z b

## lf
  - dd: 剪切文件

  - yy: 复制文件

  - yp: 复制路径

  - .: 切换显示隐藏文件

  - R: 重新加载

  - <c-e>: 在资源管理器中打开当前文件夹

  - <c-o>: lfcd模式，同步路径

  - a: 新建文件

  - A: 新建文件夹

  - x: 删除到\Trash

  - X: 彻底删除

  - rename
     r: 更改文件名（光标在文件名与后缀之间）
     i: 更改文件名（光标在文件名最前面）
     I: 更改文件名（光标在后缀处）

  - V: nvim打开

  - o: 使用输入的编辑器打开文件（编辑器需要配置环境变量）

  - 标记
    ': 跳转标记文件夹
    ": 删除标记文件夹
    m: 新建标记文件

## scoop
   - 删除仓库
     scoop bucket rm main

   - 查看仓库
     scoop bucket list

   - 搜索软件
     scoop search [packageName]

   - 下载软件
     scoop install [packageName]

   - 移除软件
     scoop uninstall [packageName]

   - 更新软件
     scoop update *














