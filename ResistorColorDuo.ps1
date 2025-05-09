Function Get-ColorCodeValue() {
    #[CmdletBinding()]
    #Param(
        #[string[]]$Colors
    #)
    $Colors = @("black", "yellow")
    
    $_colors = "black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"

    $firstCode = $_colors.IndexOf($Colors[0])
    
    if ($firstCode -eq -1){
        throw "Color" + $Colors[0] + "not implemented"
    }

    $secondCode = $_colors.IndexOf($Colors[1])
    
    if ($secondCode -eq -1){
        throw "Color" + $Colors[1] + "not implemented"
    }

    $outCode = $firstCode * 10
    $outCode = $outCode + $secondCode
    
    Write-Output $outCode
}
