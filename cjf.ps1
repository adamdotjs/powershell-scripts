$sourceFolder = "C:\Users\avidw\Desktop\test"
$jobNumber = Read-Host "Enter job number"
$destination = "C:\Users\avidw\Desktop"

if (Test-Path $jobNumber) {
    Write-Host "Folder '$jobNumber' already exists."
    exit
}

$outputPath = Join-Path $destination $jobNumber

Copy-Item -Path $sourceFolder -Destination $outputPath -Recurse -ErrorAction Stop

Write-Host "Folder for job '$jobNumber' created successfully."
