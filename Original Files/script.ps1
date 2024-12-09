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

