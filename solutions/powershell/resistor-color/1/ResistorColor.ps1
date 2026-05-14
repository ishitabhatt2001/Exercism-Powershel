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
Function Get-ColorCode() {
    <#
    .SYNOPSIS
    Translate a color to its corresponding color code.

    .DESCRIPTION
    Given a color, return its corresponding color code.

    .PARAMETER Color
    The color to translate to its corresponding color code.

    .EXAMPLE
    Get-ColorCode -Color "black"
    #>
    [CmdletBinding()]
    Param(
        [string]$Color
    )
    return $Global:ResistorColors.IndexOf($Color.ToLower())
}

Function Get-Colors() {
    <#
    .SYNOPSIS
    Return the list of all colors.

    .DESCRIPTION
    Return the list of all colors.

    .EXAMPLE
    Get-Colors
    #>
    return $Global:ResistorColors
}
