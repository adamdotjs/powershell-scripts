$sourceFolder = "C:\Users\avidw\Desktop\test"
$jobNumber = Read-Host -Prompt "Enter job number"
$destination = "C:\Users\avidw\Desktop"
$outputPath = Join-Path $destination $jobNumber
[string[]]$imprintTypes = 'Digital', 'VDP', 'Inkjet', 'None'

Write-Host "Select imprint type:"
for ($i=0; $i -lt $ImprintTypes.Count; $i++) {
    Write-Host "$($i + 1). $($ImprintTypes[$i])"
}

$imprintType = Read-Host "Please choose the number associated with the imprint type needed."

if (Test-Path $outputPath) {
    Write-Host "Folder '$jobNumber' already exists." -ForegroundColor white -BackgroundColor red
    exit
}

Copy-Item -Path $sourceFolder -Destination $outputPath -Recurse -ErrorAction Stop

switch($imprintType) {
    1 { New-Item $outputPath -Name "output" -ItemType "directory" | Out-Null; break }
    2 { New-Item $outputPath -Name "vdp" -ItemType "directory" | Out-Null; break }
    3 { New-Item $outputPath -Name "inkjet" -ItemType "directory" | Out-Null; break }
    4 { break }
    default { Write-Host "Invalid option. Please try again."; exit}
}

Write-Host "You selected $imprintType"
Write-Host "Folder for job '$jobNumber' created successfully." -ForegroundColor white -BackgroundColor blue

$viewInExplorer = Read-Host -Prompt "View folder in Explorer? (Y/N)"

if ($viewInExplorer -eq "Y") {
    Invoke-Item $outputPath -ErrorAction Stop
} else {
    Write-Host "OK. You can close this window."
}
