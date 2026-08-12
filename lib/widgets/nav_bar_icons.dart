import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';




class NavBarIcons extends StatelessWidget {
  final String iconPath;
  const NavBarIcons({super.key, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$iconPath.svg',
      width: 24,
      height: 24,
      fit: BoxFit.scaleDown,
    );
  }
}