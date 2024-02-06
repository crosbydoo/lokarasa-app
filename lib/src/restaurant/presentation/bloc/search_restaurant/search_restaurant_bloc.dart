import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/core/domain/models/error_dto.dart';
import 'package:restaurant_app/src/restaurant/domain/models/restaurant_dto.dart';

part 'search_restaurant_event.dart';
part 'search_restaurant_state.dart';

class SearchRestaurantBloc
    extends Bloc<SearchRestaurantEvent, SearchRestaurantState> {
  SearchRestaurantBloc() : super(SearchRestaurantInitial()) {
    on<SearchRestaurantEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
