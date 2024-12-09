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

# Define the parameters of a function to archive older CSV files
function archiveOldFile {
    param (
    [string]$csvPath,         
    [string]$archiveFolder,
    [int]$fileMinuteAge = 10
    )

    # Verify if a CSV file exists and if it is older than 10 minutes
    if (Test-Path -Path $csvPath) {
        $fileInfo = Get-Item -Path $csvPath   
        $fileAge = (Get-Date) - $fileInfo.LastWriteTime
        
        # Determine if file age > 10 minutes and move it to "Archived" folder
        if ($fileAge.TotalMinutes -gt $fileMinuteAge) {
            $timestamp = Get-Date -Format "yyyy-MM-dd-HH-mm"
            $archivedCsvPath = Join-Path -Path $archiveFolder -ChildPath "archivedfile_$timestamp.csv"
            Move-Item -Path $csvPath -Destination $archivedCsvPath
            # Display a message if CSV file is moved to "Archived" folder
            Write-Host "CSV file moved to 'Archived' folder!"
        } else {
            # Display an alternative message if CSV file < 10 minutes
            Write-Host "CSV file is less than 10 minutes old. No action was taken."
        }
    } elseif (Test-Path -Path (Join-Path $archiveFolder "archivedfile*")) {
        # Display a message if file has already been archived
        Write-Host "CSV file already archived."
        # Display a message if no file can be found
    } else {
        Write-Host "File cannot be found!"
    }
}

# Run the script
$csvPath = "E:\Vanier MEQ-4\Web Development Environment I\Assignment 01\Original Files\data.csv"
$archiveFolder = "E:\Vanier MEQ-4\Web Development Environment I\Assignment 01\Archived"

# Call the function
archiveOldFile -csvPath $csvPath -archiveFolder $archiveFolder
