#[System.Collections.ArrayList]$import = Get-Content input.txt


$v = ""
Copy-Item .\input.txt tmp.txt -Force

for ($i = 0; $i -lt 12; $i++) {
    [System.Collections.ArrayList]$import = Get-Content tmp.txt
    remove-item .\tmp.txt
    foreach ($line in $import) {
        $cnt1 = 0
        $cnt0 = 0
        foreach ($line in $import) {
            switch ($line[$i]) {
                "0" {$cnt0++}
                "1" {$cnt1++}
            }
        }
        
    }

    if ($cnt0 -gt $cnt1 -or $cnt -eq $cnt1) {
        $v+="0"
    }
    else {
        $v+="1"
    }

    foreach ($line in $import) {
        if ($line -match "^$v") {
            $line | Out-File tmp.txt -Append
        }
    }
    
}

$og = [Convert]::ToInt16($(Get-Content tmp.txt),2)

$v = ""
Copy-Item .\input.txt tmp.txt -Force

for ($i = 0; $i -lt 12; $i++) {
    [array]$import = Get-Content tmp.txt
    if ($import.Count -gt 1) {
        remove-item .\tmp.txt
    }
    foreach ($line in $import) {
        $cnt1 = 0
        $cnt0 = 0
        foreach ($line in $import) {
            switch ($line[$i]) {
                "0" {$cnt0++}
                "1" {$cnt1++}
            }
        }
        
    }

    if ($cnt0 -lt $cnt1 -or $cnt0 -eq $cnt1) {
        $v+="0"
    }
    else {
        $v+="1"
    }

    foreach ($line in $import) {
        if ($line -match "^$v") {
            $line | Out-File tmp.txt -Append
        }
    }
    
}

$co = [Convert]::ToInt16($(Get-Content .\tmp.txt),2)

$co * $og