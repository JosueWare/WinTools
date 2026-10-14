# Logon
Set-Location (Join-Path -Path $PSScriptRoot -ChildPath @("..", ".."))

    # Set 'UTF-8'
    [Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Check Shell [GUI]
if (($PSVersionTable.PSEdition) -eq "Core") { <# powershell.exe #>
    Clear-Host
        Write-Host ""
    Write-Host "    PowerShell Core nao foi encontrado" -ForegroundColor Red
        Write-Host ""
}
else { <# pwsh.exe #>
    Clear-Host
        Write-Host ""
    Write-Host "    PowerShell Core não foi encontrado" -ForegroundColor Red
}