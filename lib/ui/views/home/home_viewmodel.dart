import 'package:conversor_de_moedas/app/app.locator.dart';
import 'package:conversor_de_moedas/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
    final _apiService = locator<ApiService>();

    final realController = TextEditingController();
    final dollarController = TextEditingController();
    final euroController = TextEditingController();

    late double dollar;
    late double euro;

  void getMoney() async{
    final result = await _apiService.getData();
    euro = result["results"]["currencies"]["EUR"]["buy"];
    dollar = result["results"]["currencies"]["USD"]["buy"];
  }



  void realChanged(String text){
    if(text.isEmpty){
      clearAll();
    }
    double real = double.parse(text);
    dollarController.text = (real/dollar).toStringAsFixed(2);
    euroController.text = (real/euro).toStringAsFixed(2);
  }

  void dollarChanged(String text) {
    if(text.isEmpty){
      clearAll();
    }
    double dollar = double.parse(text);
    realController.text = (dollar * this.dollar).toStringAsFixed(2);
    euroController.text = (dollar * this.dollar / euro).toStringAsFixed(2);
  }

void euroChanged(String text){
  if(text.isEmpty){
    clearAll();
  }
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dollarController.text = (euro * this.euro / dollar).toStringAsFixed(2);
}

void clearAll(){
    realController.text = "";
    dollarController.text = "";
    euroController.text = "";

}
}
