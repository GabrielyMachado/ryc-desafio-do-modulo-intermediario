import 'package:flutter/material.dart';
import 'package:marvel_characters/entities/comic.dart';

class ComicCard extends StatelessWidget {
  final Comic comic;

  const ComicCard(this.comic, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white10,
        ),
        width: double.infinity,
        height: 150,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 100,
                height: 140,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FadeInImage(
                    placeholder:
                        const AssetImage('assets/images/placeholder.jpg'),
                    image: NetworkImage(comic.thumbnail),
                    fit: BoxFit.cover,
                    imageErrorBuilder: (context, error, stackTrace) =>
                        Image.asset('assets/images/noimage.jpeg'),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                comic.title,
                //style: TextStyle(colo),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
