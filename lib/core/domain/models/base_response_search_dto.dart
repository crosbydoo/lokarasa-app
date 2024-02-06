class BaseResponseSearchDto<T> {
  final List<T> restaurants;
  final int founded;
  final bool error;

  const BaseResponseSearchDto({
    required this.restaurants,
    this.founded = 20,
    this.error = false,
  });

  @override
  String toString() {
    return 'BasePaginationDto{restaurants: $restaurants, founded: $founded, error: $error,}';
  }
}
