import 'package:dart_rick/get_character.dart';
import 'package:dart_rick/get_episode.dart';
import 'package:dart_rick/get_location.dart';
import 'package:dart_rick/models/Result.dart';
import 'package:dart_rick/request.dart';
import 'package:test/test.dart';

void main() {
  test('getEndpoints()', () async {
    final base = 'https://rickandmortyapi.com/api/';
    final response = Map<String, dynamic>.from(await getEndpoints());
    final keys = response.keys.toList();
    // Keys are plural, ex: 'characters'
    expect(keys, ['characters', 'locations', 'episodes']);
    for (var key in keys) {
      // Endpoints are singular, ex: /api/character
      var url = '$base$key';
      expect(response[key], url.substring(0, url.length - 1));
    }
  });
  group('common tests', () {
    commonTests(getCharacter, 'Character');
    commonTests(getLocation, 'Location');
    commonTests(getEpisode, 'Episode');
  });
}

void commonTests(
    Future<Result<dynamic>> Function(dynamic) method, String name) {
  test('get$name() | Get all', () async {
    final results = await method(null);
    expect(results.items.length, 20);
  });

  test('get$name(1) | Check get by ID', () async {
    final results = await method(1);
    final result = results.items[0];
    //t.is(typeof res === 'object', true)
    expect(result.id, 1);
  });

  test('get$name([1,2,3]) | Check get by array', () async {
    final arr = [1, 2, 3];
    final results = await method(arr);

    //t.is(typeof res === 'object' && Array.isArray(res), true)
    for (var result in results.items) {
      expect(arr.contains(result.id), true);
    }
  });

  test('get$name(6000) | Check 404', () async {
    final expectedError = '$name not found';
    expect(() => method(6000), throwsA(predicate((e) => e == expectedError)));
  });

  test('get$name("wubba lubba dub dub") | Check throw error', () async {
    final expectedError =
        'As argument use an object, an array, an integer or leave it blank';
    expect(
        () => method('wubba lubba dub dub'),
        throwsA(predicate(
            (e) => e is ArgumentError && e.message == expectedError)));
  });
}
