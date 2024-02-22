$content = Get-Content -Encoding Byte ./breakline-file.txt

# Initialize a variable to store the previous byte
$previousByte = $null

# Loop through each byte in the content
foreach ($byte in $content) {
    # Convert the byte to a hexadecimal string representation
    $hex = $byte.ToString("X2")

    # Check if the byte represents a line feed (LF) and the previous byte is not a carriage return (CR)
    if ($hex -eq "0A" -and $previousByte -ne "0D") {
        # If LF and not preceded by CR, output it in blue color
        Write-Host -NoNewline " $hex" -ForegroundColor Blue
    }
    # If the byte represents neither LF nor LF preceded by CR
    else {
        # Output the byte without color
        Write-Host -NoNewline " $hex"
    }

    # Store the current byte as the previous byte for the next iteration
    $previousByte = $hex
}
