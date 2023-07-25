import 'package:flutter/material.dart';

import '../store/characters_store.dart';

class CharacterError extends StatelessWidget {
  final CharactersStore _controller;

  const CharacterError(this._controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Oops!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Ocorreu um erro ao carregar os personagens.',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 35),
                  ElevatedButton(
                    style: ButtonStyle(
                        textStyle: MaterialStateProperty.all<TextStyle>(
                          const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).colorScheme.primary)),
                    onPressed: () {
                      _controller.getCharacters();
                    },
                    child: const Text('Tentar novamente'),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            'assets/images/error_spiderman.png',
            height: 250,
          )
        ],
      ),
    );
  }
}
