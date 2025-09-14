import 'package:flutter/material.dart';

class TicketDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.close, color: Colors.black), onPressed: () => Navigator.pop(context)),
        title: Text('AGUARDANDO', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 360,
              padding: const EdgeInsets.all(20.0),
              decoration: ShapeDecoration(
                color: const Color(0xFF5D70CA),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: const Color(0x66001EB1),
                  ),
                  borderRadius: BorderRadius.circular(28),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Passageiro:', style: TextStyle(color: const Color(0xFFCDD5FF), fontSize: 25, fontWeight: FontWeight.w700)),
                  Text('Gabriel Justo', style: TextStyle(color: const Color(0xFFBFCAFF), fontSize: 25, fontWeight: FontWeight.w700)),
                  SizedBox(height: 10),
                  Text('Código:', style: TextStyle(color: const Color(0xFFCDD5FF), fontSize: 25, fontWeight: FontWeight.w700)),
                  Text('65843220-01', style: TextStyle(color: const Color(0xFFBFCAFF), fontSize: 25, fontWeight: FontWeight.w700)),
                  SizedBox(height: 20),
                  Divider(color: const Color(0xFF9AABFA), thickness: 4),
                  SizedBox(height: 10),
                  Text('Origem:', style: TextStyle(color: const Color(0xFFCDD5FF), fontSize: 25, fontWeight: FontWeight.w700)),
                  Text('Campinas - SP', style: TextStyle(color: const Color(0xFFCDD5FF), fontSize: 20, fontWeight: FontWeight.w700)),
                  Text('Rodoviária de Campinas', style: TextStyle(color: const Color(0xFFCDD5FF), fontSize: 16, fontWeight: FontWeight.w700)),
                  SizedBox(height: 10),
                  Text('Destino:', style: TextStyle(color: const Color(0xFFCDD5FF), fontSize: 25, fontWeight: FontWeight.w700)),
                  Text('Florianópolis - SC', style: TextStyle(color: const Color(0xFFCDD5FF), fontSize: 20, fontWeight: FontWeight.w700)),
                  SizedBox(height: 20),
                  Divider(color: const Color(0xFF9AABFA), thickness: 4),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('DATA', style: TextStyle(color: const Color(0xFFCDD5FF), fontSize: 20, fontWeight: FontWeight.w700)),
                        Text('25/10/24', style: TextStyle(color: const Color(0xFFCDD5FF), fontSize: 20, fontWeight: FontWeight.w700)),
                      ]),
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('HORA', style: TextStyle(color: const Color(0xFFCDD5FF), fontSize: 20, fontWeight: FontWeight.w700)),
                        Text('23:50', style: TextStyle(color: const Color(0xFFCDD5FF), fontSize: 20, fontWeight: FontWeight.w700)),
                      ]),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('PLATAFORMA', style: TextStyle(color: const Color(0xFFCDD5FF), fontSize: 20, fontWeight: FontWeight.w700)),
                        Text('DOCA: 10', style: TextStyle(color: const Color(0xFFCDD5FF), fontSize: 20, fontWeight: FontWeight.w700)),
                      ]),
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text('POLTRONA', style: TextStyle(color: const Color(0xFFCDD5FF), fontSize: 20, fontWeight: FontWeight.w700)),
                        Text('N° 23', style: TextStyle(color: const Color(0xFFCDD5FF), fontSize: 20, fontWeight: FontWeight.w700)),
                      ]),
                    ],
                  ),
                  SizedBox(height: 20),
                  Divider(color: const Color(0xFF9AABFA), thickness: 4),
                  SizedBox(height: 10),
                  Text('Número do ônibus: 351', style: TextStyle(color: const Color(0xFFCDD5FF), fontSize: 20, fontWeight: FontWeight.w700)),
                  Text('Saída em: 30 min', style: TextStyle(color: const Color(0xFFCDD5FF), fontSize: 20, fontWeight: FontWeight.w700)),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/qrCode');
                    },
                    child: Text('QR CODE'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50),
                      backgroundColor: const Color(0xFF253A9B),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Bagagem'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Configurações'),
        ],
        currentIndex: 0,
        selectedItemColor: const Color(0xFF5D70CA),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
      ),
    );
  }
}