import 'package:flutter/material.dart';

class BottomNavClipper extends CustomPainter {
  final Color color;

  BottomNavClipper({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0); // Início no canto superior esquerdo
    path.lineTo(0, size.height); // Lateral esquerda

    path.lineTo(size.width * 0.35, size.height); // Começo da curva

    // Curva do “meio círculo” central
    path.quadraticBezierTo(
      size.width * 0.5, // Ponto central x
      size.height - 50, // Altura do recorte (quanto menor, mais profundo)
      size.width * 0.65, // Fim da curva x
      size.height, // Fim da curva y
    );

    path.lineTo(size.width, size.height); // Lateral direita
    path.lineTo(size.width, 0); // Canto superior direito
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
