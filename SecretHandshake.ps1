Function Map-Char($index){
    switch($index) {
        -1 {return "wink"}
        -2 {return "double blink"}
        -3 {return "close your eyes"}
        -4 {return "jump"}
        -5 {return "reverse"}
    }
}

Function Invoke-SecretHandshake() {

    [CmdletBinding()]
    Param(
        [int]$Number
    )

    $toBin = [Convert]::ToString($Number, 2)

    $handshake = [System.Collections.ArrayList]::new()
    for ($i = -1; $i -ge -$toBin.length; $i--) {
        $onoff = $toBin[$i]
        if ($onoff -eq '1') {
            $code = Map-Char $i
            if ($code -eq "reverse") {
                $handshake.Reverse()
            } else {
                $handshake.Add($code) | Out-Null
            }
        }
    }
    
    
    
    return $handshake
}