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

for ($i = ($c | Measure-Object -Minimum).Minimum; $i -le ($c | Measure-Object -Maximum).Maximum; $i++) {
    [int]$t = 0
    foreach ($r in $c) {
        $m = [int]$i - [int]$r
        $v = [math]::Abs($m)
        $t = $t + [int]$v
    }
    $rm.Add($i,$t)
}

$rm.GetEnumerator() | Sort-Object -Property Value | Select-Object -First 1 
