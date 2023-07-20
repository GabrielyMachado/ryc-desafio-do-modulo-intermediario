import 'package:flutter/material.dart';
import 'package:marvel_characters/entities/character.dart';
import 'package:marvel_characters/widgets/custom_appbar.dart';

class CharacterDetailPage extends StatefulWidget {
  const CharacterDetailPage({super.key});

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  @override
  Widget build(BuildContext context) {
    final Character character =
        ModalRoute.of(context)?.settings.arguments as Character;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
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
                            Color.fromRGBO(0, 0, 0, 0.6),
                            Color.fromRGBO(0, 0, 0, 0),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: Text(
                    character.description,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
