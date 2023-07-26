// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterDetailStore on CharacterDetailStoreBase, Store {
  Computed<bool>? _$hasMoreDataComputed;

  @override
  bool get hasMoreData =>
      (_$hasMoreDataComputed ??= Computed<bool>(() => super.hasMoreData,
              name: 'CharacterDetailStoreBase.hasMoreData'))
          .value;
  Computed<bool>? _$hasDataComputed;

  @override
  bool get hasData => (_$hasDataComputed ??= Computed<bool>(() => super.hasData,
          name: 'CharacterDetailStoreBase.hasData'))
      .value;

  late final _$allCharacterComicsAtom = Atom(
      name: 'CharacterDetailStoreBase.allCharacterComics', context: context);

  @override
  ObservableList<Comic> get allCharacterComics {
    _$allCharacterComicsAtom.reportRead();
    return super.allCharacterComics;
  }

  @override
  set allCharacterComics(ObservableList<Comic> value) {
    _$allCharacterComicsAtom.reportWrite(value, super.allCharacterComics, () {
      super.allCharacterComics = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'CharacterDetailStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$loadingMoreAtom =
      Atom(name: 'CharacterDetailStoreBase.loadingMore', context: context);

  @override
  bool get loadingMore {
    _$loadingMoreAtom.reportRead();
    return super.loadingMore;
  }

  @override
  set loadingMore(bool value) {
    _$loadingMoreAtom.reportWrite(value, super.loadingMore, () {
      super.loadingMore = value;
    });
  }

  late final _$offsetAtom =
      Atom(name: 'CharacterDetailStoreBase.offset', context: context);

  @override
  int get offset {
    _$offsetAtom.reportRead();
    return super.offset;
  }

  @override
  set offset(int value) {
    _$offsetAtom.reportWrite(value, super.offset, () {
      super.offset = value;
    });
  }

  late final _$totalDataAtom =
      Atom(name: 'CharacterDetailStoreBase.totalData', context: context);

  @override
  int get totalData {
    _$totalDataAtom.reportRead();
    return super.totalData;
  }

  @override
  set totalData(int value) {
    _$totalDataAtom.reportWrite(value, super.totalData, () {
      super.totalData = value;
    });
  }

  late final _$hasErrorAtom =
      Atom(name: 'CharacterDetailStoreBase.hasError', context: context);

  @override
  bool get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  late final _$getCharacterComicsAsyncAction = AsyncAction(
      'CharacterDetailStoreBase.getCharacterComics',
      context: context);

  @override
  Future<void> getCharacterComics(dynamic characterId) {
    return _$getCharacterComicsAsyncAction
        .run(() => super.getCharacterComics(characterId));
  }

  late final _$showMoreCharacterComicsAsyncAction = AsyncAction(
      'CharacterDetailStoreBase.showMoreCharacterComics',
      context: context);

  @override
  Future<void> showMoreCharacterComics(dynamic characterId) {
    return _$showMoreCharacterComicsAsyncAction
        .run(() => super.showMoreCharacterComics(characterId));
  }

  @override
  String toString() {
    return '''
allCharacterComics: ${allCharacterComics},
loading: ${loading},
loadingMore: ${loadingMore},
offset: ${offset},
totalData: ${totalData},
hasError: ${hasError},
hasMoreData: ${hasMoreData},
hasData: ${hasData}
    ''';
  }
}
