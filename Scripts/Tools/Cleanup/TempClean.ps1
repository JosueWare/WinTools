# Paths
[string]$path_USER_TEMP = "$env:USERPROFILE\AppData\Local\Temp"
[string]$path_TEMP = "C:\Windows\Temp"
[string]$path_PREFETCH = "C:\Windows\Prefetch"

# Bool

    # Paths
    [bool]$folder_USER_TEMP = $null
    [bool]$folder_TEMP = $null
    [bool]$folder_PREFETCH = $null

# Menu
Clear-Host
    Write-Host ""
Write-Host "    Analisando.."
    Write-Host ""

    Start-Sleep -Seconds 1

    <# USER_TEMP #>
    if (Test-Path -Path $path_USER_TEMP) {
        $folder_USER_TEMP = $true
    }
    else {
        $folder_USER_TEMP = $false
    }

    <# TEMP #>
    if (Test-Path -Path $path_TEMP) {
        $folder_TEMP = $true
    }
    else {
        $folder_TEMP = $false
    }

    <# PREFETCH #>
    if (Test-Path -Path $path_PREFETCH) {
        $folder_PREFETCH = $true
    }
    else {
        $folder_PREFETCH = $false
    }

# Check Bool Values
$folder_USER_TEMP
$folder_TEMP
$folder_PREFETCH