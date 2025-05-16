Function Get-Slices() {
    <#
    .SYNOPSIS
    Given a string of digits, output all the contiguous substrings of length `n` in that string.
    
    .DESCRIPTION
    The function takes a string of digits and returns all the contiguous substrings of length `n` in that string.

    .PARAMETER Series
    The string of digits

    .PARAMETER SliceLength
    The length of the slices to return
    
    .EXAMPLE
    Get-Slices -Series "01234" -SliceLength 2
    
    Returns: @("01", "12", "23", "34")
    #>
    [CmdletBinding()]
    Param(
        [string]$Series,
        [int]$SliceLength
    )
   
    if ([string]::IsNullOrEmpty($Series)) {
        throw "*Series cannot be empty.*"
    } 

    if ($SliceLength -eq 0) {
        throw "*Slice length cannot be zero.*"
    } 

    if ($SliceLength -lt 0) {
        throw "*Slice length cannot be negative.*"
    } 
    
    if ($SliceLength -gt $Series.Length) {
        throw "*Slice length cannot be greater than series length.*"
    }

    [System.Collections.ArrayList] $out = @()
    for ($i = 0; $i -le ($Series.length - $SliceLength); $i++) {
        $subset = $Series[$i..($i+$SliceLength-1)]
        $to_add = ""
        foreach ($digit in $subset) {
            $to_add += $digit
        }
        $out.Add($to_add) | Out-Null
    }

    return $out
    Throw "Please implement this function"
}
