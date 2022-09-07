import 'package:http/http.dart';
import 'dart:convert'; // for the json response

class NetworkHelper {
  NetworkHelper(this.url);
  final url;
  Future getData() async {
    Response res = await get(Uri.parse(url));
    // print(res.body);
    if (res.statusCode == 200) {
      String data = res.body;
      return jsonDecode(data);
    } else {
      print(res.statusCode);
    }
  }
}
