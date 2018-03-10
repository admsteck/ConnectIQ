param(
    [switch]
    $Run,

    [switch]
    $Deploy,

    [switch]
    $Publish
)

monkeyc -f .\monkey.jungle -o bin/battery-widget.prg -y C:\connectiq-sdk-win-2.4.3\developer_key.der -s 2.4.1 -d vivoactive3

if ($Run) {
    if (-Not (Get-Process -Name simulator -ErrorAction SilentlyContinue)) {
        connectiq
    }
    monkeydo .\bin\battery-widget.prg vivoactive3
}

if ($Deploy) {
    Copy-Item .\bin\battery-widget.prg D:\GARMIN\APPS\
}

if ($Publish) {
    monkeyc -e -f .\monkey.jungle -o bin/simple-battery.iq -y C:\connectiq-sdk-win-2.4.3\developer_key.der
}