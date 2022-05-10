import 'package:flutter/material.dart';
import 'package:my_transformation/src/widget/custom_rectangle_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, top: 10),
      child: Column(
        children: [
          CustomRectangleButton(
            onPressed: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.photo_camera,
                  color: primary,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Button',
                    style: theme.textTheme.headline5!
                        .copyWith(color: primary, fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: primary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
