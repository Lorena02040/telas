import 'package:flutter/material.dart';
import 'package:voyagebus/screens/luggage_view_screen.dart'; // Importa o pop-up

class MyLuggageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF7986CB)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Minhas Bagagens',
              style: TextStyle(
                color: Color(0xFF253A9B),
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  LuggageCard(),
                  // Adicione mais LuggageCard para mais bagagens
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LuggageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: const Color(0xFF7986CB), // Cor do ticket corrigida para 0xFF7986CB
      child: Container( // Removido o InkWell do Card inteiro
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DESTINO: FLORIPA - SC',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '• STATUS: EMBARCADA',
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              '• DATA: 27/12/2024',
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              '• Bagagem: Azul, 23kg, Le Bosdisci',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            
            // Adicionado InkWell APENAS ao texto "EXIBIR DETALHADAMENTE"
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return LuggageViewScreen();
                  },
                );
              },
              child: const Text(
                'EXIBIR DETALHADAMENTE',
                style: TextStyle(
                  color: Color(0xFF253A9B),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}