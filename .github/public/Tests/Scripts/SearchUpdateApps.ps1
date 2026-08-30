# ENV
[bool]$Internet_NET = Test-Connection -TargetName "8.8.8.8" -Count 1 -Quiet
[int]$LimitsTryCounts = "0"

# Check Connection Internet
if (-not ($Internet_NET)) {
    Clear-Host
        Write-Host "" <##>
    Write-Host "    Erro de conexão" -ForegroundColor Red
        Write-Host "" <##>

        Start-Sleep -Seconds 1

        Write-Host "" <##>
    Write-Host "    Tentando novamente " -ForegroundColor Yellow -NoNewline
    Write-Host "$LimitsTryCounts"
        Write-Host "" <##>

    <# Loop #>
    do {
        <# ENV #>
        $Internet_NET = Test-Connection -TargetName "8.8.8.8" -Count 1 -Quiet
        $LimitsTryCounts++

        Clear-Host
            Write-Host "" <##>
        Write-Host "    Erro de conexão" -ForegroundColor Red
            Write-Host "" <##>

            Write-Host "" <##>
        Write-Host "    Tentando novamente " -ForegroundColor Yellow -NoNewline
        Write-Host "$LimitsTryCounts"
            Write-Host "" <##>
    } until (($Internet_NET -eq $true) -or ($LimitsTryCounts -gt 20))
}

# [END]