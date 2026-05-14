$Global:ResistorColors = @(
    "black",  # Index 0
    "brown",  # Index 1
    "red",    # Index 2
    "orange", # Index 3
    "yellow", # Index 4
    "green",  # Index 5
    "blue",   # Index 6
    "violet", # Index 7
    "grey",   # Index 8
    "white"   # Index 9
)
Function Get-ColorCodeValue() {
    <#
    .SYNOPSIS
    Translate a list of colors to their corresponding color code values.

    .DESCRIPTION
    Given 2 colors, take the first one and times it by 10 and add the second color to it.

    .PARAMETER Colors
    The colors to translate to their corresponding color codes.

    .EXAMPLE
    Get-ColorCodeValue -Colors @("black", "brown")
    #>
    [CmdletBinding()]
    Param(
        [string[]]$Colors
    )
    $color1=$Colors[0]
    $color2=$Colors[1]

    # 2. Find their numeric values from our master list
    $digit1 = $Global:ResistorColors.IndexOf($color1.ToLower())
    $digit2 = $Global:ResistorColors.IndexOf($color2.ToLower())
    $totalValue = ($digit1 * 10) + $digit2

    return $totalValue
}
