function Show-Image{
param(
[Parameter(Mandatory=$True,Position=1)][string]$Source,
[Parameter(Mandatory=$False,Position=2)][string]$FormName='Image'
#<TODO><NiceToHave> Add 3rd parameter for scaling
)
# Loosely based on http://www.vistax64.com/powershell/202216-display-image-powershell.html
 
[void][reflection.assembly]::LoadWithPartialName("System.Windows.Forms")
 
write-host $Source

#$file = (get-item 'C:\Users\Public\Pictures\Sample Pictures\Chrysanthemum.jpg')
$file = (get-item $Source)
 
$img = [System.Drawing.Image]::Fromfile($file);
 
# This tip from http://stackoverflow.com/questions/3358372/windows-forms-look-different-in-powershell-and-powershell-ise-why/3359274#3359274
[System.Windows.Forms.Application]::EnableVisualStyles();
$form = new-object Windows.Forms.Form
$form.Text = $FormName
$form.Width = $img.Size.Width;
$form.Height =  $img.Size.Height;
$pictureBox = new-object Windows.Forms.PictureBox
$pictureBox.Width =  $img.Size.Width;
$pictureBox.Height =  $img.Size.Height;
 
$pictureBox.Image = $img;
$form.controls.add($pictureBox)
$form.Add_Shown( { $form.Activate() } )
$form.ShowDialog()
 
}



<#-----------------------------For testing --------------------------------------#>
Show-Image 'Testimage.jpg' 'You can input your text here'