// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:restaurant_app/core/data/local/app_preferences.dart' as _i5;
import 'package:restaurant_app/core/data/remote/interceptors/auth_interceptor.dart'
    as _i3;
import 'package:restaurant_app/core/di/local_module.dart' as _i14;
import 'package:restaurant_app/core/di/network_module.dart' as _i13;
import 'package:restaurant_app/src/restaurant/data/remote/services/restaurant_service.dart'
    as _i7;
import 'package:restaurant_app/src/restaurant/data/repository/restaurant_repository.dart'
    as _i8;
import 'package:restaurant_app/src/restaurant/data/repository/restaurant_repository_impl.dart'
    as _i16;
import 'package:restaurant_app/src/restaurant/di/restaurant_di_module.dart'
    as _i15;
import 'package:restaurant_app/src/restaurant/domain/usecases/add_review_usecase.dart'
    as _i10;
import 'package:restaurant_app/src/restaurant/domain/usecases/get_detail_restaurant_usecase.dart'
    as _i11;
import 'package:restaurant_app/src/restaurant/domain/usecases/get_restaurant_usecase.dart'
    as _i12;
import 'package:restaurant_app/src/restaurant/domain/usecases/search_restaurant_usecase.dart'
    as _i9;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    final localModule = _$LocalModule();
    final restaurantDiModule = _$RestaurantDiModule(this);
    gh.singleton<_i3.AuthInterceptor>(networkModule.authInterceptor);
    await gh.singletonAsync<_i4.SharedPreferences>(
      () => localModule.prefs,
      preResolve: true,
    );
    gh.singleton<String>(
      networkModule.baseUrl,
      instanceName: 'base_url',
    );
    gh.singleton<_i5.AppPreferences>(
        localModule.appPreferences(gh<_i4.SharedPreferences>()));
    gh.singleton<_i6.Dio>(networkModule.dio(
      gh<String>(instanceName: 'base_url'),
      gh<_i3.AuthInterceptor>(),
    ));
    gh.singleton<_i7.RestaurantService>(
        restaurantDiModule.service(gh<_i6.Dio>()));
    gh.singleton<_i8.RestaurantRepository>(
        restaurantDiModule.restaurantRepository);
    gh.factory<_i9.SearchRestaurantUsecase>(() => restaurantDiModule
        .searchRestaurantUsecase(gh<_i8.RestaurantRepository>()));
    gh.factory<_i10.AddReviewUsecase>(() =>
        restaurantDiModule.addReviewUsecase(gh<_i8.RestaurantRepository>()));
    gh.factory<_i11.GetDetailRestaurantUsecase>(() => restaurantDiModule
        .getDetailRestaurantUsecase(gh<_i8.RestaurantRepository>()));
    gh.factory<_i12.GetRestaurantUsecase>(() => restaurantDiModule
        .getRestaurantUsecase(gh<_i8.RestaurantRepository>()));
    return this;
  }
}

class _$NetworkModule extends _i13.NetworkModule {}

class _$LocalModule extends _i14.LocalModule {}

class _$RestaurantDiModule extends _i15.RestaurantDiModule {
  _$RestaurantDiModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i16.RestaurantRepositoryImpl get restaurantRepository =>
      _i16.RestaurantRepositoryImpl(_getIt<_i7.RestaurantService>());
}
