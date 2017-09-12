<?php
// classe di funzioni per gestire la connessione al
// database e le operazioni su di esso
class db_methods
{
  // attributi per gestire la connessione al database
  private $servername = "localhost";
  private $user = "root";
  private $password = "";
  private $nome_db = "progetto";
  // riferito allo stato della connessione
  private $attiva = false;
  private $con;

  // funzione per controllare la connessione
  public function connetti() {
    // controllo se la connessione è già attiva
    if($this->attiva) {
      return true;
    }
    else {
      // controllo che vada a buon fine la connessione
      if($this->con = mysqli_connect($this->servername, $this->user, $this->password, $this->nome_db)) {
        $attiva = true;
        echo "Connessione al database riuscita!<br/>";
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
      $sql = mysqli_query($this->con, $query);
      return $sql;
    } else
      return false;
  }

  // funzione per estrarre dati da un insieme
  // di oggetti ottenuti da una query
  public function estrai($query) {
    if(true) {
      $result = mysqli_fetch_object($query);
      return $result;
    } else
      return false;
  }
}
?>
