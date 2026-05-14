$Global:ToleranceValues = @{
    "grey"   = "0.05%"
    "violet" = "0.1%"
    "blue"   = "0.25%"
    "green"  = "0.5%"
    "brown"  = "1%"
    "red"    = "2%"
    "gold"   = "5%"
    "silver" = "10%"
}

$Global:ResistorColors = @("black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white")

Function Get-ResistorLabel() {
    <#
    .SYNOPSIS
    Implement a function to get the label of a resistor from its color-coded bands.

    .DESCRIPTION
    Given an array of 1, 4 or 5 colors from a resistor, decode their resistance values and return a string represent the resistor's label.

    .PARAMETER Colors
    The array represent the colors from left to right.

    .EXAMPLE
    Get-ResistorLabel -Colors @("red", "black", "green", "red")
    Return: "2 megaohms ±2%"

    Get-ResistorLabel -Colors @("blue", "blue", "blue", "blue", "blue")
    Return: "666 megaohms ±0.25%"
     #>
    [CmdletBinding()]
    Param(
        [string[]]$Colors
    )

    $MainValue=0
    $Multiplier=0
    $Tolerance=""
    #Case1: for 1 band that is black
    if ($Colors.Count -eq 1 -and $Colors[0].ToLower() -eq "black")
        {return "0 ohms"}

    #Case2: Where there are 4 colors present
    if ($Colors.Count -eq 4 )
    {$V1=$Global:ResistorColors.IndexOf($Colors[0].ToLower())
    $V2=$Global:ResistorColors.IndexOf($Colors[1].ToLower())
    $MainValue=($V1*10)+$V2
    $multiplier = [Math]::Pow(10, $Global:ResistorColors.IndexOf($Colors[2].ToLower()))
    $tolerance = $Global:ToleranceValues[$Colors[3].ToLower()]

    }

    #Case3: Where there are 5 colors present
    elseif ($Colors.Count -eq 5 )
    {$V1=$Global:ResistorColors.IndexOf($Colors[0].ToLower())
    $V2=$Global:ResistorColors.IndexOf($Colors[1].ToLower())
    $V3=$Global:ResistorColors.IndexOf($Colors[2].ToLower())
    $MainValue=($V1*100)+($V2*10)+$V3
    $multiplier = [Math]::Pow(10, $Global:ResistorColors.IndexOf($Colors[3].ToLower()))
    $tolerance = $Global:ToleranceValues[$Colors[4].ToLower()]
    }

    # Total Ohms calculation
    $totalOhms = $mainValue * $multiplier

    # Unit Formatting Logic
    $unit = "ohms"
    if ($totalOhms -ge 1000000) {
        $totalOhms = $totalOhms / 1000000
        $unit = "megaohms"
    }
    elseif ($totalOhms -ge 1000) {
        $totalOhms = $totalOhms / 1000
        $unit = "kiloohms"
    }

    return "$totalOhms $unit ±$tolerance"
}
