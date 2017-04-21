# Show-Marquee
Show a marquee in an object ex : textbox , label.. in fact all object with a settable .text propertie

Example :

#Start the Timer
$form1_Load={
		$timer1.Enabled = $true
}


#use the function in the timer Tick
$timer1_Tick={
$global:currentpos = Show-Marquee -startposition $global:currentpos -formObject $label1 -length 50 -text "PowerShell French User Group rulez !!!"

$global:currentpos2 = Show-Marquee -startposition $global:currentpos2 -formObject $textbox1 -length 50 -text "PowerShell French User Group rulez !!! PowerShell French User Group rulez !!! "
}
