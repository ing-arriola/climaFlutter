import 'package:http/http.dart';
import 'dart:convert';

class Networking {
  String url;
  Networking(this.url);

  Future getData() async {
    Response response = await get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      return response.statusCode;
    }
  }
}
