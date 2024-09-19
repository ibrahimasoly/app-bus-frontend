import 'dart:convert';

import 'package:bustransport/models/Passager.dart';
import 'package:http/http.dart' as http;

class PassagerService {
  String uri = "http://10.0.2.2:3050/Passager";
  Future<Passager> save(Passager passager) async {
    String url = uri;
    try {
      dynamic passager1 = jsonEncode(passager.toJson());
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: passager1,
      );
      if (response.statusCode == 200) {
        dynamic passagerMap = json.decode(response.body);
        Passager passager = Passager.fromJson(passagerMap);
        print(passager.email);
        return passager;
      } else {
        print("Error => ${response.statusCode}");
        return throw ("Error => ${response.statusCode}");
      }
    } catch (e) {
      print("Error => $e");
      return throw ("Error => $e");
    }
  }
}
