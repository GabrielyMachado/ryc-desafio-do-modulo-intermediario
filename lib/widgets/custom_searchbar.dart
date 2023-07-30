import 'package:flutter/material.dart';
import 'package:marvel_characters/store/characters_store.dart';

class CustomSearchbar extends StatefulWidget {
  final CharactersStore _controller;

  const CustomSearchbar(this._controller, {super.key});

  @override
  State<CustomSearchbar> createState() => _CustomSearchbarState();
}

class _CustomSearchbarState extends State<CustomSearchbar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _searchController.text = widget._controller.searchEnteredKeyword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SearchBar(
        constraints: const BoxConstraints(maxHeight: 45),
        controller: _searchController,
        surfaceTintColor: MaterialStateProperty.all<Color>(Colors.white),
        trailing: [
          IconButton(
              onPressed: () {
                _searchController.clear();
                widget._controller.runFilter(_searchController.text);
              },
              icon: const Icon(Icons.close))
        ],
        hintText: 'Pesquisar personagem',
        onChanged: (value) => widget._controller.runFilter(value),
      ),
    );
  }
}
