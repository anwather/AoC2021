$numbers = (Get-Content .\input.txt)[0]

# $inputBoard = Get-Content .\input.txt
# remove-item .\fix.txt
# for ($i = 2; $i -lt $inputBoard.Count; $i++) {
#     " $($inputBoard[$i]) " | Out-File fix.txt -Append
# }


remove-item .\fix.txt
(Get-Content .\input.txt).Replace(" ",",").Replace(",,",",") | Set-Content fix.txt
$inputBoard = Get-Content .\fix.txt
remove-item .\fix.txt
for ($i = 2; $i -lt $inputBoard.Count; $i++) {
    $inputBoard[$i] -replace "^," | Out-File fix.txt -Append
}

$inputBoard = Get-Content .\fix.txt
remove-item .\fix.txt
$inputBoard | Where-Object {$_ -ne ""} | Out-file .\fix.txt -Append

foreach ($n in $numbers.Split(",")) {
    $inputBoard = Get-Content .\fix.txt
    $n | Out-Null
    remove-item .\fix.txt
    
    foreach ($line in $inputBoard) {
        
        if ($line.Split(",") -contains $n) {
            $r = $line.Split(",").IndexOf($n)
            $g = $line.Split(",")
            $g[$r] = "*"
            $g -join "," | Out-File fix.txt -Append
            
        }
        else {
            $line | Out-File fix.txt -Append
        }
    }
    $inputBoard = Get-Content .\fix.txt
    for ($i = 0; $i -lt $inputBoard.Count; $i++) {
        if (($inputBoard[$i].Split(",") | Where-Object {$_ -eq "*"} | Measure-Object).Count -eq 5) {
            Write-Output [$inputBoard[$i]]
        }
    }
    for ($i = 0; $i -le ($inputBoard.Count/5); $i=$i+5) {
        if ($inputBoard[$i].Split(",") -contains '*') {
            $e = $inputBoard[$i].Split(",").IndexOf("*")
            $cnt = 0
            for ($j = $i; $j -lt ($i+5); $j++) {
                if ($inputBoard[$j].Split(",")[$e] -eq "*") {
                    $cnt ++
                }
            }
            if ($cnt -eq 5) {
                Write-Output "win"
            }
        }
    }
}
    
