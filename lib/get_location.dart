import 'package:dart_rick/models/Location.dart';
import 'package:dart_rick/models/Result.dart';
import 'request.dart';

Future<Result<Location>> getLocation(options) async {
  final response = await getEndpoint(endpoint: 'location', options: options);
  return Result.fromJson(response['info'], response['results'], (item) {
    return Location.fromJson(item);
  });
}
