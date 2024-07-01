import 'package:flutter/material.dart';

class Background extends StatelessWidget {

  final Color primaryColor;
  final Color backgroundColor;

  const Background({ 
    Key? key,
    required this.primaryColor,
    required this.backgroundColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: backgroundColor,
      child: CustomPaint(
        painter: _HeaderPainter(primaryColor),
        child: CustomPaint(
          painter: _FooterPainter(primaryColor),
        ),
      ),
    );
  }
}


class _HeaderPainter extends CustomPainter {

  Color color;

  _HeaderPainter(
    this.color
  );

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();

    paint.color = color;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = Path();

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.1);
    path.cubicTo(size.width * 0.7, size.height * 0.14, size.width * 0.7, size.height * 0.3, size.width * 0.5, size.height * 0.3);
    path.cubicTo(size.width * 0.3, size.height * 0.3, size.width * 0.3, size.height * 0.14, size.width * 0, size.height * 0.1);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_HeaderPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_HeaderPainter oldDelegate) => false;
}

class _FooterPainter extends CustomPainter {

  Color color;

  _FooterPainter(
    this.color
  );

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();

    paint.color = color;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = Path();
    path.moveTo(size.height, size.width);
    path.lineTo(size.width, size.height * 0.9);
    path.cubicTo(size.width * 0.7, size.height * 0.86, size.width * 0.7, size.height * 0.7, size.width * 0.5, size.height * 0.7);
    path.cubicTo(size.width * 0.3, size.height * 0.7, size.width * 0.3, size.height * 0.86, 0, size.height * 0.9);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_FooterPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_FooterPainter oldDelegate) => false;
}