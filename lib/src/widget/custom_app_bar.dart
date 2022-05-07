import 'package:flutter/material.dart';
import 'package:my_transformation/src/extension/extension.dart';
import 'package:my_transformation/src/widget/widget.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final double height;
  final double radius;
  final Widget? child;
  final IconButton? actionButton;
  final List<Widget>? actions;

  const CustomAppBar({
    this.height = 100,
    this.radius = 50,
    this.child,
    this.actionButton,
    this.actions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);
    final color = theme.colorScheme.primary.lighten(.3);

    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(radius),
      ),
      child: Container(
        color: color,
        child: Stack(
          children: [
            Positioned(
              top: -height / 3.5,
              left: -height / 3.5,
              child: CircleBackground(
                baseColor: color,
                colorStep: 0.07,
                size: 70,
                blur: 30,
                numOfSteps: 5,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  bottom: 8.0,
                ),
                child: child,
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: actions,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
