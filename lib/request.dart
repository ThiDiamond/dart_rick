import 'dart:convert';
import 'package:http/http.dart' as http;

var baseUrl = 'https://rickandmortyapi.com/api/';
Future getRequest(String endpointUrl) async {
  final url = Uri.parse(baseUrl + endpointUrl);
  final response = await http.get(url);
  if (response.statusCode >= 200 && response.statusCode <= 300) {
    return jsonDecode(response.body);
  } else {
    throw jsonDecode(response.body)['error'];
  }
}

String validate(qry) {
  if (qry is int || qry is List<int>) {
    return '/${qry.toString()}';
  }

  if (qry == null) return '';

  if (qry is Map<String, String>) {
    var url = '/?' +
        qry.keys.map((key) {
          return Uri.encodeComponent(key) +
              '=' +
              Uri.encodeComponent(Map.from(qry)[key]);
        }).join('&');
    return url;
  }

  throw ArgumentError(
      'As argument use an object, an array, an integer or leave it blank');
}

Future getEndpoint({endpoint = '', options}) async {
  var query = validate(options);
  var response = {};
  response['info'] = {};

  try {
    var data = await getRequest('$endpoint$query');
    if (options is int && data is Map) {
      response['results'] = [data];
    } else if (options is List<int>) {
      response['results'] = data;
    } else {
      response = data;
    }
    return response;
  } catch (e) {
    rethrow;
  }
}

Future getEndpoints() {
  return getEndpoint();
}
