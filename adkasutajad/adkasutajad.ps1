#Kasutaja detailide faili asukoha kehtestamine
$file = "C:\Users\Administrator\Desktop\adusers.csv"

#Kasutaja detailide lugemine failist
$users = Import-Csv $file -Encoding Default -Delimiter ";"

#Translit funktsiooni kasutamine täpitähtede tõlgendamiseks
function Translit {
    param (
        [string] $inputstring
        )
    $Translit = @{
    [char]'ä' = 'a'
    [char]'ü' = 'u'
    [char]'õ' = 'o'
    [char]'ö' = 'o'
    }
    $outputString=""
    foreach ($character in $inputCharacter = $inputString.ToCharArray())
    {
        if ($Translit[$character] -cne $Null)
        {
            $outputString += $Translit[$character]
        }
        else 
        {
        $outputString += $character
        }
    }
    Write-Output $outputString
}

foreach ($user in $users){
    
    #Kasutajanime loomine
    $username = $user.FirstName + "." + $user.LastName
    $username = $username.ToLower()
    $username = Translit($username)
    
    #Emaili loomine
    $upname = $username + "@sv-kool.local"
    
    #Ekraaninime loomine
    $displayname = $user.FirstName + " " + $user.LastName
    
    #ADUser loomine
    New-ADUser -Name $username `
        -DisplayName $displayname`
        -GivenName $user.FirstName`
        -Surname $user.LastName`
        -Department $user.Department`
        -Title $user.Role`
        -UserPrincipalName $upname`
        -AccountPassword (ConvertTo-SecureString $user.Password -AsPlainText -force) -Enabled $true
    }
