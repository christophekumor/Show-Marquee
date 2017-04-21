function Show-Marquee
{
	param
	(
		[Parameter(Mandatory = $false)]
		[int]$startposition = 0,
		[Parameter(Mandatory = $true)]
		$formObject,
		[Parameter(Mandatory = $true)]
		[int]$length,
		[Parameter(Mandatory = $true)]
		[string]$text
	)
	
	<#
	.SYNOPSIS
		Show a Marquee (text scrolling)
	
	.DESCRIPTION
		Show a marquee in an object ex : textbox , label, in fact all object with a settable .text propertie
	
	.PARAMETER startposition
		Current position. first one is 0
	
	.PARAMETER formObject
		Where the text will be set (label,textbox).
	
	.PARAMETER length
		Length/part of the text we want to show.
	
	.PARAMETER text
		The text we want to show.
	
	.EXAMPLE
	PS C:\> $timer1_Tick={
	$global:currentpos = Show-Marquee -startposition $global:currentpos -formObject $label1 -length 50 -text "PowerShell French User Group rulez !!!"
	}
	
	.NOTES
		You must use it with a Timer in a GUI Form and set a global variable for the current position
#>
	
	#TODO: Place script here
	
	$TextSize = $text.Length
	
	if ($TextSize -lt $length)
	{
		$text = $text * [int][Math]::Ceiling($length/$TextSize)
		$TextSize = $text.Length
	}
	
	if ($startposition -ge $TextSize)
	{
		$startposition = 0
	}
	$currentend = $TextSize - $startposition
	
	
	if ($currentend -lt $length)
	{
		$addend = ($length - $currentend)
		if ($addend -gt $TextSize) { $addend = $TextSize }
		
		$formObject.Text = ($text.Substring($startposition, $currentend) + $text.Substring(0, $addend)).padright($length, '.')
	}
	else
	{
		$formObject.Text = $text.Substring($startposition, $length)
	}
	
	return $startposition += 1
}
