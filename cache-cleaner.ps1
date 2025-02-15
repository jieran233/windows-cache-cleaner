function Convert-BytesToHumanReadable { param([float]$Bytes) if ($Bytes -ge 1GB) {"{0:N2} GB" -f ($Bytes / 1GB)} elseif ($Bytes -ge 1MB) {"{0:N2} MB" -f ($Bytes / 1MB)} elseif ($Bytes -ge 1KB) {"{0:N2} KB" -f ($Bytes / 1KB)} else {"$Bytes Bytes"} }
$du_before = (Get-PSDrive -Name C).Used
Write-Output ":: Cleaning..."
Write-Output " (1/40) Cleaning Windows Events"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\system32\winevt\Logs"
Write-Output " (2/40) Cleaning Windows Logs"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\*.log"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\*.bak"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\*log.txt"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\SchedLgU.txt"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\Performance\WinSAT\*.log"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\Panther\*.log"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Local\Microsoft\Windows\*.log"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Local\MigWiz\*.log"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Local\Microsoft\CLR_*\*.log"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Local\Microsoft\CLR_*\*\*.log"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\*.log"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\Logs"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\Logs"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\Performance\WinSAT\DataStore"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SYSTEMDRIVE\System Volume Information\Chkdsk"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:ProgramData\USOShared\Logs"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\system32\WDI\LogFiles\*"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\system32\LogFiles\*"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\debug"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\Users\*\AppData\Local\Packages\*\AC\Microsoft\CLR_*\*.log"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\Users\*\AppData\Local\Packages\*\AC\#!*\Microsoft\CLR_*\*.log"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\Users\*\AppData\Local\Packages\*\AC\Microsoft\CLR_*\*\*.log"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\Users\*\AppData\Local\Packages\*\AC\#!*\Microsoft\CLR_*\*\*.log"
Write-Output " (3/40) Cleaning Windows Reports"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Local\Microsoft\Windows\WER"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:ProgramData\Microsoft\Windows\WER"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\LiveKernelReports"
Write-Output " (4/40) Cleaning Windows download cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\SoftwareDistribution\Download"
Write-Output " (5/40) Cleaning Windows Delivery Optimization cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\SoftwareDistribution\DeliveryOptimization"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\DeliveryOptimization"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization"
Write-Output " (9/40) Cleaning WinSxS cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\WinSxS\ManifestCache"
Write-Output " (10/40) Cleaning cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:Temp"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\Found.*"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\Users\*\AppData\Local\Packages\*\AC\Temp\*"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\Users\*\AppData\Local\Packages\*\AC\#!*\Temp\*"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\ServiceProfiles\*\AppData\Local\Temp\*"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\system32\config\systemprofile\AppData\Local\Temp\*"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\Windows\SysWOW64\config\systemprofile\AppData\Local\Temp\*"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\Temp"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\Users\*\AppData\Local\Packages\*\AC\Temp\*"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\Users\*\AppData\Local\Packages\*\AC\#!*\Temp\*"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\ServiceProfiles\*\AppData\Local\Temp\*"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\system32\config\systemprofile\AppData\Local\Temp"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\Windows\SysWOW64\config\systemprofile\AppData\Local\Temp"
Write-Output " (12/40) Cleaning driver install cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\AMD"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\Intel"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\NVIDIA"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\Prog"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\SWSetup"
Write-Output " (13/40) Cleaning Windows UUP update cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\$Windows.~BT"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\$Windows.~WS"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\$Windows.~LS"
Write-Output " (14/40) Cleaning Windows Search cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\ProgramData\Microsoft\Search\Data\Applications\Windows"
Write-Output " (18/40) Cleaning IDM download cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Roaming\IDM\DwnlData"
Write-Output " (19/40) Cleaning Steam download cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\Program Files (x86)\Steam\steamapps\downloading"
Write-Output " (20/40) Cleaning Tencent QQ cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Roaming\Tencent\AndroidAssist"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Roaming\Tencent\AndroidServer"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Roaming\Tencent\Logs"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Roaming\Tencent\TXSSO"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\Users\*\AppData\Roaming\Tencent\Users\*\WinTemp\*"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\Windows\SysWOW64\config\systemprofile\AppData\Roaming\Tencent"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:ProgramData\temp"
Write-Output " (21/40) Cleaning Tencent WeMeet logs"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:APPDATA\Tencent\WeMeet\Global\Logs"
Write-Output " (22/40) Cleaning Baidu Netdisk cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:APPDATA\BaiduYunKernel\Data"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:APPDATA\BaiduYunGuanjia\logs"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:APPDATA\baidu\BaiduNetdisk\AutoUpdate\Download"
Write-Output " (23/40) Cleaning Process Lasso log"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:ProgramData\ProcessLasso\logs\processlasso.log"
Write-Output " (24/40) Cleaning FastCopy log"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\FastCopy\Log"
Write-Output " (25/40) Cleaning UltraEdit Restore files"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:APPDATA\IDMComp\UltraEdit\Restore"
Write-Output " (26/40) Cleaning IntelliSense cache of vscode-cpptools"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Local\Microsoft\vscode-cpptools\*"
Write-Output " (27/40) Cleaning NuGet cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Local\NuGet\Cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Local\NuGet\v3-cache"
Write-Output " (28/40) Cleaning VSCode cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:APPDATA\Code\Cache"
Write-Output " (29/40) Cleaning clash and clash for windows logs and cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\.config\clash\logs"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Local\clash_win-updater"
Write-Output " (30/40) Cleaning WeChat cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\Documents\WeChat Files\wxid_*\FileStorage\Cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\Documents\WeChat Files\wxid_*\Msg\Multi\bak"
Write-Output " (33/40) Cleaning Electron Apps updater"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Local\*-updater"
Write-Output " (34/40) Cleaning Netease CloudMusic cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Local\Netease\CloudMusic\Cache"
Write-Output " (35/40) Cleaning MSYS2 (Install from Chocolatey in %SystemDrive%\tools) Pacman packages cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\tools\msys64\var\cache\pacman\pkg"
Write-Output " (36/40) Cleaning PyInstaller Apps runtime binaries cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Local\pyinstaller\bincache*"
Write-Output " (37/40) Cleaning Microsoft Office update download cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:ProgramFiles\Microsoft Office\Updates\Download\PackageFiles"
Write-Output " (38/40) Cleaning Scoop download cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\scoop\cache\*"
Write-Output " (40/40) Cleaning conda cache"
conda clean --all -y
Write-Output " Done."
Write-Output ":: Calculating..."
$du_after = (Get-PSDrive -Name C).Used
$space_freed = $du_before - $du_after
Write-Output ("-> {0} freed up." -f (Convert-BytesToHumanReadable $space_freed))