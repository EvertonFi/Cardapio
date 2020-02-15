// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comiapi_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ComiApiStore on _ComiApiStoreBase, Store {
  Computed<CardaAPI> _$cardaAPIComputed;

  @override
  CardaAPI get cardaAPI =>
      (_$cardaAPIComputed ??= Computed<CardaAPI>(() => super.cardaAPI)).value;
  Computed<Cardapio> _$cardapioAtualComputed;

  @override
  Cardapio get cardapioAtual => (_$cardapioAtualComputed ??=
          Computed<Cardapio>(() => super.cardapioAtual))
      .value;

  final _$_cardaAPIAtom = Atom(name: '_ComiApiStoreBase._cardaAPI');

  @override
  CardaAPI get _cardaAPI {
    _$_cardaAPIAtom.context.enforceReadPolicy(_$_cardaAPIAtom);
    _$_cardaAPIAtom.reportObserved();
    return super._cardaAPI;
  }

  @override
  set _cardaAPI(CardaAPI value) {
    _$_cardaAPIAtom.context.conditionallyRunInAction(() {
      super._cardaAPI = value;
      _$_cardaAPIAtom.reportChanged();
    }, _$_cardaAPIAtom, name: '${_$_cardaAPIAtom.name}_set');
  }

  final _$_cardapioAtualAtom = Atom(name: '_ComiApiStoreBase._cardapioAtual');

  @override
  Cardapio get _cardapioAtual {
    _$_cardapioAtualAtom.context.enforceReadPolicy(_$_cardapioAtualAtom);
    _$_cardapioAtualAtom.reportObserved();
    return super._cardapioAtual;
  }

  @override
  set _cardapioAtual(Cardapio value) {
    _$_cardapioAtualAtom.context.conditionallyRunInAction(() {
      super._cardapioAtual = value;
      _$_cardapioAtualAtom.reportChanged();
    }, _$_cardapioAtualAtom, name: '${_$_cardapioAtualAtom.name}_set');
  }

  final _$_ComiApiStoreBaseActionController =
      ActionController(name: '_ComiApiStoreBase');

  @override
  dynamic fetchCardapioList({int categoria}) {
    final _$actionInfo = _$_ComiApiStoreBaseActionController.startAction();
    try {
      return super.fetchCardapioList(categoria: categoria);
    } finally {
      _$_ComiApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getCardapio({int index}) {
    final _$actionInfo = _$_ComiApiStoreBaseActionController.startAction();
    try {
      return super.getCardapio(index: index);
    } finally {
      _$_ComiApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCardapioAtual({int index}) {
    final _$actionInfo = _$_ComiApiStoreBaseActionController.startAction();
    try {
      return super.setCardapioAtual(index: index);
    } finally {
      _$_ComiApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Widget getImage({String numero}) {
    final _$actionInfo = _$_ComiApiStoreBaseActionController.startAction();
    try {
      return super.getImage(numero: numero);
    } finally {
      _$_ComiApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'cardaAPI: ${cardaAPI.toString()},cardapioAtual: ${cardapioAtual.toString()}';
    return '{$string}';
  }
}
