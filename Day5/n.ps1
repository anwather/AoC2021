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
}

$co | Group-Object | Where-Object Count -ge 2 | Measure-Object