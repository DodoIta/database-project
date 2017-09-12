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
          // recupero i valori dei dati inseriti nel form
          $nome = $_POST['nome'];
          $cognome = $_POST['cognome'];
          $email = $_POST['email'];
          $password = $_POST['pass'];
          $sesso = $_POST['sesso'];


        }
?>
