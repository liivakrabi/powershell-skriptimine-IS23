while(Get-Process Notepad -ErrorAction SilentlyContinue)
{
Start-Sleep -s 2
Write-Host "Notepad is running"
}