
<#
##################################################

A Tool for pinging Old School Runescape game servers.

User types the server's number in an inputbox and the tool displays the ping results in an Output box.
Also allows users to choose how many packets are being sent and received. 

* Potential soon to come updates: *
- A button for pinging all of the game worlds at once.

@ Markus Pyhäranta. 16.7.2017.

##################################################
#>

<##########== Script Starts Here ==##########>



#Loading of .NET assemblies for GUI
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")  

########## Functions ##########


function PingInfo {

	#Get user input
		$TargetWorld = $InputBox.text;
	#Get selected ping count
		$Count = $DropDownBox.SelectedItem.ToString()
	#Ping the server
		$PingResult = ping oldschool$TargetWorld.runescape.com -n $Count| fl | out-string;
	#Output the results
		$OutputBox.text = $PingResult
                     

						} #End PingInfo

########## End Functions ##########

########## GUI Starts Here ##########

#Main form
$Form = New-Object System.Windows.Forms.Form    
$Form.Text = "Oldschool Runescape Ping"
$Form.Size = New-Object System.Drawing.Size(535,420) 
$Form.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon('C:\Users\Markus\Desktop\favicon.ico') #Logo for form
#$Form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedToolWindow # <- Fixed windows size


#Heading
$Label = New-Object system.windows.Forms.Label
$Label.Text = "Tool for testing OSRS server connections"
$Label.AutoSize = $true
$Label.location = new-object system.drawing.point(5,10)
$Label.Font = "Microsoft Sans Serif,14,style=Underline"
$Label.ForeColor = "#51b5f7"
$Form.controls.Add($Label)


#Paragraph "Insert"
$Label2 = New-Object system.windows.Forms.Label
$Label2.Text = "Insert world number below:"
$Label2.AutoSize = $true
$Label2.location = new-object system.drawing.point(10,40)
$Label2.Font = "Microsoft Sans Serif,11"
$Form.controls.Add($Label2)


#User InputBox for inserting game world
$InputBox = New-Object System.Windows.Forms.TextBox 
$InputBox.Location = New-Object System.Drawing.Size(10,90) 
$InputBox.Size = New-Object System.Drawing.Size(50,20) 
$InputBox.Font = "Microsoft Sans Serif,12"
$InputBox.MaxLength = "2"
$InputBox.textAlign = "center"
$Form.Controls.Add($InputBox) 


#Paragraph "Note"
$Label3 = New-Object system.windows.Forms.Label
$Label3.Text = "Note: Also setup how many ping results you would like."
$Label3.AutoSize = $true
$Label3.location = new-object system.drawing.point(10,355)
$Label3.Font = "Microsoft Sans Serif,9"
$Form.controls.Add($Label3)


#Paragraph "Count"
$Label4 = New-Object system.windows.Forms.Label
$Label4.Text = "Count:"
$Label4.AutoSize = $true
$Label4.location = new-object system.drawing.point(375,353)
$Label4.Font = "Microsoft Sans Serif,11"
$Label4.ForeColor = "#51b5f7"
$Form.controls.Add($Label4)


#OutputBox for displaying ping results to user
$OutputBox = New-Object System.Windows.Forms.TextBox 
$OutputBox.Location = New-Object System.Drawing.Size(10,125) 
$OutputBox.Size = New-Object System.Drawing.Size(500,220) 
$OutputBox.BackColor = "white"
$OutputBox.Font = "consolas, 8"
$OutputBox.MultiLine = $True 
$OutputBox.ScrollBars = "Vertical" 
$OutputBox.Enabled = $True
$OutputBox.ReadOnly = $True #Prevents user input
$Form.Controls.Add($OutputBox) 


#Dropdown list for selecting packet count
$DropDownBox = New-Object System.Windows.Forms.ComboBox
$DropDownBox.Location = New-Object System.Drawing.Size(430,350) 
$DropDownBox.Size = New-Object System.Drawing.Size(60,15) 
$DropDownBox.DropDownHeight = 200 
$DropDownBox.Font = "Microsoft Sans Serif,11"
$DropDownBox.DropDownStyle =
	[System.Windows.Forms.ComboBoxStyle]::DropDownList; #Prevents user input
$Form.Controls.Add($DropDownBox) 


	#Items for DropDownBox

	$CountList=@("1","4","8")
	foreach ($CountNumber in $CountList) {
                      $DropDownBox.Items.Add($CountNumber)
					  $DropDownBox.SelectedIndex = 0 #Default value for DropDownBox. The first item in list. Set to 1 by default.
                             } #end foreach

							 
#Ping Button. Calls for function PingInfo.
$Button2 = New-Object System.Windows.Forms.Button 
$Button2.Location = New-Object System.Drawing.Size(400,75) 
$Button2.Size = New-Object System.Drawing.Size(110,40) 
$Button2.Text = "Ping" 
$Button2.Font = "10"
$Button2.Add_Click({PingInfo}) 
$Form.Controls.Add($Button2) 


########## GUI Ends Here ##########

$Form.Add_Shown({$Form.Activate()})
[void] $Form.ShowDialog()

<##########== Script ends here ==##########>
