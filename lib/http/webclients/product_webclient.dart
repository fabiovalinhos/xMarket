import 'package:http/http.dart';
import 'package:xastremarketmobile/http/webclient.dart';
import 'package:xastremarketmobile/models/product.dart';

import 'dart:async';
import 'dart:convert';

class ProductWebClient {
  Future<List<Product>> findAll() async {
    final Response response = await client.get(baseUrl);
    final List<dynamic> decodeJson = jsonDecode(response.body);
    return decodeJson.map((dynamic json) => Product.fromJson(json)).toList();
  }
}
