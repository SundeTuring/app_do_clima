import 'package:http/http.dart' as http;
import 'dart:convert';

class ComunicationWithAPI {
  String url;
  ComunicationWithAPI({
    required this.url,
  });

  Future getData() async {
    http.Response response = await http.get(
      Uri.parse(
        url,
      ),
    );
    String? data = response.body;
    int statusCodeNumber = response.statusCode;
    if (response.statusCode == 200) {
      return jsonDecode(data);
    } else {
      return statusCodeNumber.toString();
    }
  }
}
