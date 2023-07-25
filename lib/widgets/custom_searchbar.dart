import 'package:flutter/material.dart';
import 'package:marvel_characters/store/characters_store.dart';

class CustomSearchbar extends StatelessWidget {
  final CharactersStore _controller;

  const CustomSearchbar(this._controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SearchBar(
        surfaceTintColor: MaterialStateProperty.all<Color>(Colors.white),
        hintText: 'Pesquisar personagem',
        onChanged: (value) => _controller.runFilter(value),
      ),
    );
  }
}
