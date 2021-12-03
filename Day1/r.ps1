$v = Get-Content .\r.txt
$c = 0
for ($i = 0; $i -lt $v.Count; $i++) {
    [int]$x = $v[$i]
    [int]$y = $v[$i+1]
    if ($y -gt $x) {
        $c ++
    }
}
Write-Output $c