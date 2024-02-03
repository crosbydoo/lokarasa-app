part of 'restaurant_bloc.dart';

abstract class RestaurantEvent extends Equatable {
  const RestaurantEvent();
}

class RestaurantInitEvent extends RestaurantEvent {
  @override
  List<Object?> get props => [];
}

class RestaurantShowListEvent extends RestaurantEvent {
  @override
  List<Object?> get props => [];
}
