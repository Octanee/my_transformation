import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_transformation/src/extension/extension.dart';
import 'package:my_transformation/src/widget/widget.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final colorSchema = Theme.of(context).colorScheme;
    final color = colorSchema.primary.lighten(.3);
    return SizedBox(
      height: height / 2,
      child: Stack(
        children: [
          Positioned(
            right: -height / 10,
            left: -height / 10,
            top: -height / 7,
            child: CircleBackground(
              baseColor: color.darken(.05),
              size: 50,
              colorStep: 0.07,
              numOfSteps: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: colorSchema.secondary.lighten(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      'asset/logo.svg',
                      height: height / 5,
                      color: colorSchema.primary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
