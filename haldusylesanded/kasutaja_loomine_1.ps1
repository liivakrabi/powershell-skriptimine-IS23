# faili asukoht
$Fail = "C:\Users\powerojaots\Desktop\kasutajad.csv"

#loeme faili sisu
$Kasutajad = Import-Csv $Fail -Encoding Default -Delimiter ";"

foreach ($kasutaja in $Kasutajad){
    $KasutajaNimi = $kasutaja.Kasutajanimi
    $TaisNimi = $kasutaja.Taisnimi
    $KontoKirjeldus = $kasutaja.KontoKirjeldus
    $Parool = $kasutaja.Parool | ConvertTo-SecureString -AsPlainText -Force
    New-LocalUser -Name $KasutajaNimi -Password $Parool -FullName "$TaisNimi" -Description "$KontoKirjeldus"

}