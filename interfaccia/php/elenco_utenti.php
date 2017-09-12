<?php
// inizializzazione della sessione
session_start();

// solite operazioni preliminari
include "metodi.php";
$database = new db_methods();
$database->connetti();
$id = $_SESSION['login'];

// interrogo il db per recuperare i dati
$temp = $database->query("SELECT nome, cognome, sesso, occupazione FROM utente");

echo "<br/>Elenco utenti registrati:<br/>";
// per scorrete tutte le righe
while($risultato = $database->estrai($temp)){
  $nome = $risultato->nome;
  $cognome = $risultato->cognome;
  $sesso = $risultato->sesso;
  $occupazione = $risultato->occupazione;
  // stampo i risultati
  echo "<br/>Nome: $nome<br/>";
  echo "Cognome: $cognome<br/>";
  echo "Sesso: $sesso<br/>";
  echo "Occupazione: $occupazione<br/>";
}
// mi disconnetto dal db
$database->disconnetti();
?>
