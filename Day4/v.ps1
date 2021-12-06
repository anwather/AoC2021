$numbers = (Get-Content .\input.txt)[0]

$inputBoard = Get-Content .\input.txt
remove-item .\fix.txt
for ($i = 2; $i -lt $inputBoard.Count; $i++) {
    $inputBoard[$i] -replace "^\s{1}" | Out-File fix.txt -Append
}

$inputBoard = Get-Content .\fix.txt
remove-item .\fix.txt
for ($i = 0; $i -lt $inputBoard.Count; $i++) {
    $inputBoard[$i] -replace "\s{2}"," " | Out-File fix.txt -Append
}


$inputBoard = Get-Content .\fix.txt
$boards = @()
$b = @()
$cnt = 0
$boards[$cnt] = @()
for ($i = 0; $i -lt $inputBoard.Count; $i=$i+4) {
    $b = @()
    for ($j = 0; $j -lt 5; $j++) {
        $b += $j
        $b[$j] = @()
        foreach ($n in $inputBoard[$i+$j].Split()) {
            $b[$j] += [int]$n
        }
            
        
    }
 
    $boards[$cnt] += @($b)
    $cnt++
}