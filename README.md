# Mastermind-Halloween
## Descrizione:
Il progetto realizza un’applicazione Flutter in linguaggio Dart, che simula una versione semplificata del gioco Mastermind, rivisitata in chiave Halloween.
L’obiettivo è indovinare una sequenza segreta di 4 immagini tra le 6 disponibili, generate casualmente all’inizio della partita.

Ogni pulsante mostra un’immagine e, quando viene cliccato, cambia ciclicamente immagine.
Il giocatore deve scegliere la combinazione corretta e poi verificarla.
Inviata la combinazione affianco a essa appaiono delle cerchi colorati:
Il rosso indica che l'immagine è nella posizione esatta.
Il bianco che l'immagine è presente nella sequenza ma si trova nella posizione sbagliata.

Le combinazioni possono essere anche ripetute permettendo al gioco di essere maggiormente difficile.
## Funzionalità principali del gioco
### Generazione codice segreto: 
Un codice casuale composto da 4 immagini su 6 possibili.

### 4 Pulsanti circolari:
Per scegliere la combinazione (inizialmente grigi).

### Pulsante coltello: 
Un pulsante che invia la sequenza di valori scelta e verifica se la combinazione di immagini corrisponde al codice segreto

### Pulsante Reset: 
Un pulsante che se premuto resetta i tentativi e la combinazione scelta facendo ricominciare il gioco e creando un nuovo codice segreto.

### Sfondo Personalizzato

Non c’è un numero massimo di tentativi ma ogni tentativo viene salvato, se si indovina la combinazione del codice segreto viene riportata la scritta in verde “Hai indovinato” altrimenti viene scritto in arancione “Riprova”.

## Struttura del Programa
Il programma è diviso in 3 funzioni principali:
### Main: 
Punto di ingresso dell’applicazione.
Avvia l’app e imposta il tema grafico (colori arancio/nero).
### MastermindPage:
Interfaccia principale del gioco ossia:
Gestisce l’interfaccia principale del gioco:
mostra i 4 pulsanti delle immagini,
i tasti “Coltello” e “Reset”,
il numero di tentativi,
il messaggio di stato,
e la cronologia delle combinazioni giocate.
### MastermindPageState:
Contiene la logica del gioco, ossia:
la creazione casuale del codice segreto,
la gestione dei tentativi,
il calcolo del feedback,
e il reset del gioco.

## Scelte di Sviluppo
Utilizzo di StatefulWidget per gestire lo stato dinamico del gioco (tentativi, codice segreto, messaggi).

Struttura a liste per gestire combinazioni, feedback e cronologia.

Uso di Random() per la generazione del codice segreto.

Adozione di immagini invece di semplici colori per dare un tocco creativo e visivo.

Utilizzo di Stack e ListView.builder per gestire lo sfondo fisso e la cronologia dinamica.

# Autore:
Antonio Friselle.

