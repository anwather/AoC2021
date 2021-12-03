$import = Get-Content input.txt

[int]$h = 0
[int]$d = 0
[int]$a = 0

foreach ($line in $import) {
    switch -Regex ($line) {
        "down" {$a = $a + $line.Split()[1]}
        "up" {$a = $a - $line.Split()[1]}
        "forward" {$h = $h + $line.Split()[1];$d = $d + ($a * [int]$line.Split()[1])}
    }
}

$h * $d