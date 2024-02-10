import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/categorymodel.dart';

class Api_Helper {
  Api_Helper._();

  static Api_Helper api = Api_Helper._();

  Future<List<Catagory_Model>?> fetchCatagory() async {
    String api = "https://fakestoreapi.com/products";
    http.Response response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      var body = response.body;
      List decodedata = jsonDecode(body);
      List<Catagory_Model> data =
          decodedata.map((e) => Catagory_Model.formJSON(data: e)).toList();

      return data;
    } else {
      return null;
    }
  }
}
