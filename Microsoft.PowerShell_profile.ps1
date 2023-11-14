# PowerShell settings

Invoke-Expression (&starship init powershell)
Import-Module Terminal-Icons

#PSReadline settings
Set-PSReadLineOption -ShowToolTips
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
# Set-PSReadLineOption -PredictionViewStyle InlineView
# Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
# Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadLineKeyHandler -Key Shift+Tab -Function TabCompletePrevious
# Set-PSReadlineKeyHandler -Key "Ctrl+w" -Function ViExit
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo
Set-PSReadLineKeyHandler -Key Ctrl+Backspace -Function BackwardKillWord
Set-PSReadLineKeyHandler -Chord "Ctrl+j" -Function HistorySearchForward
Set-PSReadLineKeyHandler -Chord "Ctrl+k" -Function HistorySearchBackward

# 同步powershell与退出lf时的路径一致
Set-PSReadLineKeyHandler -Chord Ctrl+o -ScriptBlock {
    [Microsoft.Powershell.PSConsoleReadline]::RevertLine()
    [Microsoft.Powershell.PSConsoleReadline]::Insert("lfcd.ps1")
    [Microsoft.Powershell.PSConsoleReadline]::AcceptLine()
}

# alacritty映射特性，有缺陷,vim的insert状态下输入快捷键会输出'F10,a'等
# 因此，最终映射ALT-h j k l 为左下上右
# Set-PSReadLineKeyHandler -Chord 'F10,a' -Function HistorySearchForward
# Set-PSReadLineKeyHandler -Chord 'F10,b' -Function HistorySearchBackward

# Alias
Set-Alias vi nvim
Set-Alias ipy ipython
Set-Alias which get-command
Set-Alias rename Rename-Item
Set-Alias git LazyGit




function img {
    wezterm imgcat $args # shortcut for imgcat
}


# 查看目录 ls & ll
function ListDirectory {
	(Get-ChildItem).Name
	Write-Host("")
}
Set-Alias -Name ls -Value ListDirectory
Set-Alias -Name ll -Value Get-ChildItem

# Basic commands
function touch($file) { "" | Out-File $file -Encoding ASCII }
function q { exit }
function cdd {cd C:\Users\ThinkPad\Desktop}
function md { mkdir }
function rm { Reomve-Item }
function .. { cd .. }
function ... { cd ..; cd ..}
function .... { cd ..; cd ..; cd .. }
function ..... { cd ..; cd ..; cd ..; cd ..}

# 当前工作目录以我的电脑形式打开
function OpenCurrentFolder {
	param
	(
		$Path = '.'
	)
	Invoke-Item $Path
}
Set-Alias -Name open -Value OpenCurrentFolder

function desktop { cd '~/Desktop' }

#Fav Variables & Shortcuts
$neovimDir = "C:\Users\ThinkPad\AppData\Local\nvim"

# ni 新建文本
# ren 重命名


# config files(Wezterm + Powershell + starship)
# wezterm
function weconfig { nvim 'C:\Users\ThinkPad\.config\wezterm\config\appearance.lua' }
# alacritty
function alconfig { nvim 'C:\Users\ThinkPad\AppData\Roaming\alacritty\alacritty.yml' }
# powershell (C:\Users\ThinkPad\Documents\PowerShell\Microsoft.PowerShell_profile.ps1)
function psconfig { nvim $PROFILE }
# starship
function ssconfig { nvim 'C:\Users\ThinkPad\Documents\PowerShell\starship.toml' }
# nvim
function viconfig { nvim 'C:\Users\ThinkPad\AppData\Local\nvim\init.lua' }

# windows terminal
function wtconfig { nvim 'C:\Users\ThinkPad\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json' }

# 修改 PSreadLine 历史记录, 删除错误的记录
# (Get-PSReadLineOption).HistorySavePath  可以获得历史记录文件路径
function editH {
  vi -c 'normal! G' (Get-PSReadLineOption).HistorySavePath
}

# lf
function lfconfig { nvim 'C:\Users\ThinkPad\AppData\Local\lf\lfrc' }

# lf-trsah
function trash { lf 'C:\Users\ThinkPad\AppData\Local\lf\Trash' }









