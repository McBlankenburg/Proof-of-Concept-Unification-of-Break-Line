# New file content
$newContent = @"
break-line 1 with CRLF`r`n
break-line 2 with LF`n
break-line 3 with CRLF`r`n
break-line 4 with LF`n
break-line 5 with CRLF`r`n
break-line 6 with LF`n
"@

# File path
$file = "breakline-file.txt"

# Add or replace the content of the file
$newContent | Set-Content -Path $file -Encoding utf8 -Force

Write-Output "File created or updated successfully"
