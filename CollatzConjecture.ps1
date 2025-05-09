Function Invoke-CollatzConjecture() {
    [CmdletBinding()]
    Param(
        [Int64]$Number
    )

    if($Number -lt 1) {
        throw "*error: Only positive numbers are allowed*"
    }

    $counter = 0
    while($Number -ne 1) {
        $isEven = $Number % 2
        if ($isEven -eq 0) {
            $Number = $Number / 2
        } else {
            $Number = $Number * 3
            $Number += 1
        }
        $counter += 1
    }

     Write-Output $counter
}
