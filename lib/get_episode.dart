import 'package:dart_rick/models/Episode.dart';
import 'package:dart_rick/models/Result.dart';
import 'request.dart';

Future<Result<Episode>> getEpisode(options) async {
  final response = await getEndpoint(endpoint: 'episode', options: options);
  return Result.fromJson(response['info'], response['results'], (item) {
    return Episode.fromJson(item);
  });
}
