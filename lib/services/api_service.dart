import 'dart:convert';
import 'package:conversor_de_moedas/models/model.dart';
import 'package:http/http.dart' as http;


class ApiService {

  Future<HgBrasil> getData() async {
    final response = await http.get(Uri.parse("https://api.hgbrasil.com/finance?format=json-cors&key=3ae23e6e"));
    final decode = HgBrasil.fromJson(jsonDecode(response.body));
    return decode;
  }
}
