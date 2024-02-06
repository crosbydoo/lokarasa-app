part of 'search_restaurant_bloc.dart';

class SearchRestaurantStateData extends Equatable {
  final ErrorDto? error;
  final List<String> listSelectedRestaurant;
  final List<RestaurantDto> restaurantListData;

  const SearchRestaurantStateData({
    this.error,
    this.listSelectedRestaurant = const [],
    this.restaurantListData = const [],
  });

  @override
  List<Object?> get props => [
        error,
        listSelectedRestaurant,
        restaurantListData,
      ];

  SearchRestaurantStateData copyWith({
    ErrorDto? error,
    final List<String>? listSelectedRestaurant,
    List<RestaurantDto>? restaurantListData,
  }) {
    return SearchRestaurantStateData(
      error: error ?? this.error,
    );
  }
}

abstract class SearchRestaurantState extends Equatable {
  const SearchRestaurantState();

  @override
  List<Object> get props => [];
}

class SearchRestaurantInitial extends SearchRestaurantState {}
