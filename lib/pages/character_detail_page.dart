import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel_characters/entities/character.dart';
import 'package:marvel_characters/store/character_detail_store.dart';
import 'package:marvel_characters/widgets/comics_card.dart';
import 'package:marvel_characters/widgets/custom_appbar.dart';
import 'package:marvel_characters/widgets/request_error.dart';

class CharacterDetailPage extends StatefulWidget {
  const CharacterDetailPage({super.key});

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  final _controller = CharacterDetailStore();

  @override
  Widget build(BuildContext context) {
    final Character character =
        ModalRoute.of(context)?.settings.arguments as Character;

    if (!_controller.hasData) {
      _controller.getCharacterComics(character.id);
    }

    return Scaffold(
      body: Observer(
        builder: (_) {
          if (_controller.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (_controller.hasError) {
            return Scaffold(
              appBar: const CustomAppBar(),
              body: RequestError(
                () => _controller.getCharacterComics(character.id),
                'detail',
              ),
            );
          } else {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.black,
                  expandedHeight: 299,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(character.name),
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Hero(
                          tag: character.id,
                          child: Image.network(
                            character.thumbnail,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0, 0.8),
                              end: Alignment(0, 0),
                              colors: [
                                Color.fromRGBO(0, 0, 0, 0.9),
                                Color.fromRGBO(0, 0, 0, 0.0),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate.fixed(
                    [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            character.description != ''
                                ? SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      character.description,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  )
                                : Container(),
                            const SizedBox(height: 10),
                            character.totalAvailableComics > 0
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Presente em ${character.totalAvailableComics} ${character.totalAvailableComics > 1 ? 'quadrinhos' : 'quadrinho'}',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: List.generate(
                                          _controller.allCharacterComics.length,
                                          (index) => ComicCard(
                                            _controller
                                                .allCharacterComics[index],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : const Center(
                                    child: Text('Nenhum quadrinho encontrado'),
                                  ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
