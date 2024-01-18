$eesnimi = Read-Host "Sisesta oma eesinimi: "
$perenimi = Read-Host "Sisesta oma perenimi: "

$eesnimi = $eesnimi.ToLower()
$perenimi = $perenimi.ToLower()

$kasutajanimi = "$eesnimi.$perenimi"

try
{
    Remove-LocalUser -Name $kasutajanimi
    Write-Host "Kustutatav kasutaja on $kasutajanimi"
}
catch
{
    Write-Host "Kasutaja kustutamisega tekkis probleem"
    Write-Host "Probleemi detailid: $_"
}