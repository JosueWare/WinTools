if (-not (Test-Path "Logs")) {
    New-Item -Path "Logs" -ItemType Directory | Out-Null
}
if (-not (Test-Path -Path "Private")) {
    New-Item -Path "Private" -ItemType Directory | Out-Null
}