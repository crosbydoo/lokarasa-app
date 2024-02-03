// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'restaurant_bloc.dart';

class RestaurantStateData extends Equatable {
  final ErrorDto? error;
  final List<RestaurantDto> data;

  const RestaurantStateData({
    this.error,
    this.data = const [],
  });

  @override
  List<Object?> get props => [data, error];

  RestaurantStateData copyWith({ErrorDto? error, List<RestaurantDto>? data}) {
    return RestaurantStateData(
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }
}

abstract class RestaurantState extends Equatable {
  final RestaurantStateData data;
  const RestaurantState(this.data);

  @override
  List<Object?> get props => [data];
}

class RestaurantInitialState extends RestaurantState {
  const RestaurantInitialState() : super(const RestaurantStateData());
}

class RestaurantLoadingState extends RestaurantState {
  const RestaurantLoadingState(super.data);
}

class RestaurantSuccesState extends RestaurantState {
  const RestaurantSuccesState(super.data);
}

class RestaurantFailedState extends RestaurantState {
  const RestaurantFailedState(super.data);
}
