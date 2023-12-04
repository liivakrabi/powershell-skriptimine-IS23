$csv = Import-Csv C:\Users\powerojaots\Desktop\opilased.csv

$result = @()
foreach($c in $csv){
    if([int]$c.Vanus -ge 4 -and [int]$c.Vanus -le 10)
    {
        $kool = "Junior"
    }
elseif([int]$c.Vanus -ge 11 -and [int]$c.Vanus -le 17)
    {
    $kool = "Senior"
    }

$temp = [PSCustomObject]@{
    Nimi = $c.Name
    Kool = $kool
}

$result += $temp

}

$result