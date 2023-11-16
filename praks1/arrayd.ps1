$array1 = @(1,2,3)
$array2 = @(4,5,6)
$array1
Write-Host
$array2
Write-Host
$array3=@(0,0,0)
$array3[0]=$array1[0]+$array2[0]
$array3[1]=$array1[1]+$array2[1]
$array3[2]=$array1[2]+$array2[2]
$array3