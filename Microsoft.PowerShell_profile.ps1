# PowerShell settings

# 解决fzf查询结果含有CJK,路径乱码nvim打不开的情况
# set PowerShell to UTF-8
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

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

# Alias
Set-Alias vi nvim
Set-Alias gg LazyGit
Set-Alias ipy ipython
Set-Alias rename Rename-Item

# 复制当前路径 /
function Copy-WorkingDirectory {
    $path = (Get-Location).Path
    $quotedPath = "`'$path`'"
    $quotedPath | Set-Clipboard
    Write-Host "`nCopied path to clipboard:`n`n$quotedPath`n" #`n是换行符
    # Write-Host "`nCopied path to clipboard:`n`n$Path`n" #`n是换行符
}
Set-Alias -Name / -Value Copy-WorkingDirectory

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# 查看目录 ls & ll
function ListDirectory {
	(Get-ChildItem).Name
	Write-Host("")
}
Set-Alias -Name ls -Value ListDirectory
Set-Alias -Name ll -Value Get-ChildItem

# 树状图
function list_tree{ tree /F }
Set-Alias -Name lt -Value list_tree

# Computer info
Set-Alias wf winfetch

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

# 当前工作目录以我的电脑形式打开, o
function OpenCurrentFolder {
	param
	(
		$Path = '.'
	)
	Invoke-Item $Path
}
Set-Alias -Name o -Value OpenCurrentFolder

function dt { cd '~/Desktop' }

# 修改 PSreadLine 历史记录, 删除错误的记录
# (Get-PSReadLineOption).HistorySavePath  可以获得历史记录文件路径
function edith { nvim -c 'normal! G' (Get-PSReadLineOption).HistorySavePath }

# ------------------- config files -------------------
# wezterm
function weconfig { nvim 'C:\Users\ThinkPad\.config\wezterm\config\appearance.lua' }
# alacritty
function alconfig { nvim 'C:\Users\ThinkPad\AppData\Roaming\alacritty\alacritty.yml' }
# powershell
function psconfig { nvim $PROFILE }
# starship
function ssconfig { nvim 'C:\Users\ThinkPad\Documents\PowerShell\starship.toml' }
# nvim
function viconfig { nvim 'C:\Users\ThinkPad\AppData\Local\nvim\init.lua' }
# windows terminal
function wtconfig { nvim 'C:\Users\ThinkPad\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json' }
# lf
function lfconfig { nvim 'C:\Users\ThinkPad\AppData\Local\lf\lfrc' }
# goneovim
function goconfig { nvim 'C:\Users\ThinkPad\AppData\Roaming\.goneovim\settings.toml' }
# winfetch
function wfconfig { nvim 'C:\Users\ThinkPad\.config\winfetch\config.ps1' }
# yazi
function yzconfig { nvim 'C:\Users\ThinkPad\AppData\Roaming\yazi\config\keymap.toml' }

# ------------------- lf -------------------
# lfcd
# 同步powershell与退出lf时的路径一致
Set-PSReadLineKeyHandler -Chord alt+g -ScriptBlock {
    [Microsoft.Powershell.PSConsoleReadline]::RevertLine()
    [Microsoft.Powershell.PSConsoleReadline]::Insert("lfcd.ps1")
    [Microsoft.Powershell.PSConsoleReadline]::AcceptLine()
}

# Set-PSReadlineKeyHandler -Chord "Alt+g"  -ScriptBlock {
#     [Microsoft.PowerShell.PSConsoleReadLine]::Insert("lfcd ")
# }

# lf-trsah (回收站)
function trash { lf 'C:\Users\ThinkPad\AppData\Local\lf\Trash' }

# ------------------- fzf + nvim + bat -------------------
#█▓▒░ fzf
$fzf_opts = @(
    # "--multi",
    # "--reverse",
    # "--exact",
    "--height 100%",
    "--preview-window=right:55%",
    "--header='      '",
    "--prompt=''",#
    "--marker='󰸞'",#✓
    "--pointer='▶'",#➤▶
    "--info=inline:'󰶺  '",
    "--no-separator --scrollbar='▐'",
    "--ansi",
    "--cycle",
    "--border=rounded --border-label='󰞘  󰞗'",
    "--margin=0,0",
    "--preview 'bat --theme=TwoDark --color=always --style=numbers --line-range :500 {}'",
    "--color=fg:#abb2bf,bg+:#343d46,gutter:-1,pointer:#ff5189,info:#f09479,hl:#36c692,hl+:#36c692,label:#80a0ff",
    "--color=marker:#f09479,spinner:#36c692,header:#80a0ff,fg+:#cdd6f4,prompt:#87afff,border:#51576d",
    "--bind ctrl-p:toggle-preview",
    "--bind ctrl-j:down",
    "--bind ctrl-k:up",
    "--bind ctrl-s:toggle-sort",
    "--bind ctrl-f:preview-half-page-down",
    "--bind ctrl-b:preview-half-page-up",
    "--bind ctrl-a:select-all"
    # "--bind ctrl-u:preview-up",
    # "--bind ctrl-d:preview-down",
    # "--bind ctrl-f:page-down",
    # "--bind ctrl-b:page-up"
)
Set-Item Env:FZF_DEFAULT_OPTS -Value ($fzf_opts -join " ")

# 打开fzf用nvim打开文件
function Invoke-FZF() {
    $result = . (Get-Command -CommandType Application fzf) $args
    if ($result) {
        nvim $result
    }
}
Set-PSReadLineKeyHandler -Chord ctrl+f -ScriptBlock {
    [Microsoft.Powershell.PSConsoleReadline]::RevertLine()
    [Microsoft.Powershell.PSConsoleReadline]::Insert("Invoke-FZF")
    [Microsoft.Powershell.PSConsoleReadline]::AcceptLine()
}

# 打开fzf并且cd进去
Set-PSReadlineKeyHandler -Chord ctrl+g -ScriptBlock {
  [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
  [Microsoft.PowerShell.PSConsoleReadLine]::Insert('cd "$(fzf)\.."')
  [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}
function cf {cd "$(fzf)\.."}

# ------------------- yazi -------------------
# Changing working directory when exiting Yazi
function yzcd {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -Path $cwd
    }
    Remove-Item -Path $tmp
}

Set-PSReadLineKeyHandler -Chord Alt+f -ScriptBlock {
    [Microsoft.Powershell.PSConsoleReadline]::RevertLine()
    [Microsoft.Powershell.PSConsoleReadline]::Insert("yzcd")
    [Microsoft.Powershell.PSConsoleReadline]::AcceptLine()
}

# ------------------- wezterm -------------------
# wezterm图片预览
function img { wezterm imgcat $args }

# ------------------- alacritty -------------------
# alacritty映射特性，有缺陷,vim的insert状态下输入快捷键会输出'F10,a'等
# 因此，最终映射ALT-h j k l 为左下上右
# Set-PSReadLineKeyHandler -Chord 'F10,a' -Function HistorySearchForward
# Set-PSReadLineKeyHandler -Chord 'F10,b' -Function HistorySearchBackward


# ni 新建文本
# ren 重命名






