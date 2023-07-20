import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel_characters/store/characters_store.dart';
import 'package:marvel_characters/widgets/character_grid.dart';
import 'package:marvel_characters/widgets/custom_appbar.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final _controller = CharactersStore();

  @override
  Widget build(BuildContext context) {
    if (!_controller.hasData) {
      _controller.getCharacters();
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
            child: SearchBar(
              surfaceTintColor: MaterialStateProperty.all<Color>(Colors.white),
              hintText: 'Pesquisar personagem',
              onChanged: (value) => _controller.runFilter(value),
            ),
          ),
          Observer(
            builder: (_) {
              if (_controller.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (_controller.hasError) {
                return const Center(child: Text('Error'));
              } else if (_controller.foundCharacters.isNotEmpty) {
                return SizedBox(
                  height: (MediaQuery.of(context).size.height - 215),
                  child: CharacterGrid(_controller.foundCharacters),
                );
              } else {
                return const Center(
                    child: Text('Nenhum personagem encontrado'));
              }
            },
          ),
        ],
      ),
    );
  }
}
