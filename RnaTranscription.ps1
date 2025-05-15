Function Map-Char($char) {
    switch ($char) {
        "G" {return "C"}
        "C" {return "G"}
        "T" {return "A"}
        "A" {return "U"}
        default {return "X"}
    }
}

Function Invoke-RnaTranscription() {
    <#
    .SYNOPSIS
    Transcribe a DNA strand into RNA.

    .DESCRIPTION
    Given a DNA strand, return its RNA complement (per RNA transcription).

    .PARAMETER Strand
    The DNA strand to transcribe.

    .EXAMPLE
    Invoke-RnaTranscription -Strand "A"
    #>
    [CmdletBinding()]
    Param(
        [string]$Strand
    )

    $out = ""
    for ($i = 0; $i -lt $Strand.length; $i++) {
        $char = $Strand[$i]
        $mapped = Map-Char $char
        if ($mapped -eq "X") {
            throw "error"
        }
        $out += $mapped
    }

    return $out
    
}
