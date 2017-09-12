  <?php
    // comincio una sessione
    session_start();
    // controllo la correttezza dei dati inseriti
    if(!isset($_POST['email']) || $_POST['email']=="")
      echo "Nessun valore. Si prega di inserire un indirizzo e-mail.";
      else
        if(!isset($_POST['password']) || $_POST['password']=="")
          echo "Inserire la propria password";
          // se va tutto a buon fine sono qui
          else{
            include "metodi.php";
            $email = $_POST['email'];
            $password = $_POST['password'];
            // creo un'istanza della classe db_methods
            $database = new db_methods();
            // eseguo la connessione
            $database->connetti();
            // interrogo il database, salvo la query sulla variabile $temp
            $temp = $database->query("SELECT id_utente FROM utente WHERE email ='$email' AND pass = '$password'");
            // controllo se la query ha trovato almeno una riga
            if(mysqli_num_rows($temp)==0)
            {
              // torna alla home page se l'utente non esiste
              echo "Credenziali errate!";
            } else {
              $esito = $database->estrai($temp);
              // aggiungo l'utente nella sessione corrente
              $_SESSION['login'] = $esito->id_utente;
              $database->disconnetti();
              echo "Login effettuato correttamente!";
            }
          }
?>
