## Editing this file for best
## run as admin  " Set-ExecutionPolicy -Scope CurrentUser RemoteSigned "

$random = [System.Security.Cryptography.RandomNumberGenerator]::Create();
$datetime = Get-Date
$outfilepatch = "./Aeskeys.txt"
$inline = '------------------------------'
Out-File -InputObject $datetime  -FilePath $outfilepatch 
Out-File -InputObject $inline  -FilePath $outfilepatch -Append

function Get-Aeskey {
	
for($i=1; $i -lt 11; $i++){
  $buffer = New-Object byte[] 32;
  $random.GetBytes($buffer);
  $key = [BitConverter]::ToString($buffer).Replace("-", [string]::Empty);
  Write-Host "Key $($i): $($key)"
  $Procs = "Key $($i): $($key)"
  Out-File -InputObject $Procs  -FilePath $outfilepatch -Append
 }
 
}

function Reperat {
	 Write-Host "Continue? [y/n]"  -ForegroundColor White -BackgroundColor Red
	 $continue = Read-Host 
	if ( $continue -eq 'y' ) { 
		Out-File -InputObject $inline  -FilePath $outfilepatch -Append
		Get-Aeskey
		Reperat
	}
}
Get-Aeskey
Reperat
Write-Host "Bye" -ForegroundColor DarkGreen -BackgroundColor White
CMD /c PAUSE
