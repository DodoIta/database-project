# Progetto Basi di Dati
## Consegna per a. a. 2016/2017
### Servizio web di rete sociale dedicato allo sviluppo di contatti professionali (es. Linkedin)

Lo scopo principale della piattaforma è consentire agli utenti registrati di mantenere una lista di persone conosciute e ritenute affidabili in ambito lavorativo. Le persone nella lista sono definite “connessioni”: esse sono in effetti le connessioni di un nodo (l’utente) all’interno della rete sociale. L’utente può incrementare il numero delle sue connessioni invitando chi di suo gradimento.

La rete di contatti a disposizione dell’utente è costituita da tutte le connessioni dell’utente, tutte le connessioni delle sue connessioni (“connessioni di secondo grado”) e da tutte le connessioni delle connessioni di secondo grado (“connessioni di terzo grado”).

Attraverso la piattaforma è possibile effettuare diverse attività:
- essere presentati a qualcuno che si desidera conoscere attraverso un contatto mutuo e affidabile.
- trovare offerte di lavoro, persone, opportunità di business con il supporto di qualcuno presente all’interno della propria lista di contatti o del proprio network.
- i datori di lavoro (utenti premium, a pagamento) possono pubblicare offerte e ricercare potenziali candidati.
- le persone in cerca di lavoro (utenti semplici, account free) possono consultare tali offerte nella sezione Offerte di lavoro.
- gli utenti possono presentare la loro professionalità evidenziando nel proprio profilo personale (curriculum) i propri skill professionali e le competenze lavorative, oltre alle classiche informazioni presenti in un curriculum (dati anagrafici, studi, posizioni lavorative ricoperte etc.)
- i gruppi sono formati da utenti che hanno qualcosa in comune, come un particolare percorso di carriera lavorativa, interessi di business simili, una specifica provenienza geografica o altro.
- le segnalazioni sono veri e propri attestati di stima di chi ha lavorato con te – collega, datore di lavoro o cliente – e che riconosce il tuo talento, la tua preparazione, la tua professionalità.
- anche l’area del profilo dedicata ai riconoscimenti e ai premi ottenuti è importante per valorizzare la propria immagine di professionista agli occhi degli altri iscritti sul social network e delle aziende o dei brand che vi hanno stabilito una presenza.

Analisi dei requisiti (1 punto): descrizione dei requisiti in linguaggio naturale, rilevamento e correzione delle ambiguità. Organizzare un glossario dei termini e dei concetti fondamentali (con descrizione, indicazione sinonimi/omonimi o altre anomalie, eventuali correzioni, collegamenti) ed una tabella con le operazioni (>= 12) che il database deve soddisfare, equamente suddivise in interrogazioni ed aggiornamenti; evitare operazioni ripetitive (esempio: inserimento cliente + inserimento fornitore + …) ed interrogazioni troppo banali (esempio: stampare elenco clienti), cercando di privilegiare query complesse (esempio:
trovare i rappresentanti che nel mese scorso hanno fatturato sopra la media). Verrà valutato anche il livello dell’italiano.

Progettazione concettuale (2 punti): scelta della strategia di progetto, sviluppo dello schema E/R, eventuale integrazione di viste parziali, presentazione dello schema E/R finale.

Seguire fedelmente l’analisi dei requisiti, mostrando passo dopo passo l’evoluzione dello schema E/R secondo la strategia adottata.

Esistono diversi tool per disegnare schemi E/R, ad esempio MySQL Workbench, DBDesigner, Dia, Java Diagrammi ER.

Progettazione logica (4 punti): ottimizzazione, semplificazione, traduzione, normalizzazione (1 punto per ogni fase).

Ottimizzazione (facoltativa): individuare almeno una scelta progettuale che necessita di analisi del carico di lavoro (esempi: attributo o associazione derivata, porzione di schema ristrutturabile tramite accorpamenti orizzontali/verticali, semplificazione di gerarchia); definire quindi tutte le informazioni (volume dei dati e specifica delle operazioni) che sono utili a calcolare i costi di accesso sulla base dei quali operare la scelta ottimale.

Semplificazione: ristrutturare gerarchie di generalizzazione, attributi composti e a valori multipli, identificatori esterni.

Traduzione: passare dallo schema E/R ristrutturato al modello relazionale, evidenziando chiavi primarie e importate.

Normalizzazione: verificare le forme normali 2NF, 3NF, BCNF.

Progettazione fisica (1 punto, facoltativa): scegliere una tabella oggetto di interrogazioni frequenti e, sulla base di stime personali del carico di lavoro, verificare se e quali tecniche di organizzazione dei dati (indici, hashing, ecc.) consentono di ottimizzare gli accessi.

Database MySQL (1 punto): lo schema di database relazionale finale deve essere implementato in un database MySQL. Inoltre, tutte le operazioni devono essere presentate in termini di istruzioni MySQL.

La definizione di costrutti complessi (transazioni, procedure e trigger) comporta un bonus di (fino a) 1 punto.

Applicazione client (1 punto, facoltativa): realizzare un modulo software in C (o in PHP) di interfaccia al database MySQL per la realizzazione di almeno tre operazioni (tutte nel caso di PHP).