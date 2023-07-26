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
  bool loadingMore = false;

  @observable
  bool hasError = false;

  @observable
  int offset = 100;

  @observable
  int totalData = 0;

  @computed
  bool get hasMoreData => totalData > allCharacters.length;

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

      _setTotalData(ResponseCharacterModel.fromJson(data).data.total);

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

  @action
  Future<void> showMoreCharacter() async {
    _setLoadingMore(true);
    _setError(false);

    try {
      final response = await http.get(
        Uri.parse('$url&offset=$offset'),
      );

      Map<String, dynamic> data = jsonDecode(response.body);

      final results = ResponseCharacterModel.fromJson(data).data.results;

      if (results.isNotEmpty) {
        for (var character in results) {
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
        _incrementOffset();
      }
    } catch (e) {
      _setError(true);
    }
    _setLoadingMore(false);
  }

  void _setLoading(bool value) {
    loading = value;
  }

  void _setLoadingMore(bool value) {
    loadingMore = value;
  }

  void _setError(bool value) {
    hasError = value;
  }

  void _setTotalData(int value) {
    totalData = value;
  }

  void _incrementOffset() {
    offset += 100;
  }
}
