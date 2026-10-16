# Paths
[string]$path_USER_TEMP = "$env:USERPROFILE\AppData\Local\Temp"
[string]$path_TEMP = "C:\Windows\Temp"
[string]$path_PREFETCH = "C:\Windows\Prefetch"

# Bool

# Menu
Clear-Host
    Write-Host ""
Write-Host "    Analisando.."
    Write-Host ""

    Start-Sleep -Seconds 1

    <# USER_TEMP #>
    if (Test-Path -Path $path_USER_TEMP) {
        [bool]$path_USER_TEMP = $true
    }
    else {
        [bool]$path_USER_TEMP = $false
    }

    <# TEMP #>
    if (Test-Path -Path $path_TEMP) {
        [bool]$path_TEMP = $true
    }
    else {
        [bool]$path_TEMP = $false
    }

    <# PREFETCH #>
    if (Test-Path -Path $path_PREFETCH) {
        [bool]$path_PREFETCH = $true
    }
    else {
        [bool]$path_PREFETCH = $false
    }

# Check Bool Values
$path_USER_TEMP
$path_TEMP
$path_PREFETCH