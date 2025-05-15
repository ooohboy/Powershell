Enum Triangle {
    EQUILATERAL
    ISOSCELES
    SCALENE
}

Function Check ($sides) {
    for ($i = 0; $i -lt $sides.length; $i++) {
        $side = $sides[$i]
        if ($side -le 0) {
            throw "*All side lengths must be positive.*"
        }
        $sum_other_sides = 0
        for ($j = 0; $j -lt $sides.length; $j++) {
            if ($i -eq $j) {
                continue
            }
            $other_side = $sides[$j]
            if ($other_side -le 0) {
                throw "*All side lengths must be positive.*"
            }
            $sum_other_sides += $other_side
        }
        if (-not ($sum_other_sides -ge $side)) {
            throw "*Side lengths violate triangle inequality.*"
        }
    }
}

Function Get-Triangle() {
    <#
    .SYNOPSIS
    Determine if a triangle is equilateral, isosceles, or scalene.

    .DESCRIPTION
    Given 3 sides of a triangle, return the type of that triangle if it is a valid triangle.
    
    .PARAMETER Sides
    The lengths of a triangle's sides.

    .EXAMPLE
    Get-Triangle -Sides @(1,2,3)
    Return: [Triangle]::SCALENE
    #>
    
    [CmdletBinding()]
    Param (
        [double[]]$Sides
    )

    Check $Sides

    $a = $Sides[0]
    $b = $Sides[1]
    $c = $Sides[2]
    if (($a -eq $b) -and ($a -eq $c)) {
        return [Triangle]::EQUILATERAL
    } elseif (($a -ne $b) -and ($b -ne $c) -and ($c -ne $a)) {
        return [Triangle]::SCALENE
    } else {
        return [Triangle]::ISOSCELES
    }
    
    
    Throw "Please implement this function"
}