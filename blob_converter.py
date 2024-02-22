import subprocess
import tempfile
import os
import sys

def convert_blob_content_to_crlf(blob_content):
    # A blob is typically a large collection of binary data, often used to store data in databases or cloud storage.
    # Here, 'blob_content' refers to the binary data that needs to be processed.

    print("Creating temporary file...")
    with tempfile.NamedTemporaryFile(delete=False, mode='w+', encoding='utf-8') as tmp_file:
        tmp_file_path = tmp_file.name
        print(f"Writing blob content to: {tmp_file_path}")
        tmp_file.write(blob_content)
        tmp_file.flush()
        os.fsync(tmp_file.fileno())

    print(f"Converting file {tmp_file_path} to CRLF...")
    convert_files_wrapper(tmp_file_path)

    print(f"Reading converted content from: {tmp_file_path}")
    with open(tmp_file_path, 'r', encoding='utf-8') as tmp_file:
        converted_content = tmp_file.read()

    print("Removing temporary file...")
    os.remove(tmp_file_path)
    return converted_content


def get_script_directory():
    # Pobierz katalog, w którym znajduje się bieżący skrypt
    return os.path.dirname(os.path.abspath(__file__))


def convert_files_wrapper(file_path):
    # A PowerShell script is used here to convert the line endings of a file from LF to CRLF.
    # This function runs the PowerShell script with the provided file path as an argument.

    # Uzyskaj ścieżkę do skryptu PowerShell na podstawie ścieżki do bieżącego skryptu
    script_directory = get_script_directory()
    ps_script_path = os.path.join(script_directory, "convert-selected-file-to-CRLF.ps1")

    print("Running PowerShell script...")
    result = subprocess.run(['powershell.exe', '-ExecutionPolicy', 'Unrestricted', ps_script_path, '-filePath', file_path], check=True, capture_output=True, text=True)
    print("Output from PowerShell script:")
    print(result.stdout)
    if result.stderr:
        print("Error from PowerShell script:")
        print(result.stderr)

if __name__ == '__main__':
    # This script takes binary data (blob) from stdin, converts it to CRLF line endings using a PowerShell script,
    # and then outputs the converted content to stdout.

    print("Processing blob content...")
    blob_content = sys.stdin.read()
    converted_content = convert_blob_content_to_crlf(blob_content)
    print("Printing converted content...")
    sys.stdout.write(converted_content)
