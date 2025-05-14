Function Invoke-Panagram() {
    <#
    .SYNOPSIS
    Determine if a sentence is a pangram.
    
    .DESCRIPTION
    A pangram is a sentence using every letter of the alphabet at least once.
    
    .PARAMETER Sentence
    The sentence to check
    
    .EXAMPLE
    Invoke-Panagram -Sentence "The quick brown fox jumps over the lazy dog"
    
    Returns: $true
    #>
    [CmdletBinding()]
    Param(
        [string]$Sentence
    )

    $input = $Sentence.ToLower()

    [System.Collections.ArrayList] $check = @()

    for ($i = 0; $i -lt $input.length; $i++) {
        $char = $input[$i]
        if ($char -match '^[a-z]$') {
            if (-not $check.Contains($char)) {
                $check.Add($char) | Out-Null
            }
        }
    }
    
    if ($check.Count -eq 26) {
        return $true
    }

    return $false
}
