part of 'search_restaurant_bloc.dart';

class SearchRestaurantStateData extends Equatable {
  final ErrorDto? error;
  final int founded;
  final List<RestaurantDto> restaurant;

  const SearchRestaurantStateData({
    this.founded = 20,
    this.error,
    this.restaurant = const [],
  });

  @override
  List<Object?> get props => [founded, error, restaurant];

  SearchRestaurantStateData copyWith({
    ErrorDto? error,
    int? founded,
    List<RestaurantDto>? restaurant,
  }) {
    return SearchRestaurantStateData(
      error: error ?? this.error,
      founded: founded ?? this.founded,
      restaurant: restaurant ?? this.restaurant,
    );
  }
}

abstract class SearchRestaurantState extends Equatable {
  final SearchRestaurantStateData data;
  const SearchRestaurantState(this.data);

  @override
  List<Object> get props => [data];
}

class SearchRestaurantInitialState extends SearchRestaurantState {
  const SearchRestaurantInitialState()
      : super(const SearchRestaurantStateData());
}

class SearchRestaurantLoadingState extends SearchRestaurantState {
  const SearchRestaurantLoadingState(super.data);
}

class SearchRestaurantSuccessState extends SearchRestaurantState {
  const SearchRestaurantSuccessState(super.data);
}

class SearchRestaurantFailedState extends SearchRestaurantState {
  SearchRestaurantFailedState(super.data);
}
