import 'package:flutter/material.dart';

class TicketClipper extends CustomClipper<Path> {
  final double radius; // Raio dos recortes
  final double borderRadius; // Raio para as bordas arredondadas do retângulo

  TicketClipper({this.radius = 5.0, this.borderRadius = 15.0}); // Valores padrão ajustados

  @override
  Path getClip(Size size) {
    Path path = Path();

    // 1. Desenha o retângulo principal com bordas arredondadas
    // Usamos RRect para um retângulo com cantos arredondados
    RRect outerRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    );
    path.addRRect(outerRect);

    // 2. Cria os "buracos" (círculos) para os recortes superiores
    // O Path.combine permite que "subtraiamos" formas
    var horizontalCuts = (size.width / (radius * 2)).floor();
    for (int i = 0; i < horizontalCuts; i++) {
      Path circlePath = Path();
      circlePath.addOval(Rect.fromCircle(
          center: Offset(radius + (i * radius * 2), 0.0), // No topo
          radius: radius / 2));
      path = Path.combine(PathOperation.difference, path, circlePath);
    }

    // 3. Cria os "buracos" (círculos) para os recortes inferiores
    for (int i = 0; i < horizontalCuts; i++) {
      Path circlePath = Path();
      circlePath.addOval(Rect.fromCircle(
          center: Offset(radius + (i * radius * 2), size.height), // Na base
          radius: radius / 2));
      path = Path.combine(PathOperation.difference, path, circlePath);
    }

    return path;
  }

  @override
  bool shouldReclip(TicketClipper oldClipper) =>
      oldClipper.radius != radius || oldClipper.borderRadius != borderRadius;
}