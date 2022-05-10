import 'package:flutter/material.dart';
import 'package:my_transformation/src/extension/extension.dart';
import 'package:my_transformation/src/widget/rectangle_background.dart';

class CustomRectangleButton extends StatelessWidget {
  final Color color;
  final Function()? onPressed;
  final Widget child;
  final double radius;
  final EdgeInsets padding;
  final bool isActive;

  const CustomRectangleButton({
    required this.onPressed,
    required this.child,
    this.radius = 30,
    this.color = Colors.grey,
    this.isActive = true,
    this.padding = const EdgeInsets.only(bottom: 16.0),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: RectangleBackground(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          gradient: LinearGradient(
            colors: [
              color.lighten(0.2),
              color,
            ],
          ),
          shadowColor: color.lighten(),
          radius: radius,
          child: child,
        ),
      ),
    );
  }
}
