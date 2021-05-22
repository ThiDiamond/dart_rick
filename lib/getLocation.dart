import 'models/Location.dart';
import 'request.dart';

List<Location> mapToLocation(results) {
  return mapToInterface<Location>(results, (result) {
    return Location.fromJson(result);
  });
}

Future<List<Location>> getLocation(options) async {
  var results = await getResults('location', options);
  return mapToLocation(results);
}
