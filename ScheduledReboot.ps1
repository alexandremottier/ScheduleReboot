# Déclaration des variables
$Date = Read-Host -Prompt "A quelle date doit redémarrer le serveur ? (aujourd'hui : 0 ; demain : 1)"
$Time = Read-Host -Prompt "A quelle heure doit redémarrer le serveur ? (defaut : 4h)"

# Affectation de la valeur par défaut (si non complétion)
if (!$Date)
{
    $Date = 0
}
if (!$Time)
{
    $Time = 4
}

# Envoi de la commande de shutdown basé sur l'heure saisie
shutdown -r -t ([decimal]::round(((Get-Date).AddDays($Date).Date.AddHours($Time) - (Get-Date)).TotalSeconds))

# Message affichant la bonne ou mauvaise prise en compte de la demande
if ($LASTEXITCODE -eq "0") { write-host "La planification a bien été prise en compte" }
else { write-host "La planification a rencontré une erreur. Un redémarrage est-il déjà programmé pour cette machine ?" }
