import 'dart:convert';

import 'package:marvel_characters/entities/character.dart';
import 'package:marvel_characters/models/characters/response_character_model.dart';
import 'package:mobx/mobx.dart';

import 'package:marvel_characters/network/base_url.dart';
import 'package:http/http.dart' as http;

part 'characters_store.g.dart';

final url = BaseUrl.getUrl("/v1/public/characters");

class CharactersStore = CharactersStoreBase with _$CharactersStore;

abstract class CharactersStoreBase with Store {
  @observable
  ObservableList<Character> allCharacters = ObservableList<Character>();

  @observable
  ObservableList<Character> foundCharacters = ObservableList<Character>();

  @observable
  bool loading = false;

  @observable
  bool hasError = false;

  @computed
  bool get hasData => !loading && !hasError && allCharacters.isNotEmpty;

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
        allCharacters.add(
          Character(
            id: character.id,
            totalAvailableComics: character.comics['available'],
            name: character.name,
            description: character.description,
            thumbnail:
                '${character.thumbnail['path']}.${character.thumbnail['extension']}',
          ),
        );
      }
      foundCharacters = allCharacters;
    } catch (e) {
      _setError(true);
    }
    _setLoading(false);
  }

  @action
  void runFilter(String enteredKeyword) {
    ObservableList<Character> results = ObservableList<Character>();
    if (enteredKeyword.isEmpty) {
      results = allCharacters;
    } else {
      results = ObservableList<Character>.of(
        allCharacters
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
