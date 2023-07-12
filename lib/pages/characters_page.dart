import 'package:flutter/material.dart';
import 'package:marvel_characters/widgets/custom_appbar.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
