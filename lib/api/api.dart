import 'dart:convert';
import 'package:http/http.dart' as http;

class CallApi {
  final String _url = 'http://192.168.1.55/wethinks/public/api/';

  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders());
  }

  filterData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders());
  }

  infoData(data, apiUrl) async {
    int dataid = data;
    var fullUrl = _url + apiUrl + "/" + '$dataid';
    return await http.get(fullUrl, headers: _setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.get(fullUrl, headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
