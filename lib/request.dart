import 'dart:convert';
import 'package:http/http.dart' as http;

var baseUrl = 'https://rickandmortyapi.com/api/';
Future getRequest(String endpointUrl) async {
  final url = Uri.parse(baseUrl + endpointUrl);
  final response = await http.get(url);
  if (response.statusCode >= 200 && response.statusCode <= 300) {
    return jsonDecode(response.body);
  } else {
    throw jsonDecode(response.body);
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
  try {
    var data = await getRequest('$endpoint$query');
    return data;
  } catch (e) {
    rethrow;
  }
}

Future getEndpoints() {
  return getEndpoint();
}

List<T> mapToInterface<T>(results, Function(dynamic) parseFunction) {
  if (results is Map) {
    return [parseFunction(results)];
  }
  return List<T>.from(results.map((result) {
    return parseFunction(result);
  }));
}

Future<dynamic> getResults(endpoint, options) async {
  try {
    var response = await getEndpoint(endpoint: endpoint, options: options);
    if (options is int || options is List<int>) {
      return response;
    }
    return response['results'];
  } on ArgumentError {
    rethrow;
  } catch (e) {
    return [];
  }
}
