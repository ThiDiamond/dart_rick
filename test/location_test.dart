import 'package:dart_rick/get_location.dart';
import 'package:dart_rick/request.dart';
import 'package:test/test.dart';

void main() {
  bool propertyContainsValue(String property, String value) {
    return property.contains(RegExp(value, caseSensitive: false));
  }

  test('getLocation({ name: "Earth", type: "Planet" }) | Check get by object',
      () async {
    final name = 'Earth', type = 'Planet';
    final options = {'name': name, 'type': type};
    final locations = await getLocation(options);
    final isLocationsFiltered = locations.items.every((location) {
      return propertyContainsValue(location.name, name) &&
          propertyContainsValue(location.type, type);
    });
    expect(isLocationsFiltered, true);
  });

  test('getLocation({page: 2}) | Check pagination', () async {
    final results = await getLocation({'page': '2'});
    expect(results.prev!.endsWith('page=1'), true);
    expect(results.next!.endsWith('page=3'), true);
  });
}
