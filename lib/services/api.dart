import 'package:http/http.dart' as http;
import 'dart:convert';
import 'currency.dart';

class ApiClient {
  final Uri currencyURL = Uri.http(
    "data.fixer.io", //base url
    "/api/latest", //endpoint
    {"apiKey": "791d804d359c2a73d9e34a8e7c3784bc"}, //map for properties
  );

  //get currencies list

  Future<List<String>> getCurrencies() async {
    http.Response res = await http.get(currencyURL);
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      // var list = body["rates"];
      List<String> currencies = (body.keys)
          .toList(); // don't know how to iterate to rates from here, it prints success
      print(currencies);
      return currencies;
    } else {
      throw Exception("Connection Failed");
    }
  }
}
