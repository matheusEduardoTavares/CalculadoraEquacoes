// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePageController on _HomePageControllerBase, Store {
  Computed<String> _$appBarTitleComputed;

  @override
  String get appBarTitle =>
      (_$appBarTitleComputed ??= Computed<String>(() => super.appBarTitle,
              name: '_HomePageControllerBase.appBarTitle'))
          .value;
  Computed<String> _$displayTypeEquationTextComputed;

  @override
  String get displayTypeEquationText => (_$displayTypeEquationTextComputed ??=
          Computed<String>(() => super.displayTypeEquationText,
              name: '_HomePageControllerBase.displayTypeEquationText'))
      .value;
  Computed<String> _$displayResultTextComputed;

  @override
  String get displayResultText => (_$displayResultTextComputed ??=
          Computed<String>(() => super.displayResultText,
              name: '_HomePageControllerBase.displayResultText'))
      .value;

  final _$_isFirstDegreeEquationAtom =
      Atom(name: '_HomePageControllerBase._isFirstDegreeEquation');

  @override
  bool get _isFirstDegreeEquation {
    _$_isFirstDegreeEquationAtom.reportRead();
    return super._isFirstDegreeEquation;
  }

  @override
  set _isFirstDegreeEquation(bool value) {
    _$_isFirstDegreeEquationAtom
        .reportWrite(value, super._isFirstDegreeEquation, () {
      super._isFirstDegreeEquation = value;
    });
  }

  final _$_aValueAtom = Atom(name: '_HomePageControllerBase._aValue');

  @override
  double get _aValue {
    _$_aValueAtom.reportRead();
    return super._aValue;
  }

  @override
  set _aValue(double value) {
    _$_aValueAtom.reportWrite(value, super._aValue, () {
      super._aValue = value;
    });
  }

  final _$_bValueAtom = Atom(name: '_HomePageControllerBase._bValue');

  @override
  double get _bValue {
    _$_bValueAtom.reportRead();
    return super._bValue;
  }

  @override
  set _bValue(double value) {
    _$_bValueAtom.reportWrite(value, super._bValue, () {
      super._bValue = value;
    });
  }

  final _$_cValueAtom = Atom(name: '_HomePageControllerBase._cValue');

  @override
  double get _cValue {
    _$_cValueAtom.reportRead();
    return super._cValue;
  }

  @override
  set _cValue(double value) {
    _$_cValueAtom.reportWrite(value, super._cValue, () {
      super._cValue = value;
    });
  }

  final _$_firstDegreeQuantityGenerateNumbersAtom =
      Atom(name: '_HomePageControllerBase._firstDegreeQuantityGenerateNumbers');

  @override
  int get _firstDegreeQuantityGenerateNumbers {
    _$_firstDegreeQuantityGenerateNumbersAtom.reportRead();
    return super._firstDegreeQuantityGenerateNumbers;
  }

  @override
  set _firstDegreeQuantityGenerateNumbers(int value) {
    _$_firstDegreeQuantityGenerateNumbersAtom
        .reportWrite(value, super._firstDegreeQuantityGenerateNumbers, () {
      super._firstDegreeQuantityGenerateNumbers = value;
    });
  }

  final _$_sumAtom = Atom(name: '_HomePageControllerBase._sum');

  @override
  String get _sum {
    _$_sumAtom.reportRead();
    return super._sum;
  }

  @override
  set _sum(String value) {
    _$_sumAtom.reportWrite(value, super._sum, () {
      super._sum = value;
    });
  }

  final _$_HomePageControllerBaseActionController =
      ActionController(name: '_HomePageControllerBase');

  @override
  void _secondDegreeCalculate() {
    final _$actionInfo = _$_HomePageControllerBaseActionController.startAction(
        name: '_HomePageControllerBase._secondDegreeCalculate');
    try {
      return super._secondDegreeCalculate();
    } finally {
      _$_HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _firstDegreeCalculate() {
    final _$actionInfo = _$_HomePageControllerBaseActionController.startAction(
        name: '_HomePageControllerBase._firstDegreeCalculate');
    try {
      return super._firstDegreeCalculate();
    } finally {
      _$_HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculate() {
    final _$actionInfo = _$_HomePageControllerBaseActionController.startAction(
        name: '_HomePageControllerBase.calculate');
    try {
      return super.calculate();
    } finally {
      _$_HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeEquation() {
    final _$actionInfo = _$_HomePageControllerBaseActionController.startAction(
        name: '_HomePageControllerBase.changeEquation');
    try {
      return super.changeEquation();
    } finally {
      _$_HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAValue(dynamic value) {
    final _$actionInfo = _$_HomePageControllerBaseActionController.startAction(
        name: '_HomePageControllerBase.setAValue');
    try {
      return super.setAValue(value);
    } finally {
      _$_HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBValue(dynamic value) {
    final _$actionInfo = _$_HomePageControllerBaseActionController.startAction(
        name: '_HomePageControllerBase.setBValue');
    try {
      return super.setBValue(value);
    } finally {
      _$_HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCValue(dynamic value) {
    final _$actionInfo = _$_HomePageControllerBaseActionController.startAction(
        name: '_HomePageControllerBase.setCValue');
    try {
      return super.setCValue(value);
    } finally {
      _$_HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFirstDegreeQuantityGenerateNumbersValue(dynamic value) {
    final _$actionInfo = _$_HomePageControllerBaseActionController.startAction(
        name:
            '_HomePageControllerBase.setFirstDegreeQuantityGenerateNumbersValue');
    try {
      return super.setFirstDegreeQuantityGenerateNumbersValue(value);
    } finally {
      _$_HomePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
appBarTitle: ${appBarTitle},
displayTypeEquationText: ${displayTypeEquationText},
displayResultText: ${displayResultText}
    ''';
  }
}
