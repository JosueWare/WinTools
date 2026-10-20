# Logon
Set-Location (Join-Path -Path $PSScriptRoot -ChildPath @("..", ".."))

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