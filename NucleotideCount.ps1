Function Get-NucleotideCount() {
    <#
    .SYNOPSIS
    Given a single stranded DNA string, compute how many times each nucleotide occurs in the string.
    
    .DESCRIPTION
    The genetic language of every living thing on the planet is DNA.
    DNA is a large molecule that is built from an extremely long sequence of individual elements called nucleotides.
    4 types exist in DNA and these differ only slightly and can be represented as the following symbols: 'A' for adenine, 'C' for cytosine, 'G' for guanine, and 'T' thymine.

    The function counts the occurances of A, C, G and T in the supplied strand.
    And returns a hashtable in the format:

    @{ A = 2; C = 2; G = 2; T = 3 }
    
    .PARAMETER Strand
    The DNA strand to count
    
    .EXAMPLE
    Get-NucleotideCount -Strand "ACGTAGCTT"
    
    Returns: @{ A = 2; C = 2; G = 2; T = 3 }
    #>
    [CmdletBinding()]
    Param(
        [string]$Strand
    )

    $a_counter = 0
    $c_counter = 0
    $g_counter = 0
    $t_counter = 0
    for ($i = 0; $i -lt $Strand.length; $i++) {
        if ($Strand[$i] -eq 'A') {
            $a_counter += 1
        } elseif ($Strand[$i] -eq 'C') {
            $c_counter += 1
        } elseif ($Strand[$i] -eq 'G') {
            $g_counter += 1
        } elseif ($Strand[$i] -eq 'T') {
            $t_counter += 1
        } else {
            throw "*Invalid nucleotide in strand*"
        }
    }

    return @{ A = $a_counter; C = $c_counter; G = $g_counter; T = $t_counter}
    
}
