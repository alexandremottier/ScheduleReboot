$RebootTime = Read-Host "Indiquez la date et heure de redémarrage au format JJ/MM/AAAA HH:MM"
$Seconds = (New-TimeSpan -Start $(Get-Date -UFormat "%d/%m/%Y %R") -End "$RebootTime").TotalSeconds
shutdown /r /f /t $Seconds | Out-Null

if ($Seconds -lt 0) {
    $Error.Count = 1
}

if($Error.Count -eq 0) {
    Write-Host -ForegroundColor Green "Redémarrage programmé pour le $RebootTime !"
    $Result = 1
    sleep 5
}else{
    Write-Host -ForegroundColor Red "Échec de programmation du redémarrage. Vérifiez que le format de l'heure saisi est correct et qu'aucun redémarrage n'est prévu !"
    sleep 60
}
