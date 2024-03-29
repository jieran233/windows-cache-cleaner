$du_before = Get-PSDrive C
Write-Output ":: Cleaning..."
Write-Output " (1/38) Cleaning Windows Events"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\system32\winevt\Logs"
Write-Output " (2/38) Cleaning Windows Logs"
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
Write-Output " (3/38) Cleaning Windows Reports"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Local\Microsoft\Windows\WER"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:ProgramData\Microsoft\Windows\WER"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\LiveKernelReports"
Write-Output " (4/38) Cleaning Windows download cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\SoftwareDistribution\Download"
Write-Output " (5/38) Cleaning Windows Delivery Optimization cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\SoftwareDistribution\DeliveryOptimization"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\DeliveryOptimization"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization"
Write-Output " (9/38) Cleaning WinSxS cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\WinSxS\ManifestCache"
Write-Output " (10/38) Cleaning cache"
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
Write-Output " (11/38) Cleaning Windows crash dump files"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\appdata\local\crashdumps"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\MEMORY.DMP"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemRoot\Minidump"
Write-Output " (12/38) Cleaning driver install cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\AMD"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\Intel"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\NVIDIA"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\Prog"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\SWSetup"
Write-Output " (13/38) Cleaning Windows UUP update cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\$Windows.~BT"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\$Windows.~WS"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\$Windows.~LS"
Write-Output " (14/38) Cleaning Windows Search cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\ProgramData\Microsoft\Search\Data\Applications\Windows"
Write-Output " (15/38) Cleaning pip download cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Local\pip\cache"
Write-Output " (16/38) Cleaning ~\.cache (torch, huggingface, paddle, etc.)"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\.cache"
Write-Output " (17/38) Cleaning paddlehub downloaded model cache (.paddlehub)"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\.paddlehub"
Write-Output " (18/38) Cleaning IDM download cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Roaming\IDM\DwnlData"
Write-Output " (19/38) Cleaning Steam download cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\Program Files (x86)\Steam\steamapps\downloading"
Write-Output " (20/38) Cleaning Tencent QQ cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Roaming\Tencent\AndroidAssist"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Roaming\Tencent\AndroidServer"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Roaming\Tencent\Logs"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Roaming\Tencent\TXSSO"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\Users\*\AppData\Roaming\Tencent\Users\*\WinTemp\*"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\Windows\SysWOW64\config\systemprofile\AppData\Roaming\Tencent"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:ProgramData\temp"
Write-Output " (21/38) Cleaning Tencent WeMeet logs"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:APPDATA\Tencent\WeMeet\Global\Logs"
Write-Output " (22/38) Cleaning Baidu Netdisk cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:APPDATA\BaiduYunKernel\Data"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:APPDATA\BaiduYunGuanjia\logs"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:APPDATA\baidu\BaiduNetdisk\AutoUpdate\Download"
Write-Output " (23/38) Cleaning Process Lasso log"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:ProgramData\ProcessLasso\logs\processlasso.log"
Write-Output " (24/38) Cleaning FastCopy log"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\FastCopy\Log"
Write-Output " (25/38) Cleaning UltraEdit Restore files"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:APPDATA\IDMComp\UltraEdit\Restore"
Write-Output " (26/38) Cleaning IntelliSense cache of vscode-cpptools"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Local\Microsoft\vscode-cpptools\*"
Write-Output " (27/38) Cleaning NuGet cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Local\NuGet\Cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Local\NuGet\v3-cache"
Write-Output " (28/38) Cleaning VSCode cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:APPDATA\Code\Cache"
Write-Output " (29/38) Cleaning clash and clash for windows logs and cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\.config\clash\logs"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Local\clash_win-updater"
Write-Output " (30/38) Cleaning WeChat cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\Documents\WeChat Files\wxid_*\FileStorage\Cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\Documents\WeChat Files\wxid_*\Msg\Multi\bak"
Write-Output " (31/38) Cleaning miHoYo games' log"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\LocalLow\miHoYo"
Write-Output " (32/38) Cleaning HikariField games' log"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\LocalLow\HikariField"
Write-Output " (33/38) Cleaning Electron Apps updater"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Local\*-updater"
Write-Output " (34/38) Cleaning Netease CloudMusic cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Local\Netease\CloudMusic\Cache"
Write-Output " (35/38) Cleaning MSYS2 (Install from Chocolatey in %SystemDrive%\tools) Pacman packages cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:SystemDrive\tools\msys64\var\cache\pacman\pkg"
Write-Output " (36/38) Cleaning PyInstaller Apps runtime binaries cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:USERPROFILE\AppData\Local\pyinstaller\bincache*"
Write-Output " (37/38) Cleaning Microsoft Office update download cache"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:ProgramFiles\Microsoft Office\Updates\Download\PackageFiles"
Write-Output " (38/38) Cleaning conda cache"
conda clean --all -y
Write-Output " Done."
Write-Output ":: Calculating..."
$du_after = Get-PSDrive C
Write-Output " --> Before:"
Write-Output $du_before
Write-Output "`n --> After:`n"
Write-Output $du_after
