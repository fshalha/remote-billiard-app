import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandler {
  String baseurl = "http://localhost:3000";
  var log = Logger();
  //FlutterSecureStorage storage = FlutterSecureStorage();

  Future get(String url) async {
    //String token = await storage.read(key: "token");
    url = formater(url);
    // /user/register
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);
      return json.decode(response.body);
    }
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<http.Response> post(String url, Map<String, String> body) async {
    //String token = await storage.read(key: "token");
    url = formater(url);
    log.d(body);
    var response = await http.post(
      Uri.parse(url),
      headers: {"Content-type": "application/json"},
      // "Authorization": "Bearer $token"
      // },
      body: json.encode(body),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);
      return response;
    }
    log.d(response.body);
    log.d(response.statusCode);
    return response;
  }

  String formater(String url) {
    return baseurl + url;
  }
}
