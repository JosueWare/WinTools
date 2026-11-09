if (Get-Command "git.exe" -ErrorAction SilentlyContinue) {
    if (Test-Path -Path ".git") {
        $currentBranch = (git branch --show).Trim("")
    }
    else {
        $currentBranch = ""
    }
}
else {
    $currentBranch = ""
}