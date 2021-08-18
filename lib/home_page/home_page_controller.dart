import 'dart:math';

import 'package:flutter/material.dart' as material;
import 'package:mobx/mobx.dart';

part 'home_page_controller.g.dart';

class HomePageController = _HomePageControllerBase with _$HomePageController;

abstract class _HomePageControllerBase with Store {
  @observable
  var _isFirstDegreeEquation = true;

  @observable
  double _aValue;

  @observable
  double _bValue;

  @observable
  double _cValue;

  @observable
  int _firstDegreeQuantityGenerateNumbers;

  @observable
  String _sum;

  final formKey = material.GlobalKey<material.FormState>();
  
  ///-----------------------------------
  ///Getters
  
  bool get isFirstDegreeEquation => _isFirstDegreeEquation;

  @computed
  String get appBarTitle => _isFirstDegreeEquation ? 
    'Calculadora de primeiro grau' : 'Calculadora de segundo grau';

  @computed
  String get displayTypeEquationText => 'Trocar para equação do '
    '${_isFirstDegreeEquation ? 'primeiro' : 'segundo'} grau';

  @computed
  String get displayResultText => 
    _sum != null ? 'Resultado: $_sum' : 'Cálculo não efetuado';

  ///-----------------------------------
  ///Métodos privados
  @action
  void _secondDegreeCalculate() {
    final delta = (_bValue * _bValue) - 4 * _aValue * _cValue;
    if (delta < 0) {
      _sum = 'Delta menor que 0 ($delta), logo, não tem valores de X';
    }
    else if (delta == 0) {
      final x = -_bValue / (2 * _aValue);
      _sum = 'Delta = 0, então solução = {$x}';
    }
    else {
      final x1 = (-_bValue + sqrt(delta)) / 2 * _aValue;
      final x2 = (-_bValue - sqrt(delta)) / 2 * _aValue;
      _sum = 'Delta = $delta. Solução: {$x1, $x2}';
    }
  }

  @action
  void _firstDegreeCalculate() {
    var _intervalResults = '';
    for (var x = 1; x < _firstDegreeQuantityGenerateNumbers; x++) {
      final _calc = (_aValue * x) + _bValue;
      _intervalResults += '$_calc ${x == _firstDegreeQuantityGenerateNumbers ? '' : '|'} ';
    }
    _sum = _intervalResults;
  }

  ///-----------------------------------
  ///Métodos públicos
  @action
  void calculate() {
    if (!formKey.currentState.validate()) {
      return;
    }
    formKey.currentState.save();

    if (_isFirstDegreeEquation) {
      _firstDegreeCalculate();
    }
    else {
       _secondDegreeCalculate();
    }
  }

  @action
  void changeEquation() {
    _sum = null;
    _isFirstDegreeEquation = !_isFirstDegreeEquation;
  }

  @action
  void setAValue(value) {
    _aValue = double.parse(value);
  }

  @action
  void setBValue(value) {
    _bValue = double.parse(value);
  }

  @action
  void setCValue(value) {
    _cValue = double.parse(value);
  }

  @action
  void setFirstDegreeQuantityGenerateNumbersValue(value) {
    _firstDegreeQuantityGenerateNumbers = int.parse(value);
  }
}