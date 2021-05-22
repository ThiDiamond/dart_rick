import 'models/Character.dart';
import 'request.dart';

List<Character> mapToCharacter(results) {
  return mapToInterface<Character>(results, (result) {
    return Character.fromJson(result);
  });
}

Future<List<Character>> getCharacter(options) async {
  var results = await getResults('character', options);
  return mapToCharacter(results);
}
