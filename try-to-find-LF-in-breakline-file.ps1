$content = Get-Content -Encoding Byte repo/breakline-file.txt
$previousByte = $null

foreach ($byte in $content) {
    $hex = $byte.ToString("X2")

    if ($hex -eq "0A" -and $previousByte -ne "0D") {
        Write-Host -NoNewline " $hex" -ForegroundColor Blue
    } else {
        Write-Host -NoNewline " $hex"
    }

    $previousByte = $hex
}
