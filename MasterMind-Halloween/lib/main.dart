import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MastermindHalloween());
}

class MastermindHalloween extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mastermind Halloween',
      home: MastermindPage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.orange[100],
      ),
    );
  }
}

class MastermindPage extends StatefulWidget {
  @override
  _MastermindPageState createState() => _MastermindPageState();
}

class _MastermindPageState extends State<MastermindPage> {
  // Lista immagini disponibili
  List<String> immagini = [
    'assets/images/it.png',
    'assets/images/micheal.png',
    'assets/images/ghost.png',
    'assets/images/zucca.png',
    'assets/images/jason.png',
    'assets/images/nightmare.png'
  ];

  List<int> indiceImmagini = [-1, -1, -1, -1]; // selezione utente
  late List<int> codiceSegreto;                 // codice segreto di 4 elementi
  String message = '';
  int tentativi = 0;
  List<List<int>> cronologiaTentativi = [];
  List<List<String>> cronologiaFeedback = [];

  @override
  void initState() {
    super.initState();
    creaCodiceSegreto();
  }

  // Genera il codice segreto
  void creaCodiceSegreto() {
    Random random = Random();
    codiceSegreto = List.generate(4, (_) => random.nextInt(immagini.length));
    print("Codice segreto: $codiceSegreto"); //debug
  }

  // Genera feedback per le palline (rosse e bianche)
  List<String> generaFeedbackPalline(List<int> tentativo) {
    int rosse = 0;
    int bianche = 0;

    List<int> codiceRimanente = [];
    List<int> tentativoRimanente = [];

    for (int i = 0; i < 4; i++) {
      if (tentativo[i] == codiceSegreto[i]) {
        rosse++;
      } else {
        codiceRimanente.add(codiceSegreto[i]);
        tentativoRimanente.add(tentativo[i]);
      }
    }

    for (int val in tentativoRimanente) {
      if (codiceRimanente.contains(val)) {
        bianche++;
        codiceRimanente.remove(val);
      }
    }

    List<String> palline = [];
    palline.addAll(List.filled(rosse, 'R'));
    palline.addAll(List.filled(bianche, 'B'));
    while (palline.length < 4) palline.add(' ');
    return palline;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Mastermind Halloween'),
        backgroundColor: Colors.deepOrange[900],
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Sezione scelta immagini
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (i) {
                String imagePath = indiceImmagini[i] == -1 ? '' : immagini[indiceImmagini[i]];
                return Padding(
                  padding: EdgeInsets.all(8), //spazio
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero, //immagine riempe tutto lo spazio
                      fixedSize: Size(100, 100),
                      shape: CircleBorder(), //bottone circolre
                      backgroundColor:
                          indiceImmagini[i] == -1 ? Colors.grey : Colors.black,
                    ),


                    onPressed: () {
                      setState(() {
                        indiceImmagini[i] =
                            (indiceImmagini[i] + 1) % immagini.length; //% ritorna all'immagine precedente
                      });
                    },
                    child: indiceImmagini[i] == -1
                        ? null
                        : ClipOval( //ritaglia l'immagine in un cerchio
                            child: Image.asset(
                              imagePath,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                );
              }),
            ),
            SizedBox(height: 20), //serve a distanziare

            // Pulsanti Controlla e Reset
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(90, 90),
                    shape: CircleBorder(),
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.red[900],
                    shadowColor: Colors.black,
                    elevation: 10,
                  ),
                  onPressed: () {
                    setState(() {
                      tentativi++;
                      cronologiaTentativi.insert(0, List.from(indiceImmagini));
                      cronologiaFeedback
                          .insert(0, generaFeedbackPalline(indiceImmagini));

                      if (indiceImmagini.join() == codiceSegreto.join()) {
                        message = "Hai indovinato!";
                      } else {
                        message = "Riprova...";
                      }

                      indiceImmagini = [-1, -1, -1, -1];
                    });
                  },
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/coltello.png',
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      tentativi = 0;
                      cronologiaTentativi.clear();
                      cronologiaFeedback.clear();
                      indiceImmagini = [-1, -1, -1, -1];
                      message = '';
                      creaCodiceSegreto();
                    });
                  },
                  child: Text('Reset', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Tentativi
            Text(
              "Tentativi: $tentativi",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.red[900],
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.6),
                    offset: Offset(2, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),

            // Messaggio
            Text(
              message,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: message == "Hai indovinato!"
                    ? Colors.greenAccent
                    : Colors.orange[900],
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.8),
                    offset: Offset(2, 2),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),

            Expanded(
              child: Stack(
                children: [
                  // Sfondo fisso
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/sfondo.jpg',
                      fit: BoxFit.cover, // copre tutto lo spazio disponibile
                    ),
                  ),

                  // Contenuto sopra lo sfondo
                  ListView.builder(
                    itemCount: cronologiaTentativi.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Combinazione immagini
                            for (int img in cronologiaTentativi[index])
                              Padding(
                                padding: EdgeInsets.all(4),
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: img == -1 ? Colors.grey : Colors.black,
                                    image: img != -1
                                        ? DecorationImage(
                                            image: AssetImage(immagini[img]),
                                            fit: BoxFit.cover,
                                          )
                                        : null,
                                  ),
                                ),
                              ),

                            SizedBox(width: 16),

                            // Feedback palline
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (String p in cronologiaFeedback[index])
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 2),
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: p == 'R'
                                            ? Colors.red
                                            : p == 'B'
                                                ? Colors.white
                                                : Colors.transparent,
                                        border: p == 'B'
                                            ? Border.all(color: Colors.black)
                                            : null,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}