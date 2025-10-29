# Mastermind-Halloween
## Descrizione:
Il progetto realizza un'applicazione in linguaggio Dart, che simula il gioco mastermind.
Ci sono 6 immagini totali che ogni volta cliccate cambiano immagine in maniera ciclica.
Avviato il gioco viene creato un codice segreto in maniera casuale formato da 4 valori su un totale di 6.
Presenta due tasti:
### Coltello: 
Un pulsante rossa a forma di cerchio che invia la sequenza di valori scelta e verifica se la combinazione di immagini corrisponde al codice segreto

### Reset: 
Un pulsante nero rettangolare che se premuto resetta i tentativi e la combinazione scelta facendo ricominciare il gioco e creando un nuovo codice segreto.

Non c’è un numero massimo di tentativi ma ogni tentativo viene salvato, se si indovina la combinazione del codice segreto viene riportata la scritta in verde “Hai indovinato” altrimenti viene scritto in arancione “Riprova”.
Il programma è diviso in 3 funzioni principali:
### Main: 
E' il punto di partenza dell'applicazione dove si avvia il programma
### MastermindPage:
Interfaccia principale del gioco ossia:
Il codice segreto
I tentativi
La cronologia
I relativi messaggi
### MastermindPageState:
Gestisce la logica del gioco e la costruzione dei widget

# Autore:
Antonio Friselle.

