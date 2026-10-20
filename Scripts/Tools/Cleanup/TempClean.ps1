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
Write-Host "    Analisando pastas.."
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

Start-Sleep -Seconds 2

# Check Bool Values & Clean Folders
Clear-Host

if ($folder_USER_TEMP -eq $true) { <# TEMP_USER #>
        Write-Host ""
    Write-Host "    Limpando a pasta 'Temp' do usuário.." -NoNewline

    Remove-Item (Join-Path -Path $path_USER_TEMP -ChildPath "*") -Recurse -Force -ErrorAction SilentlyContinue
        Start-Sleep -Seconds 1

    Write-Host " Limpo" -ForegroundColor Green
        Write-Host ""
}
else {
        Write-Host ""
    Write-Host "    A pasta 'Temp' do usuário não foi encontrada" -ForegroundColor Red
        Write-Host ""
        Start-Sleep -Seconds 1
}

if ($folder_TEMP -eq $true) { <# TEMP #>
        Write-Host ""
    Write-Host "    Limpando a pasta 'Temp' do Windows.." -NoNewline

    Remove-Item (Join-Path -Path $path_TEMP -ChildPath "*") -Recurse -Force -ErrorAction SilentlyContinue
        Start-Sleep -Seconds 1

    Write-Host " Limpo" -ForegroundColor Green
        Write-Host ""
}
else {
        Write-Host ""
    Write-Host "    A pasta 'Temp' do Windows não foi encontrada" -ForegroundColor Red
        Write-Host ""
        Start-Sleep -Seconds 1
}

if ($folder_PREFETCH -eq $true) {
        Write-Host ""
    Write-Host "    Limpando a pasta 'Prefetch' do Windows.." -NoNewline

    Remove-Item (Join-Path -Path $path_PREFETCH -ChildPath "*") -Recurse -Force -ErrorAction SilentlyContinue
        Start-Sleep -Seconds 1

    Write-Host " Limpo" -ForegroundColor Green
        Write-Host ""
}
else {
        Write-Host ""
    Write-Host "    A pasta 'Prefetch' do Windows não foi encontrada" -ForegroundColor Red
        Write-Host ""
        Start-Sleep -Seconds 1
}

# Finish