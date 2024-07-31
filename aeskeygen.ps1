$random = [System.Security.Cryptography.RandomNumberGenerator]::Create();
$outfilepatch = "./Aeskeys.txt"

function Get-Aeskey {
	
for($i=0; $i -lt 10; $i++){
  $buffer = New-Object byte[] 32;
  $random.GetBytes($buffer);
  $key = [BitConverter]::ToString($buffer).Replace("-", [string]::Empty);
  Write-Host "Key $($i): $($key)"
  $Procs = "Key $($i): $($key)"
  Out-File -InputObject $Procs  -FilePath $outfilepatch -Append
 }
 
}

function Reperat {
	 $continue = Read-Host -Prompt "Continue? [y/n]"
	if ( $continue -eq 'y' ) { 
		$outfilepatch = "./Aeskeys.txt"
		Out-File -InputObject '------------------------------'  -FilePath $outfilepatch -Append
		Get-Aeskey
		Reperat
	}
}
Get-Aeskey
Reperat
CMD /c PAUSE
