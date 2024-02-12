import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/core/domain/models/error_dto.dart';
import 'package:restaurant_app/src/restaurant/domain/models/restaurant_dto.dart';
import 'package:restaurant_app/src/restaurant/domain/usecases/search_restaurant_usecase.dart';

part 'search_restaurant_event.dart';
part 'search_restaurant_state.dart';

class SearchRestaurantBloc
    extends Bloc<SearchRestaurantEvent, SearchRestaurantState> {
  final SearchRestaurantUsecase searchRestaurantUsecase;
  var stateData = const SearchRestaurantStateData();

  SearchRestaurantBloc({
    required this.searchRestaurantUsecase,
  }) : super(SearchRestaurantInitialState()) {
    on<SearchRestaurantInitEvent>(_onInit);
    on<SearchRestaurantResultEvent>(_onProcess);
  }

  void _onInit(
    SearchRestaurantInitEvent event,
    Emitter<SearchRestaurantState> emit,
  ) async {
    emit(const SearchRestaurantInitialState());
    emit(SearchRestaurantLoadingState(stateData));

    stateData = stateData.copyWith();

    await _doSearch(founded: 20);

    if (stateData.error != null) {
      emit(SearchRestaurantFailedState(stateData));
    } else {
      emit(SearchRestaurantSuccessState(stateData));
    }
  }

  void _onProcess(
    SearchRestaurantResultEvent event,
    Emitter<SearchRestaurantState> emit,
  ) async {
    var hasMoreData = stateData.restaurant.length <= 20;
    if (event.founded > 0 && !hasMoreData) {
      return;
    }

    stateData = const SearchRestaurantStateData();

    stateData = stateData.copyWith(founded: event.founded);

    emit(SearchRestaurantLoadingState(stateData));
    await _doSearch(
      founded: event.founded,
      keyword: event.searchKeyword,
    );
    if (stateData.error != null) {
      emit(SearchRestaurantFailedState(stateData));
    } else {
      emit(SearchRestaurantSuccessState(stateData));
    }
  }

  Future _doSearch({int founded = 20, String? keyword}) async {
    stateData = stateData.copyWith(founded: founded);
    var result = await searchRestaurantUsecase.execute(
      founded: founded,
      keyword: keyword,
    );

    result.fold(
      (error) {
        if (founded == 0) {
          stateData = stateData.copyWith(restaurant: [], error: error);
        } else {
          stateData = stateData.copyWith(
            error: error,
          );
        }
      },
      (response) {
        if (founded == 20) {
          stateData = stateData.copyWith(
            error: null,
            founded: response.founded,
            restaurant: response.restaurants,
          );
        } else {
          var listSearch = List.from(stateData.restaurant);
          listSearch.addAll(response.restaurants);
          stateData = stateData.copyWith(
            restaurant: response.restaurants,
            error: null,
          );
        }
      },
    );
  }
}
