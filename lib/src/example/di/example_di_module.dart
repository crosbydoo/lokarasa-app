import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_app/src/example/data/remote/services/example_service.dart';
import 'package:restaurant_app/src/example/data/repository/example_repository.dart';
import 'package:restaurant_app/src/example/data/repository/example_repository_impl.dart';
import 'package:restaurant_app/src/example/domain/usecases/get_post_usecase.dart';

@module
abstract class ExampleDiModule {
  @singleton
  ExampleService exampleService(Dio dio) => ExampleService(dio);

  @Singleton(as: ExampleRepository)
  ExampleRepositoryImpl get exampleRepository;

  @injectable
  GetPostUseCase getPostUseCase(ExampleRepository repository) =>
      GetPostUseCase(repository);
}
