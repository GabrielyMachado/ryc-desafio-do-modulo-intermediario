import 'dart:convert';

import 'package:marvel_characters/entities/character.dart';
import 'package:marvel_characters/models/response_character_model.dart';
import 'package:mobx/mobx.dart';

import 'package:marvel_characters/network/base_url.dart';
import 'package:http/http.dart' as http;

part 'characters_store.g.dart';

final url = BaseUrl.getUrl("/v1/public/characters");

class CharactersStore = CharactersStoreBase with _$CharactersStore;

abstract class CharactersStoreBase with Store {
  @observable
  ObservableList<Character> characters = ObservableList<Character>();

  @observable
  ObservableList<Character> foundCharacters = ObservableList<Character>();

  @observable
  bool loading = false;

  @observable
  bool hasError = false;

  @computed
  bool get hasData => !loading && !hasError && characters.isNotEmpty;

  @action
  Future<void> getCharacters() async {
    _setLoading(true);
    _setError(false);

    try {
      final response = await http.get(
        Uri.parse(url),
      );

      Map<String, dynamic> data = jsonDecode(response.body);
      for (var character
          in ResponseCharacterModel.fromJson(data).data.results) {
        characters.add(
          Character(
            id: character.id,
            name: character.name,
            description: character.description,
            thumbnail:
                '${character.thumbnail['path']}.${character.thumbnail['extension']}',
          ),
        );
      }
      foundCharacters = characters;
    } catch (e) {
      _setError(true);
    }
    _setLoading(false);
  }

  @action
  void runFilter(String enteredKeyword) {
    ObservableList<Character> results = ObservableList<Character>();
    if (enteredKeyword.isEmpty) {
      results = characters;
    } else {
      results = ObservableList<Character>.of(
        characters
            .where(
              (user) => user.name.toLowerCase().contains(
                    enteredKeyword.toLowerCase(),
                  ),
            )
            .toList(),
      );
    }
    foundCharacters = results;
  }

  void _setLoading(bool value) {
    loading = value;
  }

  void _setError(bool value) {
    hasError = value;
  }
}
