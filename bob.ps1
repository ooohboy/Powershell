function Is-Letter ($char){
    if (($char -cmatch '[A-Z]') -or ($char -cmatch '[a-z]')) {
        return 1
    }
    else {
        return 0
    }
}

function Is-Lower ($char){
    if ($char -cmatch '[a-z]') {
        return 1
    }
    else {
        return 0
    }
}

function Is-Upper ($toCheck) {
    $out = 1
    $ok = 0
    foreach ($char in -split $toCheck){
        $isLetter = Is-Letter $char
        if ($isLetter -eq 1){
             $isLower = Is-Lower $char
             if ($isLower -eq 1){
                 return 0
             } else {
                 $ok = 1
             }
        } else {
            continue
        }
    }
    if ($ok -eq 0){
        return 0
    }
    return $out 
}

Function Get-BobResponse() {

    [CmdletBinding()]
    Param(
        [string]$HeyBob
    )

    if ([string]::IsNullOrWhiteSpace($HeyBob)) {
        return "Fine. Be that way!"
    }

    $trimmed = $HeyBob.Trim()
    
    $isYelling = Is-Upper $trimmed
    $isQuestion = $trimmed.EndsWith("?")

    if (($isYelling -eq 1) -and $isQuestion) {
        return "Calm down, I know what I'm doing!"
    }
    elseif ($isQuestion) {
        return "Sure."
    }
    elseif (($isYelling -eq 1)) {
        return "Whoa, chill out!"
    }
    else {
        return "Whatever."
    }
}
