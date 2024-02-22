# 1. usuwamy stary plik
	```powershell
	.\1-delete.file.ps1
	```

# 2. tworzymy plik z CRLF oraz LF (naprzemian)
	```powershell
	.\2-create-file.ps1
		```
	
# 3. sprawdzamy utworzony plik OD = CR,  0A = LF
	```powershell
	.\3-show-file-in-hex.ps1
		```
	
# 4. konwertujemy plik do standardu windowsowego (CRLF)
	```powershell
	.\4-convert-file-to-CRLF.ps1
		```
	
# 5. sprawdzamy przekonwertowany plik próbując znależć samotne 0A (LF) jeśli nie znajdziemy, oznacza ze jest prawidlowo
	```powershell
	.\5-try-to-find-LF.ps1
		```