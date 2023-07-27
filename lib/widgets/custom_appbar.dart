import 'package:flutter/material.dart';

import '../store/characters_store.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height = 60;
  final CharactersStore? controller;

  const CustomAppBar({super.key, this.controller});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          height: preferredSize.height,
          child: Image.asset('assets/images/logo.png'),
        ),
        centerTitle: true,
        actions: controller != null && controller!.hasData
            ? [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      controller!.toogleSearch();
                    },
                  ),
                )
              ]
            : [],
      ),
    );
  }
}
