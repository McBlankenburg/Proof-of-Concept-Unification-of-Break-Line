$content = Get-Content -Encoding Byte ./breakline-file.txt

# Loop through each byte in the content
foreach ($byte in $content) {
    # Convert the byte to a hexadecimal string representation
    $hex = $byte.ToString("X2")

    # Check if the byte represents a line feed (LF)
    if ($hex -eq "0A") {
        # If LF, output it in blue color
        Write-Host -NoNewline " $hex" -ForegroundColor Blue
    }
    # Check if the byte represents a carriage return (CR)
    elseif ($hex -eq "0D") {
        # If CR, output it in red color
        Write-Host -NoNewline " $hex" -ForegroundColor Red
    }
    # If the byte represents neither LF nor CR
    else {
        # Output the byte without color
        Write-Host -NoNewline " $hex"
    }
}
