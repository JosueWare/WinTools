# ENV
[bool]$Connected = Test-Connection -TargetName "8.8.8.8" -Count 1 -Quiet
[int]$TryCountsLimits = "0"

# Script Blocks
[scriptblock]$execDISM = {
    DISM.exe /Online /Cleanup-image /Restorehealth
}