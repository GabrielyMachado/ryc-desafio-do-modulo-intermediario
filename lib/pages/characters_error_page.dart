import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../store/characters_store.dart';

class CharacterErrorPage extends StatefulWidget {
  const CharacterErrorPage({super.key});

  @override
  State<CharacterErrorPage> createState() => _CharacterErrorPageState();
}

class _CharacterErrorPageState extends State<CharacterErrorPage> {
  final _controller = CharactersStore();

  @override
  Widget build(BuildContext context) {
    // return Observer(builder: (_) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Oops!',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Ocorreu um erro ao carregar os personagens.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 35),
                ElevatedButton(
                  style: ButtonStyle(
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).colorScheme.primary)),
                  onPressed: () => _controller.getCharacters(),
                  child: const Text('Tentar novamente'),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/error_spiderman.png',
            height: 250,
          )
        ],
      ),
    );
    // });
  }
}
