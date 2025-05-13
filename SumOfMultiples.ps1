Function Get-Numbers($limit, $Multiples){
    $numbs = [System.Collections.ArrayList]::new()
    for ($num = 1; $num -lt $limit; $num++){
        foreach ($mul in $Multiples) {
            if (($num % $mul) -eq 0){
                $numbs.Add($num) | Out-Null
                break
            }
        }
    }
    return $numbs
}

Function Get-Sum ($numbs) {
    $sum = 0
    foreach ($num in $numbs) {
        $sum += $num
    }
    return $sum
}


Function Get-SumOfMultiples {

    [CmdletBinding()]
    Param(
        [int[]]$Multiples,
        [int]$Limit
    )

    $numbs = Get-Numbers $Limit $Multiples
    $sum = Get-Sum $numbs

    return $sum
}
