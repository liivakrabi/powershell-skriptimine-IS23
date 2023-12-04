#i
$esimene=Read-Host "Sisesta esimene number: "
$teine=Read-Host "Sisesta teine number: "

if ($esimene -eq $teine){
Write-Host "Need numbrid on võrdsed!"}

elseif ($esimene -gt $teine){
Write-Host "Suurem number on: $esimene"}

elseif ($teine -gt $esimene){
Write-Host "Suurem number on: $teine"}

else{
Write-Host "Midagi läks valesti"}

#ii

Write-Host "Vali Riik" -ForegroundColor Yellow
Write-Host "1 : India" -ForegroundColor Cyan
Write-Host "2: Australia" -ForegroundColor Cyan
Write-Host "3: China" -ForegroundColor Cyan
$choice = Read-Host "Palun vali riik"
if($choice -eq "1")
{
Write-Host "India pealinn on New Delhi." -ForegroundColor Green
}
elseif($choice -eq "2")
{
Write-Host "Austraalia pealinn on Canberra." -ForegroundColor Green
}
elseif($choice -eq "3") {
Write-Host "Hiina pealinn on Beijing." -ForegroundColor Green
}
else
{
Write-Host "Vale valik." -ForegroundColor Red
}