import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/core/domain/models/error_dto.dart';
import 'package:restaurant_app/src/restaurant/domain/models/restaurant_dto.dart';
import 'package:restaurant_app/src/restaurant/domain/usecases/get_restaurant_usecase.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final GetRestaurantUsecase usecase;
  var stateData = const RestaurantStateData();

  RestaurantBloc({required this.usecase})
      : super(const RestaurantInitialState()) {
    on<RestaurantInitEvent>(_onInit);
    on<RestaurantShowListEvent>(_getListRestaurant);
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
}
