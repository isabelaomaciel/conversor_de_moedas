import 'dart:convert';
import 'package:http/http.dart' as http;


class ApiService {

  Future<Map> getData() async {
    final response = await http.get(Uri.parse("https://api.hgbrasil.com/finance?format=json-cors&key=3ae23e6e"));
    final decode = jsonDecode(response.body);
    return decode;
  }
}
