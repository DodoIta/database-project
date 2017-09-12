<?php
// classe di funzioni per gestire la connessione al
// database e le operazioni su di esso
class db_methods
{
  // attributi per gestire la connessione al database
  private $servername = "localhost";
  private $user = "root";
  private $password = "password";
  private $db_name = "progetto";
  // riferito allo stato della connessione
  private $attiva = false;

  // funzione per controllare la connessione
  public function connetti() {
    // controllo se la connessione è già attiva
    if($this->accesa) {
      return true;
    }
    else {
      // controllo che vada a buon fine la connessione
      if($conn = mysqli_connect($this->servername, $this->user, $this->password)) {
        // scelgo il database
        $database = mysqli_select_db($this->db_name)
        $attiva = true;
        echo "Connessione riuscita!";
      } else
        die(mysqli_connect_error());
      }
    } // fine connetti()

  // funzione per chiudere la connessione,
  // restituisce true se la disconnessione va a buon fine
  public function disconnetti() {
    if($this->attiva) {
      if(!mysqli_close) {
        echo "Disconnessione fallita!";
        return false;
      }
      else {
        $this->attiva = false;
        return true;
      }
    }
  } // fine disconnetti()

  // funzione per eseguire una query, che
  // viene passata come argomento, sul db
  public function query($query) {
    // controllo la connessione
    if(isset($this->attiva)) {
      $sql = mysqli_query($query);
      return $sql;
    } else
      return false;
  }

  // funzione per...
}
?>
