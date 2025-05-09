Function Get-ColorCode() {
    [CmdletBinding()]
    Param(
        [string]$Color
    )

    $colors = Get-Colors

    $code = $colors.IndexOf($Color)

    if ($code -ne -1){
        return $code
    }
    
    throw "color not implemented"
}

Function Get-Colors() {

    $colors = "black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"

    return $colors
}
