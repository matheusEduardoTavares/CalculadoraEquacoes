import 'package:calculadora_equacoes/home_page/home_page_controller.dart';
import 'package:calculadora_equacoes/home_page/utils/form_utils/custom_validators/custom_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({ 
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final _homeController = HomePageController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) {
            return Text(_homeController.appBarTitle);
          }
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Observer(
            builder: (_) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Form(
                        key: _homeController.formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Digite o valor de A',
                                ),
                                validator: CustomValidators.validateDouble,
                                keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
                                onSaved: _homeController.setAValue,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Digite o valor de B',
                                ),
                                validator: CustomValidators.validateDouble,
                                keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
                                onSaved: _homeController.setBValue,
                              ),
                            ),
                            if (!_homeController.isFirstDegreeEquation)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Digite o valor de C',
                                  ),
                                  validator: CustomValidators.validateDouble,
                                  keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
                                  onSaved: _homeController.setCValue,
                                ),
                              )
                            else 
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Intervalo de X de 1 até',
                                  ),
                                  validator: CustomValidators.validateInt,
                                  keyboardType: TextInputType.number,
                                  onSaved: _homeController.setFirstDegreeQuantityGenerateNumbersValue,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _homeController.calculate, 
                  child: const Text('Calcular'),
                ),
                const SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: _homeController.changeEquation, 
                  child: Text(_homeController.displayTypeEquationText),
                ),
                const SizedBox(height: 10,),
                Expanded(
                  child: Text(
                    _homeController.displayResultText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}