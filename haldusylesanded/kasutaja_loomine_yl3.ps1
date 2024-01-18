# Kasutaja sisestab ees- ja perenime
$eesnimi = Read-Host "Sisesta eesnimi: "
$perekonnanimi = Read-Host "Sisesta perenimi: "

# Kasutajanime koostamine
$samAccountName = ($eesnimi.ToLower()) + ($perekonnanimi.ToLower())

# Kontrollime, kas kasutaja eksisteerib
$olemaskasutaja = Get-ADUser -Filter {SamAccountName -eq $samAccountName} -ErrorAction SilentlyContinue

if ($olemaskasutaja -ne $null) {
    # Kui kasutaja olemas, siis...
    Write-Host "Kasutaja $samAccountName on juba olemas."
} else {
    # Kui kasutaja puudub, siis..
    $parool = Read-Host "Sisesta kasutaja parool: " -AsSecureString
    $uuskasutajanimi = $eesnimi + " " + $perekonnanimi
    New-ADUser -SamAccountName $samAccountName -UserPrincipalName "$samAccountName@sv-kool.local" -Name $uuskasutajanimi -GivenName $eesnimi -Surname $perekonnanimi -AccountPassword $parool -Enabled $true
    Write-Host "Kasutaja $samAccountName loodud edukalt."
}
