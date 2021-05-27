import 'package:dart_rick/models/Result.dart';
import 'models/Character.dart';
import 'request.dart';

Future<Result<Character>> getCharacter(options) async {
  final response = await getEndpoint(endpoint: 'character', options: options);
  try {
    return Result.fromJson(response['info'], response['results'], (item) {
      return Character.fromJson(item);
    });
  } catch (e) {
    rethrow;
  }
}
