// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'restaurant_bloc.dart';

class RestaurantStateData extends Equatable {
  final ErrorDto? error;
  final DetailRestaurantDto detailData;
  final List<RestaurantDto> data;
  final List<CustomerReview> dataReview;

  const RestaurantStateData({
    this.detailData = const DetailRestaurantDto(),
    this.error,
    this.dataReview = const [],
    this.data = const [],
  });

  @override
  List<Object?> get props => [
        data,
        error,
        detailData,
        dataReview,
      ];

  RestaurantStateData copyWith({
    ErrorDto? error,
    List<RestaurantDto>? data,
    DetailRestaurantDto? detailData,
    List<CustomerReview>? dataReview,
  }) {
    return RestaurantStateData(
      data: data ?? this.data,
      error: error ?? this.error,
      detailData: detailData ?? this.detailData,
      dataReview: dataReview ?? this.dataReview,
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

class RestaurantDetailSuccessState extends RestaurantState {
  const RestaurantDetailSuccessState(super.data);
}

class RestaurantDetailFailedState extends RestaurantState {
  const RestaurantDetailFailedState(super.data);
}

class ReviewSuccessState extends RestaurantState {
  const ReviewSuccessState(super.data);
}

class ReviewFailedState extends RestaurantState {
  const ReviewFailedState(super.data);
}
