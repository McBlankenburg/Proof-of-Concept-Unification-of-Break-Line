# convert-selected-file-to-CRLF.ps1
# This script converts line endings of a selected file to CRLF (Carriage Return Line Feed).

param(
    [String]$filePath  # Parameter to specify the file path
)

# Check if a file path is provided
if (-not $filePath) {
    Write-Error "No file path provided. Usage: .\convert-selected-file-to-CRLF.ps1 -filePath 'file_path'"
    exit
}

# Check if the provided file path exists
if (-not (Test-Path $filePath)) {
    Write-Error "File '$filePath' does not exist."
    exit
}

# Read the content of the file
$content = Get-Content -Path $filePath -Raw

# Replace LF with CRLF, handling cases where CRLF already exists in the file
$content = $content -replace "(?<!`r)`n", "`r`n"

# Write the modified content back to the file
Set-Content -Path $filePath -Value $content
