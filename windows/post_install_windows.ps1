
# Checking if the powershell has admin rights
if (!
    #current role
    (New-Object Security.Principal.WindowsPrincipal(
        [Security.Principal.WindowsIdentity]::GetCurrent()
    #is admin?
    )).IsInRole(
        [Security.Principal.WindowsBuiltInRole]::Administrator
    )
) {
    #elevate script and exit current non-elevated runtime
    Start-Process `
        -FilePath 'powershell' `
        -ArgumentList (
            #flatten to single array
            '-File', $MyInvocation.MyCommand.Source, $args `
            | %{ $_ }
        ) `
        -Verb RunAs
    exit
}

echo ''
echo '========== WINDOWS POST INSTALL SCRIPT v1.0 ====================='; sleep 1
echo ''
echo ''
echo ':: Testing ExecutionPolicy...'; sleep 2
Get-ExecutionPolicy; sleep 2
echo ":: If the result is 'Unrestricted', we're good to go"
echo ":: if the result is 'Restricted', we must set up permissions..."; sleep 3
echo ":: Starting..."; sleep 2
echo ":: Setting up permissions and downloading Chocolatey..."0
Set-ExecutionPolicy Bypass -Scope Process -Force; `
[System.Net.ServicePointManager]::SecurityProtocol = `
[System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
echo ":: We have installed chocolatey successfully. Now installing the gui..."; sleep 2
choco.exe install chocolateygui -y; sleep 2
echo ":: Installing various softwares..."; sleep 2
# Delete software you don't need/want to install
choco.exe install 7zip adobereader audacity autohotkey bleachbit `
blender cmake cpu-z discord dosbox droidcamclient ea-app epicgameslauncher `
electrum ffmpeg filezilla firefoxesr foxitreader gimp git gitkraken goggalaxy `
googledrive googlechrome gpu-z gsmartcontrol horizon hwinfo `
imgburn itunes jdk11 libreoffice-still llftool keepassxc make memreduct `
microsoft-edge microsoft-teams microsoft-windows-terminal miktex `
mp3gain-gui msiafterburner ninja nodejs notepadplusplus nvidia-geforce-now `
onedrive openal parsec pcsx2 playnite python3 qbittorrent rainmeter `
recuva rclone rocketdock revo-uninstaller rufus signal skype spotify speccy `
speedtest steam-client teamviewer telegram teracopy texstudio thunderbird `
ubisoft-connect vlc vscodium wget winfsp winrar whatsapp yt-dlp -y
echo ":: DONE. Now exiting..."
$args
Pause
