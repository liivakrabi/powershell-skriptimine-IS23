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
