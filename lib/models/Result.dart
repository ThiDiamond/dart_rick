class Result<T> {
  Result({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
    required this.items,
  });
  final int? count;
  final int? pages;
  final String? next;
  final String? prev;
  final List<T> items;
  factory Result.fromJson(info, results, Function parseFunction) {
    return Result(
      count: info['count'],
      pages: info['pages'],
      next: info['next'],
      prev: info['prev'],
      items: List<T>.from(results.map(parseFunction)),
    );
  }
}
