import 'package:flutter/material.dart';
import 'package:my_transformation/src/extension/extension.dart';

class RectangleBackground extends StatelessWidget {
  final Color color;
  final EdgeInsets padding;
  final double radius;
  final Widget child;
  final Color? shadowColor;
  final Gradient? gradient;

  const RectangleBackground({
    required this.child,
    this.color = Colors.white,
    this.radius = 10.0,
    this.padding = const EdgeInsets.all(10.0),
    this.shadowColor,
    this.gradient,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(radius),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 1),
            color: shadowColor ?? color.darken(.12),
            blurRadius: 10,
            spreadRadius: 5,
          )
        ],
      ),
      padding: padding,
      child: child,
    );
  }
}
