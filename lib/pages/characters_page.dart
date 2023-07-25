import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel_characters/store/characters_store.dart';
import 'package:marvel_characters/widgets/character_grid.dart';
import 'package:marvel_characters/widgets/custom_appbar.dart';

import 'characters_error_page.dart';

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
      appBar: const CustomAppBar(),
      body: Observer(
        builder: (_) {
          if (_controller.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (_controller.hasError) {
            return const CharacterErrorPage();
            // return Center(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       SizedBox(
            //         height: 250,
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.end,
            //           children: [
            //             const Text(
            //               'Oops!',
            //               style: TextStyle(
            //                 fontSize: 26,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //             const SizedBox(height: 5),
            //             const Text(
            //               'Ocorreu um erro ao carregar os personagens.',
            //               style: TextStyle(fontSize: 16),
            //             ),
            //             const SizedBox(height: 35),
            //             ElevatedButton(
            //               style: ButtonStyle(
            //                   textStyle: MaterialStateProperty.all<TextStyle>(
            //                     const TextStyle(
            //                         fontSize: 20, fontWeight: FontWeight.bold),
            //                   ),
            //                   foregroundColor: MaterialStateProperty.all<Color>(
            //                       Colors.white),
            //                   backgroundColor: MaterialStateProperty.all<Color>(
            //                       Theme.of(context).colorScheme.primary)),
            //               onPressed: () => _controller.getCharacters(),
            //               child: const Text('Tentar novamente'),
            //             ),
            //           ],
            //         ),
            //       ),
            //       Image.asset(
            //         'assets/images/error_spiderman.png',
            //         height: 250,
            //       )
            //     ],
            //   ),
            // );
          } else if (_controller.foundCharacters.isNotEmpty) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SearchBar(
                    surfaceTintColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    hintText: 'Pesquisar personagem',
                    onChanged: (value) => _controller.runFilter(value),
                  ),
                ),
                Expanded(
                  child: CharacterGrid(_controller.foundCharacters),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text('Nenhum personagem encontrado'),
            );
          }
        },
      ),
    );
  }
}
