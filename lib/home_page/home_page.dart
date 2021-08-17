import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ 
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _isFirstDegreeEquation = true;
  final _formKey = GlobalKey<FormState>();
  double _aValue;
  double _bValue;
  double _cValue;
  int _quantity;
  String _sum;

  @override 
  void initState() {
    print('aqui');

    super.initState();
  }

  String _validateNumber(String text) {
    if (double.tryParse(text) == null) {
      return 'Apenas números reais';
    }

    return null;
  }

  String _validateInt(String text) {
    if (int.tryParse(text) == null) {
      return 'Apenas números inteiros';
    }

    return null;
  }

  List<double> _secondDegreeCalculate() {
    final delta = (_bValue * _bValue) - 4 * _aValue * _cValue;
    if (delta < 0) {
      return null;
    }

    if (delta == 0) {
      return [delta];
    }

    final x1 = (-_bValue + sqrt(delta)) / 2 * _aValue;
    final x2 = (-_bValue - sqrt(delta)) / 2 * _aValue;
    return [x1, x2];
  }

  String _firstDegreeCalculate() {
    var _totalCalc = '';
    for (var x = 0; x < _quantity; x++) {
      final _calc = (_aValue * x) + _bValue;
      _totalCalc += '$_calc | ';
    }
    return _totalCalc;
  }

  void _calculate() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    if (_isFirstDegreeEquation) {
      try {
        final sum = _firstDegreeCalculate();
        setState(() {
          _sum = sum;
        });
      }
      catch(_) {
        showDialog(
          context: context, 
          builder: (_) => AlertDialog(
            title: Text('Erro no cáculo'),
            content: const Text('Houve algum erro no cálculo'),
          ),
        );
      }

      print('_sum = $_sum');
    }
    else {
      try {
        final sum = _secondDegreeCalculate();
        setState(() {
          if (sum == null) {
            _sum = 'Delta menor que 0, logo, não tem valores de X';
          }
          else if (_sum.length == 1) {
            _sum = 'Delta = 0, então só tem X = $sum';
          }
          else {
            _sum = 'Solução: {${sum[0]}, ${sum[1]}}';
          }   
        });
      }
      catch(_) {
        showDialog(
          context: context, 
          builder: (_) => Text('Erro no cáculo'),
        );
      }
    }
  }

  void _changeEquation() {
    setState(() {
      _sum = null;
      _isFirstDegreeEquation = !_isFirstDegreeEquation;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isFirstDegreeEquation ? 'Calculadora de primeiro grau' : 'Calculadora de segundo grau'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Digite o valor de A',
                              ),
                              validator: _validateNumber,
                              keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
                              onSaved: (value) {
                                setState(() {
                                  _aValue = double.parse(value);
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Digite o valor de B',
                              ),
                              validator: _validateNumber,
                              keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
                              onSaved: (value) {
                                setState(() {
                                  _bValue = double.parse(value);
                                });
                              },
                            ),
                          ),
                          if (!_isFirstDegreeEquation)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Digite o valor de C',
                                ),
                                validator: _validateNumber,
                                keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
                                onSaved: (value) {
                                  setState(() {
                                    _cValue = double.parse(value);
                                  });
                                },
                              ),
                            )
                          else 
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Intervalo de X de 0 até',
                                ),
                                validator: _validateInt,
                                keyboardType: TextInputType.number,
                                onSaved: (value) {
                                  setState(() {
                                    _quantity = int.parse(value);
                                  });
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _calculate, 
                child: const Text('Calcular'),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                onPressed: _changeEquation, 
                child: Text(_isFirstDegreeEquation ? 'Trocar para equação do segundo grau' : 'Trocar para equação do primeiro grau'),
              ),
              const SizedBox(height: 10,),
              Expanded(child: Text(
                'Resultado: ${_sum ?? "Não somado"}'
              )),
            ],
          ),
        ),
      ),
    );
  }
}