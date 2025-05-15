Function Get-PlanetDivisor($Planet) {
    switch ($Planet) {
        "Mercury" {return 0.2408467}
        "Venus" {return 0.61519726}
        "Earth" {return  1.0}
        "Mars" {return 1.8808158}
        "Jupiter" {return 11.862615}
        "Saturn" {return 29.447498}
        "Uranus" {return 84.016846}
        "Neptune" {return 164.79132}
        default {return -1.0}
    }
}

Function Get-Years ($Planet, $EarthYears) {
    $planet_divisor = Get-PlanetDivisor $Planet
    if ($planet_divisor -eq -1.0) {
        throw "planet in another solar sistem maybe"
    }
    return $EarthYears/$planet_divisor
}

Function Get-SpaceAge() {
    <#
    .SYNOPSIS
    Given an age in seconds, calculate how old someone would be on a planet in the solar system. (RIP Pluto)
    
    .DESCRIPTION
    The function takes a positive integer, and return a double (float) to show how old someone is on a specific planet.

    .PARAMETER $Seconds
    The seconds of a person's age.

    .PARAMETER $Planet
    The planet to calculate how old the person would be on it.
    Note: Since the planets in the solar system is a known shortlist, we can just validate the input with a set of values in the params.
    If no planet is specified, it should be default to Earth.
    
    .EXAMPLE
    Get-SpaceAge -Seconds 1000000000 -Planet Neptune
    Retuns: 0.19
    #>
    [CmdletBinding()]
    Param(
        [int]$Seconds,
        [ValidateSet("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune")]
        [string]$Planet
    )

    $to_earth_years = $Seconds/31536000
    if ([string]::IsNullOrEmpty($Planet)) {
        $to_planet_year = Get-Years "Earth" $to_earth_years
    } else {
        $to_planet_year = Get-Years $Planet $to_earth_years
    }

    return $to_planet_year
}