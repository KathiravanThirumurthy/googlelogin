import 'dart:convert';

import 'package:flutterSigninsetup/models/usermodel.dart';
import 'package:http/http.dart' as http;

class Webservice {
  Future<List<Usermodel>> fetchUsers() async {
    final url = "http://localhost/ci3/api/user";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["result"];
      return json.map((item) => Usermodel.fromJson(item)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
