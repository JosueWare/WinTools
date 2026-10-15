$isADMIN = ([Security.Principal.WindowsPrincipal] `
[Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (($PSVersionTable.PSEdition) -eq "Core") {
    if ($isADMIN) {
        . (Join-Path -Path "GUI" -ChildPath @("Main", "Menu.ps1"))
    }
}