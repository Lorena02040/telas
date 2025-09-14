import 'package:flutter/material.dart';

class LuggageViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF7986CB),
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: const Color(0xFF253A9B),
            width: 2.0,
          ),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildLuggageDetailRow('CÓDIGO BAGAGEM:', '846245-02'),
                  _buildLuggageDetailRow('NOME:', 'Gabriel Justo'),
                  _buildLuggageDetailRow('CPF:', '000.000.000-00'),
                  const Divider(color: Colors.white70, thickness: 1),
                  _buildLuggageDetailRow('ORIGEM:', 'Campinas - SP'),
                  _buildLuggageDetailRow('DESTINO:', 'Florianópolis - SC'),
                  const Divider(color: Colors.white70, thickness: 1),
                  _buildLuggageDetailRow('PESO:', '23KG'),
                  _buildLuggageDetailRow('COR DA BAGAGEM:', 'Azul'),
                  _buildLuggageDetailRow('MARCA DA BAGAGEM:', 'Le Bosdisci'),
                  const Divider(color: Colors.white70, thickness: 1),
                  const SizedBox(height: 20),
                  
                  // SEÇÃO DE DESCRIÇÃO CORRIGIDA
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF5D70CA), // Cor de fundo mais escura
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    width: double.infinity, // Ocupa a largura total
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'DESCRIÇÃO:',
                          style: TextStyle(
                            color: Color(0xFFC5C9E1), // Cor do texto "DESCRIÇÃO"
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Mala tamanho 60x45 com adesivo de metal lorde na frente',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  Center(
                    child: ElevatedButton(
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
                      child: const Text('QR CODE', style: TextStyle(fontSize: 16)),
                    ),
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
                    icon: const Icon(Icons.close, color: Colors.white, size: 28),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF8FA0F3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "EMBARCADA",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLuggageDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14)),
          Text(value,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}