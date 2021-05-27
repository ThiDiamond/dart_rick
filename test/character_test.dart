import 'package:dart_rick/get_character.dart';
import 'package:test/test.dart';

void main() {
  bool propertyContainsValue(String property, String value) {
    return property.contains(RegExp(value, caseSensitive: false));
  }

  test('getCharacter({name: "rick", status: "alive"}) | Check get by object',
      () async {
    final name = 'rick', status = 'alive';
    final options = {'name': name, 'status': status};
    final characters = await getCharacter(options);
    final isCharactersFiltered = characters.items.every((character) {
      return propertyContainsValue(character.name, name) &&
          propertyContainsValue(character.status, status);
    });
    expect(isCharactersFiltered, true);
  });

  test('getCharacter({page: 2}) | Check pagination', () async {
    final result = await getCharacter({'page': '2'});
    expect(result.prev!.endsWith('page=1'), true);
    expect(result.next!.endsWith('page=3'), true);
  });
}
