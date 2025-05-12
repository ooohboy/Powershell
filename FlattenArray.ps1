function Get-SubItems-From($item, $flatten_array) {
    if ($item -ne $null) {
        $item_type = $item.GetType().name
        if ($item_type -ne "Object[]") {
            $flatten_array.Insert($flatten_array.Lenght, $item)
        } else {
            foreach ($subitem in $item) {
                Get-SubItems-From $subitem $flatten_array
            }
            
        }
    }
    return
}

Function Invoke-FlattenArray() {

    [CmdletBinding()]
    Param(
        [System.Object[]]$Array
    )

    [System.Collections.ArrayList]$flatten_array = @()
    
    Get-SubItems-From $Array $flatten_array

    $flatten_array.Reverse()
    
    return $flatten_array 
    
}