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
