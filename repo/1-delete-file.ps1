# Specify the file path
$file = "breakline-file.txt"

# Check if the file exists
if (Test-Path $file) {
    # If the file exists, remove it
    Remove-Item $file
    Write-Host "File was Deleted Successfully."  # Display success message
} else {
    # If the file doesn't exist, display a message indicating so
    Write-Host "File does not exist"
}
