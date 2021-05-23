# The Rick and Morty API Dart client 

> Hey, did you ever want to hold a terry fold?,
>  I got one right here, grab my terry flap.

This is wrapper to use the [The Rick and Morty API](https://rickandmortyapi.com) in your favourite Dart project, inspired by [rick-and-morty-api-node](https://github.com/afuh/rick-and-morty-api-node/).

**To get started check the documentation on [rickandmortyapi.com](https://rickandmortyapi.com/documentation)**

## Installation

To use this package, add dart_rick as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages).

## Usage
```dart
import 'package:dart_rick/getCharacter.dart';
import 'package:dart_rick/getLocation.dart';
import 'package:dart_rick/getEpisode.dart';
```

All methods return a Future,.

- `getCharacter()`
- `getEpisode()`
- `getLocation()`

All the methods work in the same way. The only exception is the queries that you can pass as an object to each method.
To know more about the schema of each response, please check [here](https://rickandmortyapi.com/documentation/#character-schema)

### Get by ID
```dart
final [rick] = await getCharacter(1);
final [earth] = await getLocation(1);
final [episodeOne] = await getEpisode(1);

// You can also use an array of IDs.
final theSmiths = await getCharacter([ 2, 3, 4, 5 ]);
final [ earth, citadel ] = await getLocation([ 1, 3 ]);
final s01 = await getEpisode(List<int>.generate(11, (i) => i + 1));
```

### Filter
Pass an object with the queries.
To know more about filtering check the [docs](https://rickandmortyapi.com/documentation/#filter-characters).

```dart
final aliveRicks = await getCharacter({
  name: 'rick',
  status: 'alive'
});

// You can pass page number inside the object
final planets = await getLocation({
  type: 'planet',
  page: 2
});

final seasonOne = await getEpisode({
  episode: 's01'
});
```

### Get all
```dart
final chars = await getCharacter();
final locations = await getLocation();
final episodes = await getEpisode();

// You can pass a page number to access all the pages inside the info object
// To know more about the info object and pagination, check
// https://rickandmortyapi.com/documentation/#info-and-pagination
final moreChars = await getCharacter({ page: 2 });
```

- `getEndpoints()`

This method will response with the available REST endpoints, you can use it to ping the server status.
