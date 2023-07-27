import 'dart:convert';

import 'package:marvel_characters/models/comics/response_comics_model.dart';
import 'package:mobx/mobx.dart';

import 'package:marvel_characters/network/base_url.dart';
import 'package:http/http.dart' as http;

import '../entities/comic.dart';
part 'character_detail_store.g.dart';

class CharacterDetailStore = CharacterDetailStoreBase
    with _$CharacterDetailStore;

abstract class CharacterDetailStoreBase with Store {
  @observable
  ObservableList<Comic> allCharacterComics = ObservableList<Comic>();

  @observable
  bool loading = false;

  @observable
  bool loadingMore = false;

  @observable
  int offset = 100;

  @observable
  int totalData = 0;

  @computed
  bool get hasMoreData => totalData > allCharacterComics.length;

  @observable
  bool hasError = false;

  @computed
  bool get hasData => !loading && !hasError && allCharacterComics.isNotEmpty;

  @action
  Future<void> getCharacterComics(characterId) async {
    final url = BaseUrl.getUrl("/v1/public/characters/$characterId/comic");

    _setLoading(true);
    _setError(false);

    try {
      final response = await http.get(
        Uri.parse(url),
      );

      Map<String, dynamic> data = jsonDecode(response.body);

      _setTotalData(ResponseComicsModel.fromJson(data).data.total);

      for (var comic in ResponseComicsModel.fromJson(data).data.results) {
        allCharacterComics.add(
          Comic(
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

  @action
  Future<void> showMoreCharacterComics(characterId) async {
    final url = BaseUrl.getUrl("/v1/public/characters/$characterId/comics");

    _setLoadingMore(true);
    _setError(false);

    try {
      final response = await http.get(
        Uri.parse('$url&offset=$offset'),
      );

      Map<String, dynamic> data = jsonDecode(response.body);
      for (var comic in ResponseComicsModel.fromJson(data).data.results) {
        allCharacterComics.add(
          Comic(
            id: comic.id,
            title: comic.title,
            description: comic.description,
            thumbnail:
                '${comic.thumbnail['path']}.${comic.thumbnail['extension']}',
          ),
        );
      }
      _incrementOffset();
    } catch (e) {
      _setError(true);
    }
    _setLoadingMore(false);
  }

  void _setLoading(bool value) {
    loading = value;
  }

  void _setError(bool value) {
    hasError = value;
  }

  void _setLoadingMore(bool value) {
    loadingMore = value;
  }

  void _setTotalData(int value) {
    totalData = value;
  }

  void _incrementOffset() {
    offset += 100;
  }
}
