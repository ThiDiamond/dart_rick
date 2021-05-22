import 'models/Episode.dart';
import 'request.dart';

List<Episode> mapToEpisode(results) {
  return mapToInterface<Episode>(results, (result) {
    return Episode.fromJson(result);
  });
}

Future<List<Episode>> getEpisode(options) async {
  var results = await getResults('episode', options);
  return mapToEpisode(results);
}
