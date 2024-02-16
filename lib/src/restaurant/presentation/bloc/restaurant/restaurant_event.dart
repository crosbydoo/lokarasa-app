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

class RestaurantShowDetailEvent extends RestaurantEvent {
  final String? id;

  const RestaurantShowDetailEvent({this.id});

  @override
  List<Object?> get props => [id];
}

class AddReviewEvent extends RestaurantEvent {
  final String id;
  final String name;
  final String review;

  AddReviewEvent({
    this.id = '',
    this.name = '',
    this.review = '',
  });

  @override
  List<Object> get props => [id, name, review];
}
