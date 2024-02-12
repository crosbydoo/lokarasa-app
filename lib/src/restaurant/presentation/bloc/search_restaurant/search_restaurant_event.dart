// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_restaurant_bloc.dart';

abstract class SearchRestaurantEvent extends Equatable {
  const SearchRestaurantEvent();
}

class SearchRestaurantInitEvent extends SearchRestaurantEvent {
  @override
  List<Object> get props => [];
}

class SearchRestaurantResultEvent extends SearchRestaurantEvent {
  final String? searchKeyword;
  final int founded;

  SearchRestaurantResultEvent({
    this.searchKeyword,
    required this.founded,
  });

  @override
  List<Object?> get props => [searchKeyword, founded];
}
