Function Invoke-Isogram() {
    <#
    .SYNOPSIS
    Determine if a word or phrase is an isogram.
    
    .DESCRIPTION
    An isogram (also known as a "nonpattern word") is a word or phrase without a repeating letter,
    however spaces and hyphens are allowed to appear multiple times.
    
    .PARAMETER Phrase
    The phrase to check if it is an isogram.
    
    .EXAMPLE
    Invoke-Isogram -Phrase "isogram"
    
    Returns: $true
    #>
    [CmdletBinding()]
    Param(
        [string]$Phrase
    )

    [System.Collections.ArrayList]$check = @()
    for ($i = 0; $i -lt $Phrase.length; $i++) {
        $char = $Phrase.ToLower()[$i]
        if (-not ($char -match "[a-z]")) {
            continue
        }
        if ($check.Contains($char)) {
            return $false
        } else {
            $check.Add($char) | Out-Null
        }
    }

    return $true
}
