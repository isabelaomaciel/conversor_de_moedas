import 'package:conversor_de_moedas/app/app.locator.dart';
import 'package:conversor_de_moedas/models/model.dart';
import 'package:conversor_de_moedas/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends FutureViewModel<HgBrasil> {
  final _apiService = locator<ApiService>();

  final realController = TextEditingController();
  final dollarController = TextEditingController();
  final euroController = TextEditingController();

   double? get dollar => data?.results.currencies.usd.buy;
  double? get euro => data?.results.currencies.eur.buy;

  Future<HgBrasil> getMoney() async {
    await Future.delayed(const Duration(seconds: 3));
    final result = await _apiService.getData();
    return result;
  }

  void realChanged(String text) {
    if (text.isEmpty) {
      clearAll();
      return;
    }

    double real = double.parse(text);
    dollarController.text = (real / (dollar ?? 1)).toStringAsFixed(2);
    euroController.text = (real / (euro ?? 1)).toStringAsFixed(2);
  }

  void dollarChanged(String text) {
    if (text.isEmpty) {
      clearAll();
      return;
    }

    double dollar = double.parse(text);
    realController.text = (dollar * (this.dollar ?? 1)).toStringAsFixed(2);
    euroController.text = (dollar * (this.dollar ?? 1) / (euro ?? 1)).toStringAsFixed(2);
  }

  void euroChanged(String text) {
    if (text.isEmpty) {
      clearAll();
      return;
    }
    double euro = double.parse(text);
    realController.text = (euro * (this.euro ?? 1)).toStringAsFixed(2);
    dollarController.text = (euro * (this.euro ?? 1) / (dollar ?? 1)).toStringAsFixed(2);
  }

  void clearAll() {
    realController.text = "";
    dollarController.text = "";
    euroController.text = "";
  }

  @override
  Future<HgBrasil> futureToRun() async {
    return getMoney();
  }
}
