import 'dart:convert';

import 'package:marvel_characters/models/comics/response_comics_model.dart';
import 'package:mobx/mobx.dart';

import 'package:marvel_characters/network/base_url.dart';
import 'package:http/http.dart' as http;

import '../entities/comics.dart';

part 'character_detail_store.g.dart';

class CharacterDetailStore = CharacterDetailStoreBase
    with _$CharacterDetailStore;

abstract class CharacterDetailStoreBase with Store {
  @observable
  ObservableList<Comics> allCharacterComics = ObservableList<Comics>();

  @observable
  bool loading = false;

  @observable
  bool hasError = false;

  @computed
  bool get hasData => !loading && !hasError && allCharacterComics.isNotEmpty;

  @action
  Future<void> getCharacterComics(characterId) async {
    final url = BaseUrl.getUrl("/v1/public/characters/$characterId/comics");

    _setLoading(true);
    _setError(false);

    try {
      final response = await http.get(
        Uri.parse(url),
      );

      Map<String, dynamic> data = jsonDecode(response.body);
      for (var comic in ResponseComicsModel.fromJson(data).data.results) {
        allCharacterComics.add(
          Comics(
            id: comic.id,
            title: comic.title,
            description: comic.description,
            thumbnail:
                '${comic.thumbnail['path']}.${comic.thumbnail['extension']}',
          ),
        );
      }
    } catch (e) {
      _setError(true);
    }
    _setLoading(false);
  }

  void _setLoading(bool value) {
    loading = value;
  }

  void _setError(bool value) {
    hasError = value;
  }
}
