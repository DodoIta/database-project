<?php
// inizializzo sessione
session_start();

// validazione degli input
if(!isset($_POST['nome']) || $_POST['nome']=="")
  echo "Inserire il proprio nome.";
  else
    if(!isset($_POST['cognome']) || $_POST['cognome']=="")
      echo "Inserire il proprio cognome";
      else
        if(!isset($_POST['email']) || $_POST['email']=="")
          echo "Inserire un'e-mail valida.";
        else {
          include "metodi.php";
          $database = new db_methods();
          // recupero i valori dei dati inseriti nel form
          $nome = $_POST['nome'];
          $cognome = $_POST['cognome'];
          $email = $_POST['email'];
          $password = $_POST['password'];
          $sesso = $_POST['sesso'];
          $occupazione = $_POST['occupazione'];
          // mi connetto al db
          $database->connetti();
          // acquisisco il relativo lavoro
          $temp = $database->query("SELECT id_lavoro FROM lavoro WHERE nome_lavoro = '$occupazione'");
          $id_lavoro = $database->estrai($temp)->id_lavoro;
          // inserisco il nuovo utente
          $query = "INSERT INTO utente
                    VALUES (2, '$nome', '$cognome', '$sesso', '$email', '$password',
                            '1994-03-10', NULL, '$id_lavoro', NULL, NULL, 'free')";
          // disconnessione
          $database->disconnetti();
        }
?>
