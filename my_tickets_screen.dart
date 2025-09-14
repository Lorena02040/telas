import 'package:flutter/material.dart';
import 'package:voyagebus/ticket_clipper.dart'; // Importa o arquivo do clipper
import 'package:voyagebus/ticket_side_clipper.dart'; //Importa o arquivo do clipper lateral

class MyTicketsScreen extends StatefulWidget {
  @override
  _MyTicketsScreenState createState() => _MyTicketsScreenState();
}

class _MyTicketsScreenState extends State<MyTicketsScreen> {
  bool _showMoreOptions = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  _showTicketDetailPopup(context);
                },
                child: ClipPath(
                  // recorte lateral menos profundo (ajustei aqui)
                  clipper: TicketSideClipper(radius: 15.0, borderRadius: 20.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9, // largura reduzida
                        height: 220, // altura aumentada
                        decoration: const BoxDecoration(
                          color: Color(0xFF5D70CA),
                        ),
                        padding: const EdgeInsets.fromLTRB(20, 25, 80, 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '65548351064986',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Origem: Americana-SP',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            const Text(
                              'Destino: Floripa-SC',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              'STATUS ATUAL:',
                              style: TextStyle(
                                color: Color.fromARGB(230, 51, 33, 100),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Row(
                              children: [
                                Text(
                                  '• ',
                                  style: TextStyle(
                                    color: Color.fromARGB(230, 51, 33, 100),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'EMBARCADA',
                                  style: TextStyle(
                                    color: Color.fromARGB(230, 51, 33, 100),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 35,
                        child: Container(
                          width: 45,
                          height: 220, // mesma altura do ticket
                          decoration: const BoxDecoration(
                            color: Color(0xFF7E8CE0),
                          ),
                          child: const Center(
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: Text(
                                'EM ANDAMENTO',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Text(
              'PROBLEMAS COM O EMBARQUE?',
              style: TextStyle(
                color: const Color(0xFF5D70CA),
                fontSize: 16,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: const Color(0xFF5D70CA),
                decorationThickness: 1,
                decorationStyle: TextDecorationStyle.solid,
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF253A9B),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                elevation: 6,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'MINHAS PASSAGENS',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/myLuggage');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF253A9B),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                elevation: 6,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'MINHAS BAGAGENS',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF253A9B),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                elevation: 6,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'DÚVIDAS SOBRE A PASSAGEM?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AnimatedOpacity(
            opacity: _showMoreOptions ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: Visibility(
              visible: _showMoreOptions,
              child: Column(
                children: [
                  // mini FAB 1: ícone custom (coloque seu PNG em assets/icons/)
                  FloatingActionButton(
                    backgroundColor: const Color(0xFF5D70CA),
                    onPressed: () {}, // não faz nada, como pediu
                    heroTag: 'btn1',
                    mini: true,
                    child: Image.asset(
                      'assets/refresh_icon.png',
                      width: 20,
                      height: 20,
                      // se sua PNG for só contorno, habilite color:
                      // color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // mini FAB 2: ícone custom (coloque seu PNG em assets/icons/)
                  FloatingActionButton(
                    backgroundColor: const Color(0xFF5D70CA),
                    onPressed: () {}, // não faz nada
                    heroTag: 'btn2',
                    mini: true,
                    child: Image.asset(
                      'assets/plus_icon.png',
                      width: 20,
                      height: 20,
                      // color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          FloatingActionButton(
            backgroundColor: const Color(0xFF5D70CA),
            shape: const CircleBorder(),
            onPressed: () =>
                setState(() => _showMoreOptions = !_showMoreOptions),
            heroTag: 'mainBtn',
            child: Icon(
              _showMoreOptions ? Icons.close : Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF5D70CA),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.work), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          ],
          currentIndex: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
        ),
      ),
    );
  }

  void _showTicketDetailPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(10),
          child: ClipPath(
            // popup com recorte menos profundo também
            clipper: TicketClipper(radius: 20.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF5D70CA),
              ),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 16),
                        _buildTicketRow("Passageiro:", "Gabriel Justo"),
                        _buildTicketRow("Código:", "65843220-01"),
                        const Divider(color: Colors.white70, thickness: 1),
                        _buildTicketRow("Origem:", "Campinas - SP"),
                        _buildTicketRow("Embarque:", "Rodoviária de Campinas"),
                        const SizedBox(height: 8),
                        _buildTicketRow("Destino:", "Florianópolis - SC"),
                        _buildTicketRow("Desembarque:", "Rodoviária Rita Maria"),
                        const Divider(color: Colors.white70, thickness: 1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("DATA", style: TextStyle(color: Colors.white70)),
                                Text("25/10/24",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("HORA", style: TextStyle(color: Colors.white70)),
                                Text("23:50",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("PLATAFORMA", style: TextStyle(color: Colors.white70)),
                                Text("Doca: 10",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("POLTRONA", style: TextStyle(color: Colors.white70)),
                                Text("N° 23",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                        const Divider(color: Color.fromARGB(179, 255, 255, 255), thickness: 1),
                        const SizedBox(height: 8),
                        const Text(
                          "Número do ônibus: 351\nSaída em: 30 min",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.pushNamed(context, '/qrCode');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF253A9B),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: const Text('QR CODE'),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    right: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF8FA0F3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "AGUARDANDO",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        const SizedBox(width: 48),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTicketRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14)),
          Text(value,
              style: const TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }
}
