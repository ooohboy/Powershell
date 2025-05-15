Function Get-ReverseString {
    <#
    .SYNOPSIS
    Reverse a string

    .DESCRIPTION
    Reverses the string in its entirety. That is it does not reverse each word in a string individually.

    .PARAMETER Forward
    The string to be reversed

    .EXAMPLE
    Get-ReverseString "PowerShell"
    
    This will return llehSrewoP

    .EXAMPLE
    Get-ReverseString "racecar"

    This will return racecar as it is a palindrome
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Position=1, ValueFromPipeline=$true)]
        [string]$Forward
	)

    [System.Collections.ArrayList]$reversed= @()
    for ($i = -1; $i -ge -$Forward.length; $i--) {
        $char = $Forward[$i]
        $reversed.Add($char) | Out-Null
    }

    $out = ""
    foreach ($char in $reversed) {
        $out += $char
    }
	
	return $out
}
