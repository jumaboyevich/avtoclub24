import 'package:avtoclub24/assets/colors/colors.dart';
import 'package:avtoclub24/features/authentification/domain/entities/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavItemWidget extends StatelessWidget {
  final int currentIndex;
  final NavBar navBar;

  const NavItemWidget({
    required this.navBar,
    required this.currentIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 8),
        SvgPicture.asset(
          navBar.icon,
          color: currentIndex == navBar.id ? orange : greyBlue,
          height: 24,
          width: 24,
        ),
        const SizedBox(height: 6),
        Text(
          navBar.title,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: currentIndex == navBar.id
              ? Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600)
              : Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 8)
      ],
    );
  }
}
