function New-ADCompatiblePassword {
    $length = 12
    $password = (Get-Random -Count $length -InputObject (33..126 | Where-Object { $_ -notin (34, 39, 96) }) | ForEach-Object { [char]$_ }) -join ''
    return $password
}

# Küsime kasutajalt eesnime ja perekonnanime
$eesnimi = Read-Host "Sisesta kasutaja eesnimi"
$perekonnanimi = Read-Host "Sisesta kasutaja perekonnanimi"

$samAccountName = ($eesnimi.ToLower()) + ($perekonnanimi.ToLower())
$olemasolevKasutaja = Get-ADUser -Filter {SamAccountName -eq $samAccountName} -ErrorAction SilentlyContinue

if ($olemasolevKasutaja -ne $null) {
    # Kui kasutaja on juba olemas, anna teade
    Write-Host "Kasutaja $samAccountName on juba olemas."
} else {
    $parool = New-ADCompatiblePassword
    $uusKasutajaNimi = $eesnimi + " " + $perekonnanimi
    $secureParool = ConvertTo-SecureString -String $parool -AsPlainText -Force
    New-ADUser -SamAccountName $samAccountName -UserPrincipalName "$samAccountName@sv-kool.local" -Name $uusKasutajaNimi -GivenName $eesnimi -Surname $perekonnanimi -AccountPassword $secureParool -Enabled $true

    # Koosta kasutaja andmete massiiv
    $kasutajaAndmed = [PSCustomObject]@{
        'Kasutajatunnus' = $samAccountName
        'Parool' = $parool
    }

    # Salvesta kasutaja andmed CSV faili
    $kasutajaAndmed | Export-Csv -Path "$samAccountName.csv" -NoTypeInformation

    Write-Host "Kasutaja $samAccountName loodud edukalt. Kasutaja andmed salvestatud faili $samAccountName.csv."
}