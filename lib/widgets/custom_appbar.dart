import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height = 60;

  const CustomAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: preferredSize.height,
        alignment: Alignment.center,
        color: Colors.black,
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
