get-content |
select-string -pattern ",35[0-2]," |
foreach-object {($_ -split ",")[1,4,0] -join " "} |
foreach-object {($_.substring(0,38) -split " ")[9,0,1,2,5,6] -join " "} |
# sort-object |
foreach-object -begin{$n=0;$array="","",""} `
               -process{if ($n -lt 2) {$array[$n]=$_; $n++} else {$array[0]+" "+$array[1]+" "+$_; $n=0}} |
foreach-object -begin{$array="","","","","","","","","","","","","","","","","",""} `
               -process{$array=($_ -split " ");
                       if ($array[0] -eq $array[6] -and $array[0] -eq $array[12] -and
                           $array[1] -eq 350 -and $array[7] -eq 351 -and $array[13] -eq 352) {
                       $array[0]+","+
                       [Convert]::ToInt32($array[2],16)+","+[Convert]::ToInt32($array[3],16)+","+
                       [Convert]::ToInt32($array[4],16)+","+[Convert]::ToInt32($array[5],16)+","+
                       [Convert]::ToInt32($array[8],16)+","+[Convert]::ToInt32($array[9],16)+","+
                       [Convert]::ToInt32($array[10],16)+","+[Convert]::ToInt32($array[11],16)+","+
                       [Convert]::ToInt32($array[14],16)+","+[Convert]::ToInt32($array[15],16)+","+
                       [Convert]::ToInt32($array[16],16)+","+[Convert]::ToInt32($array[17],16)}
                       }
