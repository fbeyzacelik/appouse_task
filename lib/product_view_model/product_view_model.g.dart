// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductViewModel on _ProductViewModel, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_ProductViewModel.loading'))
      .value;

  final _$_loadingStatusAtom = Atom(name: '_ProductViewModel._loadingStatus');

  @override
  bool get _loadingStatus {
    _$_loadingStatusAtom.reportRead();
    return super._loadingStatus;
  }

  @override
  set _loadingStatus(bool value) {
    _$_loadingStatusAtom.reportWrite(value, super._loadingStatus, () {
      super._loadingStatus = value;
    });
  }

  final _$telephoneListAtom = Atom(name: '_ProductViewModel.telephoneList');

  @override
  ObservableList<ProductResult> get telephoneList {
    _$telephoneListAtom.reportRead();
    return super.telephoneList;
  }

  @override
  set telephoneList(ObservableList<ProductResult> value) {
    _$telephoneListAtom.reportWrite(value, super.telephoneList, () {
      super.telephoneList = value;
    });
  }

  final _$telephoneFutureDataAtom =
      Atom(name: '_ProductViewModel.telephoneFutureData');

  @override
  ObservableFuture<ProductResponse> get telephoneFutureData {
    _$telephoneFutureDataAtom.reportRead();
    return super.telephoneFutureData;
  }

  @override
  set telephoneFutureData(ObservableFuture<ProductResponse> value) {
    _$telephoneFutureDataAtom.reportWrite(value, super.telephoneFutureData, () {
      super.telephoneFutureData = value;
    });
  }

  final _$getTelephoneDataAsyncAction =
      AsyncAction('_ProductViewModel.getTelephoneData');

  @override
  Future<dynamic> getTelephoneData() {
    return _$getTelephoneDataAsyncAction.run(() => super.getTelephoneData());
  }

  final _$getLaptopDataAsyncAction =
      AsyncAction('_ProductViewModel.getLaptopData');

  @override
  Future<dynamic> getLaptopData() {
    return _$getLaptopDataAsyncAction.run(() => super.getLaptopData());
  }

  @override
  String toString() {
    return '''
telephoneList: ${telephoneList},
telephoneFutureData: ${telephoneFutureData},
loading: ${loading}
    ''';
  }
}
