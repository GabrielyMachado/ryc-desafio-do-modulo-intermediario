// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharactersStore on CharactersStoreBase, Store {
  Computed<bool>? _$hasDataComputed;

  @override
  bool get hasData => (_$hasDataComputed ??= Computed<bool>(() => super.hasData,
          name: 'CharactersStoreBase.hasData'))
      .value;

  late final _$charactersAtom =
      Atom(name: 'CharactersStoreBase.characters', context: context);

  @override
  ObservableList<Character> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(ObservableList<Character> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
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

  late final _$getCharactersAsyncAction =
      AsyncAction('CharactersStoreBase.getCharacters', context: context);

  @override
  Future<void> getCharacters() {
    return _$getCharactersAsyncAction.run(() => super.getCharacters());
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
  String toString() {
    return '''
characters: ${characters},
foundCharacters: ${foundCharacters},
loading: ${loading},
hasError: ${hasError},
hasData: ${hasData}
    ''';
  }
}
