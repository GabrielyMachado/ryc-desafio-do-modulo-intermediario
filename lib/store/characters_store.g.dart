// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharactersStore on CharactersStoreBase, Store {
  Computed<bool>? _$hasMoreDataComputed;

  @override
  bool get hasMoreData =>
      (_$hasMoreDataComputed ??= Computed<bool>(() => super.hasMoreData,
              name: 'CharactersStoreBase.hasMoreData'))
          .value;
  Computed<bool>? _$hasDataComputed;

  @override
  bool get hasData => (_$hasDataComputed ??= Computed<bool>(() => super.hasData,
          name: 'CharactersStoreBase.hasData'))
      .value;

  late final _$allCharactersAtom =
      Atom(name: 'CharactersStoreBase.allCharacters', context: context);

  @override
  ObservableList<Character> get allCharacters {
    _$allCharactersAtom.reportRead();
    return super.allCharacters;
  }

  @override
  set allCharacters(ObservableList<Character> value) {
    _$allCharactersAtom.reportWrite(value, super.allCharacters, () {
      super.allCharacters = value;
    });
  }

  late final _$foundCharactersAtom =
      Atom(name: 'CharactersStoreBase.foundCharacters', context: context);

  @override
  ObservableList<Character> get foundCharacters {
    _$foundCharactersAtom.reportRead();
    return super.foundCharacters;
  }

  @override
  set foundCharacters(ObservableList<Character> value) {
    _$foundCharactersAtom.reportWrite(value, super.foundCharacters, () {
      super.foundCharacters = value;
    });
  }

  late final _$showSearchBarAtom =
      Atom(name: 'CharactersStoreBase.showSearchBar', context: context);

  @override
  bool get showSearchBar {
    _$showSearchBarAtom.reportRead();
    return super.showSearchBar;
  }

  @override
  set showSearchBar(bool value) {
    _$showSearchBarAtom.reportWrite(value, super.showSearchBar, () {
      super.showSearchBar = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'CharactersStoreBase.loading', context: context);

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
      Atom(name: 'CharactersStoreBase.loadingMore', context: context);

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

  late final _$hasErrorAtom =
      Atom(name: 'CharactersStoreBase.hasError', context: context);

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

  late final _$offsetAtom =
      Atom(name: 'CharactersStoreBase.offset', context: context);

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
      Atom(name: 'CharactersStoreBase.totalData', context: context);

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

  late final _$searchEnteredKeywordAtom =
      Atom(name: 'CharactersStoreBase.searchEnteredKeyword', context: context);

  @override
  String get searchEnteredKeyword {
    _$searchEnteredKeywordAtom.reportRead();
    return super.searchEnteredKeyword;
  }

  @override
  set searchEnteredKeyword(String value) {
    _$searchEnteredKeywordAtom.reportWrite(value, super.searchEnteredKeyword,
        () {
      super.searchEnteredKeyword = value;
    });
  }

  late final _$getCharactersAsyncAction =
      AsyncAction('CharactersStoreBase.getCharacters', context: context);

  @override
  Future<void> getCharacters() {
    return _$getCharactersAsyncAction.run(() => super.getCharacters());
  }

  late final _$showMoreCharactersAsyncAction =
      AsyncAction('CharactersStoreBase.showMoreCharacters', context: context);

  @override
  Future<void> showMoreCharacters() {
    return _$showMoreCharactersAsyncAction
        .run(() => super.showMoreCharacters());
  }

  late final _$CharactersStoreBaseActionController =
      ActionController(name: 'CharactersStoreBase', context: context);

  @override
  void runFilter(String enteredKeyword) {
    final _$actionInfo = _$CharactersStoreBaseActionController.startAction(
        name: 'CharactersStoreBase.runFilter');
    try {
      return super.runFilter(enteredKeyword);
    } finally {
      _$CharactersStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toogleSearch() {
    final _$actionInfo = _$CharactersStoreBaseActionController.startAction(
        name: 'CharactersStoreBase.toogleSearch');
    try {
      return super.toogleSearch();
    } finally {
      _$CharactersStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allCharacters: ${allCharacters},
foundCharacters: ${foundCharacters},
showSearchBar: ${showSearchBar},
loading: ${loading},
loadingMore: ${loadingMore},
hasError: ${hasError},
offset: ${offset},
totalData: ${totalData},
searchEnteredKeyword: ${searchEnteredKeyword},
hasMoreData: ${hasMoreData},
hasData: ${hasData}
    ''';
  }
}
