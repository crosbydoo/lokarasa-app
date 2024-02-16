import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/core/domain/models/error_dto.dart';
import 'package:restaurant_app/src/restaurant/data/remote/requests/add_review_request.dart';
import 'package:restaurant_app/src/restaurant/data/remote/responses/detail_restaurant_response.dart';
import 'package:restaurant_app/src/restaurant/domain/models/detail_restaurant_dto.dart';
import 'package:restaurant_app/src/restaurant/domain/models/restaurant_dto.dart';
import 'package:restaurant_app/src/restaurant/domain/usecases/add_review_usecase.dart';
import 'package:restaurant_app/src/restaurant/domain/usecases/get_detail_restaurant_usecase.dart';
import 'package:restaurant_app/src/restaurant/domain/usecases/get_restaurant_usecase.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final GetRestaurantUsecase usecase;
  final GetDetailRestaurantUsecase detailUsecase;
  final AddReviewUsecase reviewUsecase;
  var stateData = const RestaurantStateData();

  RestaurantBloc({
    required this.detailUsecase,
    required this.usecase,
    required this.reviewUsecase,
  }) : super(const RestaurantInitialState()) {
    on<RestaurantInitEvent>(_onInit);
    on<RestaurantShowListEvent>(_getListRestaurant);
    on<RestaurantShowDetailEvent>(_getDetailRestaurant);
    on<AddReviewEvent>(_addReviewRestaurant);
  }

  void _onInit(
    RestaurantInitEvent event,
    Emitter<RestaurantState> emit,
  ) async {
    emit(const RestaurantInitialState());
  }

  void _getListRestaurant(
    RestaurantShowListEvent event,
    Emitter<RestaurantState> emit,
  ) async {
    emit(RestaurantLoadingState(stateData));

    var result = await usecase.execute();

    result.fold((error) {
      stateData = stateData.copyWith(error: error);
      emit(RestaurantFailedState(
        stateData.copyWith(error: error),
      ));
    }, (response) {
      stateData = stateData.copyWith(
        data: response,
        error: null,
      );
      emit(RestaurantSuccesState(stateData));
    });
  }

  void _getDetailRestaurant(
    RestaurantShowDetailEvent event,
    Emitter<RestaurantState> emit,
  ) async {
    var result = await detailUsecase.execute(id: event.id);
    result.fold(
      (error) {
        stateData = stateData.copyWith(
            detailData: const DetailRestaurantDto(), error: error);
        emit(RestaurantDetailFailedState(
          stateData.copyWith(error: error),
        ));
      },
      (response) {
        stateData = stateData.copyWith(
          detailData: response,
          error: null,
        );
        emit(RestaurantDetailSuccessState(stateData));
      },
    );
  }

  void _addReviewRestaurant(
    AddReviewEvent event,
    Emitter<RestaurantState> emit,
  ) async {
    var request = AddReviewRequest(
      id: event.id,
      name: event.name,
      review: event.review,
    );

    var resultSearch = await reviewUsecase.execute(request);

    resultSearch.fold(
      (error) {
        emit(ReviewFailedState(stateData.copyWith(error: error)));
      },
      (response) {
        stateData = stateData.copyWith(
          dataReview: response,
          error: null,
        );
        emit(ReviewSuccessState(stateData));
      },
    );
  }
}
