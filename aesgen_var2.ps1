## Editing this file for best
## run as admin  " Set-ExecutionPolicy -Scope CurrentUser RemoteSigned "

[Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("cp866")

$random = [System.Security.Cryptography.RandomNumberGenerator]::Create();
$datetime = Get-Date
$outfilepatch = "./Aeskeys.txt"
$inline = '------------------------------'
Out-File -InputObject $datetime  -FilePath $outfilepatch 
Out-File -InputObject $inline  -FilePath $outfilepatch -Append

Write-Host "Введіть кількість ключів"  -ForegroundColor White -BackgroundColor Red
$c = Read-Host
Write-Host $inline
function Get-Aeskey {
	
for($i=0; $i -lt $c; $i++){
  $buffer = New-Object byte[] 32;
  $random.GetBytes($buffer);
  $key = [BitConverter]::ToString($buffer).Replace("-", [string]::Empty);
  Write-Host "Key $($i): $($key)"
  $Procs = "Key $($i): $($key)"
  Out-File -InputObject $Procs  -FilePath $outfilepatch -Append
 }
 
}

Get-Aeskey
Out-File -InputObject $inline  -FilePath $outfilepatch -Append
Write-Host $inline
Write-Host "Пока" -ForegroundColor DarkGreen -BackgroundColor White
CMD /c PAUSE
