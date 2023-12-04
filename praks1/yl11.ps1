[int]$n1 = Read-Host "Sisesta esimene number"
[int]$n2 = Read-Host "Sisesta teine number"

Write-Host "Calculator" -ForegroundColor Green
Write-Host "1: Liitmine" -ForegroundColor Yellow
Write-Host "2: Lahutamine" -ForegroundColor Yellow
Write-Host "3: Jagamine" -ForegroundColor Yellow
Write-Host "4: Korrutamine" -ForegroundColor Yellow
$ch = Read-Host "Sisesta oma valik: "
switch($ch)
{
1
{
$s = $n1+$n2
Write-Host "Summa on: "$s
}
2
{
$s = $n1-$n2
Write-Host "Vahe on : "$s
}
3
{
$s = $n1/$n2
Write-Host "Jagatis on : "$s
}
4
{
$s = $n1*$n2
Write-Host "Korrutis on : "$s
}
}