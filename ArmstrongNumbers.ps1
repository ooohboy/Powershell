Function Invoke-ArmstrongNumbers() {
    <#
    .SYNOPSIS
    Determine if a number is an Armstrong number.

    .DESCRIPTION
    An Armstrong number is a number that is the sum of its own digits each raised to the power of the number of digits.

    .PARAMETER Number
    The number to check.

    .EXAMPLE
    Invoke-ArmstrongNumbers -Number 12
    #>
    [CmdletBinding()]
    Param(
        [Int64]$Number
    )

    $to_str = $Number.ToString()
    $check_armstrong = 0
    for ($i = 0; $i -lt $to_str.length; $i++) {
        $digit = [convert]::ToInt32($to_str[$i], 10)
        $pow = [math]::Pow($digit, $to_str.length)
        $check_armstrong += $pow
    }
    if ($check_armstrong -eq $Number) {
        return $true
    }

    return $false
}