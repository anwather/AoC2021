$import = Get-Content .\r.txt
$total = 0

for($i = 1; $i -lt $import.length; $i++)
{
    if([int]$import[$i] -gt [int]$import[$i-1])
    {
        $total++
    }
}
write-host Part1: $total

$total = 0
for($i = 0; $i -lt $import.length; $i++)
{
    $x = $i + 2
    $n = $i + 1
    $z = $n + 2

    $cur = $import[$i..$x] | Measure-Object -Sum
    $next = $import[$n..$z] | Measure-Object -Sum

    if($cur.sum -lt $next.sum)
    {
        $total++
    }
}
write-host Part2: $total