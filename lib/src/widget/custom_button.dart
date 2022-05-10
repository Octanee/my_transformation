import 'package:flutter/material.dart';
import 'package:my_transformation/src/extension/extension.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final Function()? onPressed;
  final Widget child;
  final double radius;
  final EdgeInsets? padding;
  final bool isActive;

  const CustomButton({
    required this.onPressed,
    required this.child,
    this.radius = 30,
    this.color = Colors.grey,
    this.isActive = true,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentColor = isActive ? color : Colors.grey;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: padding,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                currentColor.lighten(0.2),
                currentColor,
              ],
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
            boxShadow: [
              BoxShadow(
                color: currentColor,
                spreadRadius: 1,
                blurRadius: 5,
              )
            ],
          ),
          child: Center(
            child: InkWell(
              onTap: isActive ? onPressed : null,
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
