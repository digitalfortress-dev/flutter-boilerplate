class PaginationEntity {
  final int lastVisiblePage;
  final bool hasNextPage;
  final int? currentPage;
  final int count;
  final int total;
  final int perPage;

  PaginationEntity({
    required this.lastVisiblePage,
    required this.hasNextPage,
    this.currentPage,
    required this.count,
    required this.total,
    required this.perPage,
  });
}
