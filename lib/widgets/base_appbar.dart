import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../utils/styles.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const BaseAppBar({super.key, required this.title});

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              'assets/svg/arrow_left.svg',
              height: 14,
              color: Styles.highlightColor,
              width: 14,
            ),
            const Gap(5),
            Text('Back', style: TextStyle(color: Styles.highlightColor)),
          ],
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            color: Styles.highlightColor,
            fontWeight: FontWeight.bold,
            fontSize: 18),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
