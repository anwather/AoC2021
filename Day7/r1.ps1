$c = (Get-Content .\input.txt).Split(",")

$rm = @{}

function totalFuel {
    param([int]$f)
    [int]$e = 0
    for ($i = 1; $i -le $f; $i++) {
        $e = $e + $i
    }
    return $e
}

function totalFuel2 {
    param([int]$f)
    $e = ($f*($f+1))/2
    return $e
}

for ($i = ($c | Measure-Object -Minimum).Minimum; $i -le ($c | Measure-Object -Maximum).Maximum; $i++) {
    Write-Output $i
    [int]$t = 0
    foreach ($r in $c) {
        $m = [int]$i - [int]$r
        $v = [math]::Abs($m)
        $l = totalFuel2 -f $v
        $t = $t + [int]$l
    }
    $rm.Add($i,$t)
}

$rm.GetEnumerator() | Sort-Object -Property Value | Select-Object -First 1 