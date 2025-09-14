import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Seta de voltar no topo
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            
            SizedBox(height: 20), // Espaço entre a seta e os botões
            
            // Botões "CAMPINAS" e "FLORIANÓPOLIS"
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      color: Colors.grey[200],
                      child: Text(
                        'CAMPINAS',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      color: Colors.white,
                      child: Text('FLORIANÓPOLIS'),
                    ),
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 50),
            Text(
              'EMBARQUE E DESEMBARQUE',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 20),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  QrImageView(
                    data: '65843220-01',
                    version: QrVersions.auto,
                    size: 250.0,
                  ),
                  Icon(
                    Icons.directions_bus,
                    size: 60,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'ID: 65843220-01',
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF456DFF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.home, color: Colors.white, size: 30),
                    Icon(Icons.work, color: Colors.white, size: 30),
                    Icon(Icons.settings, color: Colors.white, size: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}