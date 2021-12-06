$inputCo = Get-Content .\input.txt

$co = New-Object -TypeName System.Collections.ArrayList

foreach ($line in $inputCo) {
    $x1 = $line.Split(",")[0]
    $y1 = ($line -split " -> ")[0].Split(",")[1]
    $x2 = ($line -split " -> ")[1].Split(",")[0]
    $y2 = ($line -split " -> ")[1].Split(",")[1]

    if ($x1 -eq $x2 -or $y1 -eq $y2) {
        if ($y1 -eq $y2) {
            $x1..$x2 | ForEach-Object {$co += "$_,$y2"}
        }
        if ($x1 -eq $x2) {
            $y1..$y2 | ForEach-Object {$co += "$x2,$_"}
        }
    }
    else {
        $p1 = [math]::Abs($x1-$x2)
        $p2 = [math]::Abs($y1-$y2)
        if ($p1 -eq $p2) {
            $tg = "$x2,$y2"
            $r = "$x1,$y1"
            $co += $r
            do {
                if ($x1 -lt $x2 -and $y1 -lt $y2) {
                    [int]$x1 = [int]$x1 + 1
                    [int]$y1= [int]$y1 + 1
                    $r = "$x1,$y1"
                    $co += $r
                }
                elseif ($x1 -lt $x2 -and $y1 -gt $y2) {
                    [int]$x1 = [int]$x1 + 1
                    [int]$y1= [int]$y1 - 1
                    $r = "$x1,$y1"
                    $co += $r
                }
                elseif ($x1 -gt $x2 -and $y1 -lt $y2) {
                    [int]$x1 = [int]$x1 - 1
                    [int]$y1= [int]$y1 + 1
                    $r = "$x1,$y1"
                    $co += $r
                }
                elseif ($x1 -gt $x2 -and $y1 -gt $y2) {
                    [int]$x1 = [int]$x1 - 1
                    [int]$y1= [int]$y1 - 1
                    $r = "$x1,$y1"
                    $co += $r
                }
            } until ($r -eq $tg)
        }
    }
}

$co | Group-Object | Where-Object Count -ge 2 | Measure-Object