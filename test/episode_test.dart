import 'package:dart_rick/get_episode.dart';
import 'package:test/test.dart';

void main() {
  bool propertyContainsValue(String property, String value) {
    return property.contains(RegExp(value, caseSensitive: false));
  }

  test('getEpisode({name: "Pilot", episode: "S01E01"}) | Check get by object',
      () async {
    final name = 'Pilot', episodeName = 'S01E01';
    final options = {'name': name, 'episode': episodeName};
    final episodes = await getEpisode(options);
    final isEpisodesFiltered = episodes.items.every((episode) {
      return propertyContainsValue(episode.name, name) &&
          propertyContainsValue(episode.episode, episodeName);
    });
    expect(isEpisodesFiltered, true);
  });

  test('getEpisode({page: 2}) | Check pagination', () async {
    final result = await getEpisode({'page': '2'});
    expect(result.prev!.endsWith('page=1'), true);
    expect(result.next!.endsWith('page=3'), true);
  });
}
