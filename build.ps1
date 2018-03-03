param(
    [switch]
    $run,

    [switch]
    $deploy
)

monkeyc -f .\monkey.jungle -o bin/battery-widget.prg -y C:\connectiq-sdk-win-2.4.3\developer_key.der -s 2.4.1 -d vivoactive3

if ($run) {
    if (-Not (Get-Process -Name simulator -ErrorAction SilentlyContinue)) {
        connectiq
    }
    monkeydo .\bin\battery-widget.prg vivoactive3
}

if ($deploy) {
    Copy-Item .\bin\battery-widget.prg D:\GARMIN\APPS\
}