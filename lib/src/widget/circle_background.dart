import 'package:flutter/material.dart';
import 'package:my_transformation/src/extension/extension.dart';

class CircleBackground extends StatelessWidget {
  final double numOfSteps;
  final double size;
  final double colorStep;
  final Color baseColor;
  final Widget? child;
  final double blur;

  const CircleBackground({
    required this.baseColor,
    this.colorStep = 0.02,
    this.numOfSteps = 4,
    this.size = 35,
    this.blur = 15,
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getChild(step: 2);
  }

  Widget getChild({required int step}) {
    final color = baseColor.darken(colorStep * step);
    final lightenColor = color.lighten(0.25);
    return Container(
      padding: step != 1 ? EdgeInsets.all(size) : null,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            lightenColor,
            color,
          ],
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(-5, 1),
            color: lightenColor.lighten(0.05),
            blurRadius: blur,
          ),
          BoxShadow(
            offset: const Offset(5, 1),
            color: color,
            blurRadius: blur,
          ),
        ],
        shape: BoxShape.circle,
      ),
      child: step < numOfSteps ? getChild(step: step + 1) : child,
    );
  }
}
