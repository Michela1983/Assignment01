# Define data for the CSV file (3 objects, 1 object represents a row)
$data = @(
    [PSCustomObject]@{
        Name = "Michela"
        Job = "Pharmacy Technician"
        Country = "Canada"
        City = "Montreal"
    },
    [PSCustomObject]@{
        Name = "Gustav"
        Job = "Chemical Engineer"
        Country = "Sweden"
        City = "Stockholm"
    },
    [PSCustomObject]@{
        Name = "Jeffrey"
        Job = "Cabinet Maker"
        Country = "Ireland"
        City = "Cork"
    }
)

# Specify the path to save the CSV file
$csvPath = "E:\Vanier MEQ-4\Web Development Environment I\Assignment 01\Original Files\data.csv"

# Export data to the CSV file
$data | Export-Csv -Path $csvPath -NoTypeInformation

# Confirm that data has been successfully written to the CSV file
Write-Host "Your data has been successfully written to $csvPath!"

# Import and read the CSV file
$data = Import-Csv -Path $csvPath 
Write-Host "Data contained in the CSV file:" 
$data

# Retrieve a specific value in the CSV file (ex. "Gustav")
$filteredData = $data | Where-Object { $_.Name -eq "Gustav"}

# Specify path to "Filtered" folder and create a folder if it does not exist
$filteredFolder = "E:\Vanier MEQ-4\Web Development Environment I\Assignment 01\Filtered"
if (-not (Test-Path -Path $filteredFolder)) {
    New-Item -ItemType Directory -Path $filteredFolder
}

# Write the filtered name to a text file inside the "Filtered folder" 
$filteredFile = "$filteredFolder\filtered.txt"
$filteredData.Name | Out-File -FilePath $filteredFile

# Specify path to "Archived" folder and create a folder if it does not exist
$archiveFolder = "E:\Vanier MEQ-4\Web Development Environment I\Assignment 01\Archived"
if (-not (Test-Path -Path $archiveFolder)) {
    New-Item -ItemType Directory -Path $archiveFolder
}


