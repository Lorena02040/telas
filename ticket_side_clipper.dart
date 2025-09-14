import 'package:flutter/material.dart';

class TicketSideClipper extends CustomClipper<Path> {
  final double radius; // raio do recorte
  final double borderRadius; // raio das bordas arredondadas

  TicketSideClipper({this.radius = 15.0, this.borderRadius = 20.0});

  @override
  Path getClip(Size size) {
    final path = Path();

    // começa no canto superior esquerdo com borda arredondada
    path.moveTo(0, borderRadius);
    path.quadraticBezierTo(0, 0, borderRadius, 0);

    // linha até o canto superior direito com borda arredondada
    path.lineTo(size.width - borderRadius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, borderRadius);

    // desce até antes do 1º recorte da direita
    double section = size.height / 4; // divide altura em 4 partes
    for (int i = 1; i <= 3; i++) {
      double y = section * i;

      // vai até antes do recorte
      path.lineTo(size.width, y - radius);

      // faz meia-lua para dentro
      path.arcToPoint(
        Offset(size.width, y + radius),
        radius: Radius.circular(radius),
        clockwise: false,
      );
    }

    // desce até o canto inferior direito com borda arredondada
    path.lineTo(size.width, size.height - borderRadius);
    path.quadraticBezierTo(
        size.width, size.height, size.width - borderRadius, size.height);

    // vai para o canto inferior esquerdo com borda arredondada
    path.lineTo(borderRadius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - borderRadius);

    // sobe e adiciona recortes na lateral esquerda
    for (int i = 3; i >= 1; i--) {
      double y = section * i;

      path.lineTo(0, y + radius);

      path.arcToPoint(
        Offset(0, y - radius),
        radius: Radius.circular(radius),
        clockwise: false,
      );
    }

    // fecha no canto superior esquerdo com borda arredondada
    path.lineTo(0, borderRadius);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
