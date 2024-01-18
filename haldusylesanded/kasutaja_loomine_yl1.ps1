$eesnimi = Read-Host "Sisesta oma eesinimi: "
$perenimi = Read-Host "Sisesta oma perenimi: "

$eesnimi = $eesnimi.ToLower()
$perenimi = $perenimi.ToLower()

$taisnimi = "$eesnimi" + " " + "$perenimi"

$kasutajanimi = "$eesnimi.$perenimi"

$Parool = "Parool1!" | ConvertTo-SecureString -AsPlainText -Force

try
{
    New-LocalUser -Name $kasutajanimi -Password $Parool -FullName $taisnimi -ErrorAction Stop | Out-Null
    Write-Host "Loodav kasutaja on $kasutajanimi"
}
catch
{
    Write-Host "Kasutaja loomisega tekkis probleem"
    Write-Host "Probleemi detailid: $_"
}