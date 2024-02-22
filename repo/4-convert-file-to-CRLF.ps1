# File path
$filePath = "breakline-file.txt"

# Read the content of the file
$content = Get-Content -Path $filePath -Raw

# Replace LF with CRLF, with handling cases where CRLF already exists in the file
$content = $content -replace "(?<!`r)`n", "`r`n"

# Write the modified content back to the file
Set-Content -Path $filePath -Value $content

Write-Output "The file has been successfulcly converted."