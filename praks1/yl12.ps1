First question:

function countstart
{
$start = Get-Service | ?{$_.Status -eq "Running"}
Write-Host "Kogu arv teenuseid töötavas seisundis = "$start.count
}
function countstop
{
$stop = Get-Service | ?{$_.Status -eq "Stopped"}
Write-Host "Kogu arv teenuseid peatatud seisundis= "$stop.count
}
countstart
countstop

function countservice
{
param
(
[string]$status
)
if($status -eq "Running")
{
$start = Get-Service | ?{$_.Status -eq "Running"}
Write-Host "Kogu arv teenuseid töötavas seisundis = "$start.count
}
elseif($status -eq "Stopped")
{
$stop = Get-Service | ?{$_.Status -eq "Stopped"}
Write-Host "Kogu arv teenuseid peatatud seisundis= "$stop.count
}
}
countservice -status Running
countservice -status Stopped