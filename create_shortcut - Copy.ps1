param()

$appDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$app = Join-Path $appDir "BismillahStore.html"
$icon = Join-Path $appDir "icon.ico"
$desktop = [Environment]::GetFolderPath("Desktop")
$shortcutPath = Join-Path $desktop "Bismillah Store.lnk"

if (-not (Test-Path $app)) {
    Write-Host "[ERROR] BismillahStore.html file khuje paoa jayni. Script-tar pashe file-ta ache kina check korun." -ForegroundColor Red
    exit 1
}

$edge1   = "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe"
$edge2   = "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe"
$chrome1 = "$env:ProgramFiles\Google\Chrome\Application\chrome.exe"
$chrome2 = "${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe"
$chrome3 = "$env:LocalAppData\Google\Chrome\Application\chrome.exe"

$browser = $null
foreach ($b in @($edge1, $edge2, $chrome1, $chrome2, $chrome3)) {
    if (Test-Path $b) { $browser = $b; break }
}

if (-not $browser) {
    Write-Host "[ERROR] Microsoft Edge ba Google Chrome paoa jayni. Age eder ekta install korun, tarpor abar try korun." -ForegroundColor Red
    exit 1
}

$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($shortcutPath)
$Shortcut.TargetPath = $browser
$Shortcut.Arguments = '--app="' + $app + '"'
$Shortcut.WorkingDirectory = $appDir
if (Test-Path $icon) { $Shortcut.IconLocation = $icon }
$Shortcut.Description = "Bismillah Store - Offline Business Manager"
$Shortcut.Save()

if (Test-Path $shortcutPath) {
    Write-Host ""
    Write-Host "  Shortcut toiri hoye geche Desktop-e: 'Bismillah Store'" -ForegroundColor Green
    Write-Host "  Ekhon theke shudhu oi icon-e double-click korle app app-mode-e khulbe (URL bar chhara)." -ForegroundColor Green
} else {
    Write-Host "[ERROR] Shortcut toiri kora jayni." -ForegroundColor Red
}
