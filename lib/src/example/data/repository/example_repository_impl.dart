import 'package:restaurant_app/core/utils/future_util.dart';
import 'package:restaurant_app/core/utils/typedef_util.dart';
import 'package:restaurant_app/src/example/data/remote/responses/post_response.dart';
import 'package:restaurant_app/src/example/data/remote/services/example_service.dart';
import 'package:restaurant_app/src/example/data/repository/example_repository.dart';

class ExampleRepositoryImpl extends ExampleRepository {
  final ExampleService exampleService;

  ExampleRepositoryImpl(this.exampleService);

  @override
  FutureOrError<List<PostResponse>> getPosts() {
    return callOrError(() => exampleService.getPosts());
  }
}
