$import = Get-Content input.txt


$v = ""

for ($i = 0; $i -lt 12; $i++) {
    $cnt1 = 0
    $cnt0 = 0
    foreach ($line in $import) {
        switch ($line[$i]) {
            "0" {$cnt0++}
            "1" {$cnt1++}
        }
    }
    if ($cnt0 -gt $cnt1) {
        $v+="0"
    }
    else {
        $v+="1"
    }
}
$v
$e = [Convert]::ToInt16($v,2)

$v = ""

for ($i = 0; $i -lt 12; $i++) {
    $cnt1 = 0
    $cnt0 = 0
    foreach ($line in $import) {
        switch ($line[$i]) {
            "0" {$cnt0++}
            "1" {$cnt1++}
        }
    }
    if ($cnt0 -lt $cnt1) {
        $v+="0"
    }
    else {
        $v+="1"
    }
}
$v
$g = [Convert]::ToInt16($v,2)

$e * $g