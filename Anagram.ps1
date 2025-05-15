Function Invoke-Anagram() {
    <#
    .SYNOPSIS
    Determine if a word is an anagram of other words in a list.

    .DESCRIPTION
    An anagram is a word formed by rearranging the letters of another word, e.g., spar, formed from rasp.
    Given a word and a list of possible anagrams, find the anagrams in the list.

    .PARAMETER Subject
    The word to check

    .PARAMETER Candidates
    The list of possible anagrams

    .EXAMPLE
    Invoke-Anagram -Subject "listen" -Candidates @("enlists" "google" "inlets" "banana")
    #>
    [CmdletBinding()]
    Param(
        [string]$Subject,
        [string[]]$Candidates
    )

    [System.Collections.ArrayList]$anagrams = @()
    foreach ($cand in $Candidates) {
        $cand = $cand.ToLower()
        #[Char[]] $matched = @()
        $letters_to_match = $Subject.ToLower().ToCharArray()
        for ($i = 0; $i -lt $cand.length; $i++) {
            $char = $cand[$i]
            $index_match = $letters_to_match.IndexOf([char]$char)
            if ($index_match -ne -1) {
                $split_down = $letters_to_match[0..($index_match-1)]
                $split_up = $letters_to_match[($index_match+1)..($letters_to_match.length)]
                if ($index_match -eq 0) {
                    $letters_to_match = $split_up
                } elseif ($index_match -eq $letters_to_match.length) {
                    $letters_to_match = $split_down
                } else{
                    $letters_to_match = $split_down + $split_up
                }
            }
        }
        if (($letters_to_match.Count -eq 0) -and ($cand.length -eq $Subject.length) -and ($cand -ne $Subject)) {
            $anagrams.Add($cand) | Out-Null
        }
    }

    return $anagrams
}
